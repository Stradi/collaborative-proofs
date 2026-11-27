import Proofs.PadovanShift.Plan
import Proofs.PadovanShift.LongShift
import Proofs.PadovanShift.ShortShift

theorem PadovanShift.sixStepRecurrence : PadovanShift.ProblemClaim := PadovanShift.plan PadovanShift.longShift PadovanShift.shortShift
