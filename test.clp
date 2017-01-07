(defrule MAIN::boundaryMustRemain
   (isBoundary)
   =>
   (assert (must remain)))

(defrule MAIN::locationCut
   (locationLargerOrEqualsThanNeighbours)
   =>
   (assert (could delete)))

(defrule MAIN::stressCut
   (stressIsLowerOrEqualsAllowable)
   =>
   (assert (could delete)))

(defrule MAIN::stressremain
   (stressIsLargerThanAllowable)
   =>
   (assert (must remain)))

(defrule MAIN::stressSortCut
   (inStressSortRuleCanBeCut)
   =>
   (assert (could delete)))

(defrule MAIN::stressSortRemain
   (inStressSortRuleCanNotBeCut)
   =>
   (assert (should remain)))

(defrule MAIN::outside
   (isoutside)
   =>
   (assert (must delete)))

(defrule MAIN::mustRemain
   (must remain)
   ?delete <- (could delete)
   =>
   (retract ?delete)
   (assert (the answer is remain)))

(defrule MAIN::mustRemainWithoutDelete
   (must remain)
   =>
   (assert (the answer is remain)))

(defrule MAIN::couldDeleteWithoutRemain
   (could delete)
   =>
   (assert (answer is delete)))

(defrule MAIN::shouldRemin
   (should remain)
   =>)

(defrule MAIN::shouldRemain
   (should remain)
   ?couldDelete <- (could Delete)
   =>
   (assert (answer is remain))
   (retract ?couldDelete))

(defrule MAIN::printAnswer
   (answer is ?ans)
   =>
   (printout t "answer is " ?ans))

