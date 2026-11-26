# shellcheck shell=bash

ELAN_VERSION=v4.4.0
PERMITTED_AXIOMS=(propext Quot.sound Classical.choice)

# Kernel primitives comparator exports alongside the theorems (Lake `primitiveTargets`, Lean 4.36).
PRIMITIVE_TARGETS=(Quot Quot.mk Quot.lift Quot.ind Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div
  Nat.mod Nat.beq Nat.ble Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight String.ofList
  Char.ofNat List eagerReduce Nat String String.mk Char optParam autoParam semiOutParam outParam)

log() { printf '==> %s\n' "$*" >&2; }

json_string() {
  sed -n "s/.*\"$1\": *\"\([^\"]*\)\".*/\1/p" "$2" | head -n 1
}

json_theorems() {
  tr -d '\n' <"$1" | sed -n 's/.*"theorem_names": *\[\([^]]*\)\].*/\1/p' | grep -o '"[^"]*"' | tr -d '"'
}

module_path() {
  printf '%s.lean\n' "${1//.//}"
}

task_config() {
  printf 'problems/%s/tasks/%s.json\n' "${1%%/*}" "${1#*/}"
}

file_imports() {
  sed -n -E 's/^[[:space:]]*(public[[:space:]]+)?(meta[[:space:]]+)?import[[:space:]]+(all[[:space:]]+)?([^[:space:]]+).*/\4/p' "$1"
}

# Prints one reason per violation. Comparator rejects bad axioms and statements on its own; these
# rules also keep code that runs during elaboration out of submissions.
lint_proof() {
  local file=$1 challenge=$2 failed=0 import allowed source
  allowed=$(file_imports "$challenge")
  while read -r import; do
    [[ -z $import ]] && continue
    if [[ $import == Mathlib || $import == Mathlib.* ]] || grep -qxF "$import" <<<"$allowed"; then continue; fi
    echo "import not allowed: $import (use Mathlib modules and the task's claims module)"
    failed=1
  done < <(file_imports "$file")

  # Comments are linted too: stripping them would need a Lean lexer, and a banned word in a comment
  # costs the author only a rewording.
  source=$(<"$file")
  local words='sorry|admit|native_decide|bv_decide|run_tac|by_elab|simproc|dsimproc|simproc_decl|term_elab|command_elab|implemented_by|extern|export|ofReduceBool|ofReduceNat|trustCompiler|axiom|unsafe|partial|opaque|initialize|builtin_initialize|run_cmd|run_elab|run_meta|elab|elab_rules|macro|macro_rules|syntax|declare_syntax_cat|notation|infix|infixl|infixr|postfix'
  local hits
  hits=$( {
    grep -n -o -E "(^|[^A-Za-z0-9_.'])($words)([^A-Za-z0-9_']|\$)|\+native|debug\.[A-Za-z.]+" <<<"$source"
    grep -n -o -E '#(eval|exec|exit|reduce|print|check|synth|guard[a-z_]*|time|count_heartbeats|help|where|find|lint|simp|conv|norm_num|widget|html|test|sample)\b' <<<"$source"
    grep -n -o -E '@\[[^]]*\b(tactic|init|env_linter|builtin_[a-z_]+)\b' <<<"$source"
  } | sed -E "s/^([0-9]+):[^A-Za-z0-9_#+]*([A-Za-z0-9_#+.]+).*/\1: \2/" || true)
  if [[ -n $hits ]]; then
    while read -r hit; do echo "line ${hit%%:*}: \`${hit#*: }\` is not allowed in a proof"; done <<<"$hits"
    failed=1
  fi
  hits=$(grep -n -E '"' <<<"$source" | cut -d : -f 1 || true)
  if [[ -n $hits ]]; then
    while read -r hit; do echo "line $hit: string literals are not allowed in a proof"; done <<<"$hits"
    failed=1
  fi
  hits=$(grep -n -o -E 'set_option[[:space:]]+[^[:space:]]+' <<<"$source" |
    grep -v -E 'set_option[[:space:]]+(maxHeartbeats|maxRecDepth|synthInstance\.maxHeartbeats|linter\.[A-Za-z.]+)$' || true)
  if [[ -n $hits ]]; then
    while read -r hit; do echo "line ${hit%%:*}: only maxHeartbeats, maxRecDepth and linter options may be set"; done <<<"$hits"
    failed=1
  fi
  return "$failed"
}

ensure_lean() {
  export ELAN_HOME=${ELAN_HOME:-$HOME/.elan}
  export PATH="$ELAN_HOME/bin:$PATH"
  if ! command -v lake >/dev/null 2>&1; then
    log "Installing elan $ELAN_VERSION into $ELAN_HOME"
    curl -sSfL "https://raw.githubusercontent.com/leanprover/elan/$ELAN_VERSION/elan-init.sh" |
      sh -s -- -y --no-modify-path --default-toolchain none >&2
  fi
  log "Installing the pinned toolchain ($(cat lean-toolchain))"
  lean --version >&2
  PATH="$(lean --print-prefix)/bin:$PATH"
}

local_import_closure() {
  local -a queue=("$@")
  local -A seen=()
  local file import path
  while ((${#queue[@]})); do
    file=${queue[0]}
    queue=("${queue[@]:1}")
    [[ -n ${seen[$file]:-} ]] && continue
    seen[$file]=1
    printf '%s\n' "$file"
    while read -r import; do
      path=$(module_path "$import")
      [[ $import != Mathlib.* && -f $path ]] && queue+=("$path")
    done < <(file_imports "$file")
  done
}

# Resolves the pinned dependencies and downloads the Mathlib build files that the given Lean files
# import, and nothing else. The cache tool follows Mathlib imports only, so the project files in
# between are listed explicitly.
fetch_mathlib() {
  local -a files
  mapfile -t files < <(local_import_closure "$@")
  log "Fetching Mathlib build files imported by ${files[*]}"
  MATHLIB_NO_CACHE_ON_UPDATE=1 lake exe cache get "${files[@]}" >&2
}

# Usage: export_module <module> <export-file> <theorem>...
export_module() {
  local module=$1 file=$2
  shift 2
  lake build "$module" >&2 || return 10
  LEAN_PATH=$(lake env printenv LEAN_PATH) leanexport "$module" -- \
    "$@" "${PERMITTED_AXIOMS[@]}" "${PRIMITIVE_TARGETS[@]}" >"$file" || return 11
}
