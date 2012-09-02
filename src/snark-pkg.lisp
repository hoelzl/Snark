;;; -*- Mode: Lisp; Syntax: Common-Lisp; Package: common-lisp-user -*-
;;; File: snark-pkg.lisp
;;; The contents of this file are subject to the Mozilla Public License
;;; Version 1.1 (the "License"); you may not use this file except in
;;; compliance with the License. You may obtain a copy of the License at
;;; http://www.mozilla.org/MPL/
;;;
;;; Software distributed under the License is distributed on an "AS IS"
;;; basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
;;; License for the specific language governing rights and limitations
;;; under the License.
;;;
;;; The Original Code is SNARK.
;;; The Initial Developer of the Original Code is SRI International.
;;; Portions created by the Initial Developer are Copyright (C) 1981-2012.
;;; All Rights Reserved.
;;;
;;; Contributor(s): Mark E. Stickel <stickel@ai.sri.com>.

(in-package :common-lisp-user)

;;; package definitions for snark system

(defpackage :snark
  (:use :common-lisp
	:snark-lisp
        :snark-deque
	:snark-sparse-array
        :snark-numbering
	:snark-agenda
	:snark-infix-reader
        :snark-feature
        :snark-dpll)
  (:import-from :common-lisp-user #:*compile-me*)
  (:shadow #:terpri)
  #-gcl (:shadow #:assert #:substitute #:variable #:row #:rows)
  (:export
   #:*hash-dollar-package* #:*hash-dollar-readtable* #:hash-dollar-prin1 #:hash-dollar-print
   #:*compile-me*
   #:profile #:sprofile
   #:can-be-constant-name
   #:can-be-free-variable-name
   #:declare-cancellation-law
   #:declare-snark-option
   #:derivation-subsort-forms
   #:function-logical-symbol-p
   #:function-symbol-p
   #:input-constant-symbol
   #:input-function-symbol
   #:input-relation-symbol
   #:input-proposition-symbol
   #:input-term
   #:input-wff
   #:atom-with-keywords-inputter
   #:set-options #:let-options
   #:make-snark-system
   #:map-rows
   #:matches-compound		;rewrite-compiler
   #:matches-constant		;rewrite-compiler
   #:print-agendas
   #:print-ancestry
   #:print-options
   #:print-rewrites
   #:print-row
   #:print-rows
   #:print-feature-tree
   #:print-row-term
   #:print-sort-theory
   #:print-summary
   #:print-symbol-ordering
   #:print-symbol-table
   #:print-term
   #:read-assertion-file
   #:refute-file
   #:do-tptp-problem #:do-tptp-problem0 #:do-tptp-problem1
   #:sort-name-p
   #:sortal
   #:temporal
   #:term-to-lisp
   #:var

   #:initialize #:assume #:prove #:hint #:closure #:proof #:proofs #:answer #:answers
   #:new-prove

   #:give #:factor #:resolve #:hyperresolve #:negative-hyperresolve
   #:paramodulate #:paramodulate-by #:ur-resolve #:rewrite #:condense
   #:row #:rows #:name-row #:last-row #:it #:mark-as-given
   #:delete-row #:delete-rows
   #:assert-rewrite

   #:make-row-context #:delete-row-context #:in-row-context
   #:push-row-context #:pop-row-context #:new-row-context
   #:current-row-context #:root-row-context

   #:dereference
   #:variable-p #:constant-p #:compound-p #:head #:args #:arg1 #:arg2
   #:make-compound #:make-compound*
   #:equal-p #:unify
   #:constant-sort #:variable-sort #:term-sort
   #:constant-name
   #:function-name #:function-arity
   #:row-name #:row-number #:row-name-or-number #:row-wff #:row-answer #:row-constraints
   #:row-constrained-p #:row-ancestry #:row-reason #:row-rewrites-used #:row-parents

   #:constant-documentation #:constant-author #:constant-source
   #:function-documentation #:function-author #:function-source
   #:sort-documentation #:sort-author #:sort-source
   #:row-documentation #:row-author #:row-source #:row-input-wff

   #:answer-if
   #:~ #:&
   #:=> #:<=>
   #:? #:?x #:?y #:?z #:?u #:?v #:?w #:_
   #:-- #:---

   #:symbol-table-entries #:symbol-table-constant? #:symbol-table-function? #:symbol-table-relation?

   #:read-infix-term
   #:initialize-operator-syntax #:declare-operator-syntax #:declare-tptp-operators

   #:assertion #:assumption #:conjecture #:negated_conjecture #:combine #:embed #:purify

   #:|cnf| #:|fof| #:|tff|	;for TPTP
   #:|axiom| #:|conjecture| #:|negated_conjecture| #:|assumption| #:|hypothesis|
   #:|question| #:|negated_question|
   #:|type| 
   #:|$tType| #:|$i| #:|$o| #:|$int| #:|$rat| #:|$real|
   #:|$true| #:|$false|
   #:|file|
   #:|include|

   #:declare-constant #:declare-proposition
   #:declare-function #:declare-relation
   #:declare-variable

   #:declare-ordering-greaterp

   #:declare-sort #:declare-subsort #:declare-sorts-incompatible
   #:the-sort
   #:sort-name
   #:sort-intersection
   #:subsort? #:sort-disjoint?

   #:top-sort #:top-sort-a

   #:declare-tptp-sort #:tptp-nonnumber

   #:literal-ordering-a #:literal-ordering-n #:literal-ordering-p

   #:checkpoint-theory #:uncheckpoint-theory #:restore-theory
   #:suspend-snark #:resume-snark #:suspend-and-resume-snark

   #:fifo #:lifo
   #:row-depth #:row-size #:row-weight #:row-level
   #:row-size+depth #:row-weight+depth
   #:row-size+depth+level #:row-weight+depth+level
   #:row-weight-limit-exceeded #:row-weight-before-simplification-limit-exceeded
   #:row-wff&answer-weight+depth #:row-neg-size+depth

   #:in-language #:in-kb
   #:when-system
   #:has-author #:has-source #:my-source
   #:has-documentation #:has-name
   #:undefined

   #:declare-jepd-relations
   #:declare-rcc8-relations
   #:declare-time-relations
   #:region #:time-interval #:time-point
   #:$$date-point #:$$utime-point
   #:$$date-interval #:$$utime-interval

   #:$$rcc8-dc #:$$rcc8-ec #:$$rcc8-po #:$$rcc8-tpp #:$$rcc8-ntpp #:$$rcc8-tppi #:$$rcc8-ntppi #:$$rcc8-eq
   #:$$rcc8-dr #:$$rcc8-pp #:$$rcc8-p #:$$rcc8-ppi #:$$rcc8-pi #:$$rcc8-o #:$$rcc8-c
   #:$$rcc8-tp #:$$rcc8-tpi
   #:$$rcc8-not-tpp #:$$rcc8-not-ntpp #:$$rcc8-not-ec #:$$rcc8-not-po #:$$rcc8-not-eq #:$$rcc8-not-ntppi
   #:$$rcc8-not-tppi #:$$rcc8-not-pp #:$$rcc8-not-p #:$$rcc8-not-ppi #:$$rcc8-not-pi #:$$rcc8-not-tp #:$$rcc8-not-tpi

   ;; 3 primitive temporal point-point relations
   #:$$time-pp-before #:$$time-pp-equal #:$$time-pp-after

   ;; nonprimitive temporal point-point relations
   #:$$time-pp-not-before #:$$time-pp-not-equal #:$$time-pp-not-after

   ;; 13 primitive temporal interval-interval relations
   #:$$time-ii-before #:$$time-ii-during #:$$time-ii-overlaps #:$$time-ii-meets #:$$time-ii-starts
   #:$$time-ii-finishes #:$$time-ii-equal #:$$time-ii-finished-by #:$$time-ii-started-by
   #:$$time-ii-met-by #:$$time-ii-overlapped-by #:$$time-ii-contains #:$$time-ii-after
   #:$$time-ii-contained-by	;alias of time-ii-during

   ;; nonprimitive temporal interval-interval relations
   #:$$time-ii-starts-before #:$$time-ii-starts-equal #:$$time-ii-starts-after
   #:$$time-ii-finishes-before #:$$time-ii-finishes-equal #:$$time-ii-finishes-after
   #:$$time-ii-subsumes #:$$time-ii-subsumed-by
   #:$$time-ii-disjoint #:$$time-ii-intersects
   #:$$time-ii-not-before #:$$time-ii-not-during #:$$time-ii-not-overlaps #:$$time-ii-not-meets
   #:$$time-ii-not-starts #:$$time-ii-not-finishes #:$$time-ii-not-equal
   #:$$time-ii-not-finished-by #:$$time-ii-not-started-by
   #:$$time-ii-not-met-by #:$$time-ii-not-overlapped-by #:$$time-ii-not-contains #:$$time-ii-not-after
   #:$$time-ii-not-starts-before #:$$time-ii-not-starts-equal #:$$time-ii-not-starts-after
   #:$$time-ii-not-finishes-before #:$$time-ii-not-finishes-equal #:$$time-ii-not-finishes-after
   #:$$time-ii-not-subsumes #:$$time-ii-not-subsumed-by

   ;; 5 primitive temporal point-interval relations
   #:$$time-pi-before #:$$time-pi-starts #:$$time-pi-during #:$$time-pi-finishes #:$$time-pi-after
   #:$$time-ip-before #:$$time-ip-started-by #:$$time-ip-contains #:$$time-ip-finished-by #:$$time-ip-after
   #:$$time-pi-contained-by	;alias of time-pi-during

   ;; nonprimitive temporal point-interval relations
   #:$$time-pi-disjoint #:$$time-pi-intersects
   #:$$time-pi-not-before #:$$time-pi-not-starts #:$$time-pi-not-during #:$$time-pi-not-finishes #:$$time-pi-not-after
   #:$$time-ip-disjoint #:$$time-ip-intersects
   #:$$time-ip-not-after #:$$time-ip-not-started-by #:$$time-ip-not-contains #:$$time-ip-not-finished-by #:$$time-ip-not-before

   #:$$numberp #:$$realp #:$$rationalp #:$$integerp #:$$naturalp #:$$complexp

   #:$$eq
   #:$$less
   #:$$lesseq
   #:$$greater
   #:$$greatereq
   #:$$sum
   #:$$product
   #:$$difference
   #:$$uminus
   #:$$quotient
   #:$$reciprocal
   #:$$abs
   #:$$realpart
   #:$$imagpart
   #:$$floor
   #:$$ceiling
   #:$$truncate
   #:$$round
   #:$$quotient_f #:$$quotient_c #:$$quotient_t #:$$quotient_r #:$$quotient_e
   #:$$remainder_f #:$$remainder_c #:$$remainder_t #:$$remainder_r #:$$remainder_e

   #:$$eqe

   #:$$quote

   #:$$cons #:$$list #:$$list*
   #:$$listp
;; #:$$term-to-list #:$$list-to-term #:$$list-to-atom

   #:$$stringp #:$$string-to-list #:$$list-to-string

   #:$$bag #:$$bag*
   #:$$bag-union
   #:$$bagp
   #:$$bag-to-list #:$$list-to-bag

   #:bag

   #:$$flat-bag #:$$flat-list #:$$empty-flat-bag #:$$empty-flat-list

   #:positive       #:positive-real    #:positive-rational    #:positive-integer    #:positive-number
   #:negative       #:negative-real    #:negative-rational    #:negative-integer    #:negative-number
   #:nonnegative #:nonnegative-real #:nonnegative-rational #:nonnegative-integer #:nonnegative-number
   #:nonzero         #:nonzero-real     #:nonzero-rational     #:nonzero-integer     #:nonzero-number
   #:nonpositive
   #:zero
   #:natural

   #:the-string
   #:the-list
   #:the-bag
   #:the-number #:the-real #:the-complex
   #:the-rational
   #:the-integer

   #:the-positive
   #:the-negative
   #:the-nonpositive
   #:the-nonnegative
   #:the-nonzero
   #:the-zero

   #:the-positive-integer
   #:the-nonnegative-integer
   #:the-natural

   #:*tptp-environment-variable*
   #:*tptp-format*
   #:*tptp-input-directory*
   #:*tptp-input-directory-has-domain-subdirectories*
   #:*tptp-input-file-type*
   #:*tptp-output-directory*
   #:*tptp-output-directory-has-domain-subdirectories*
   #:*tptp-output-file-type*

   #:save-snark-system
   #:with-no-output
   )
  ;; Additionally export the symbols defined by features, otherwise
  ;; SBCL refuses to recompile the package declaration.
  (:export
   #:1-ary-functions>2-ary-functions-in-default-ordering
   #:1-ary-functions>2-ary-functions-in-default-ordering?
   #:agenda-length-before-simplification-limit
   #:agenda-length-before-simplification-limit?
   #:agenda-length-limit
   #:agenda-length-limit?
   #:agenda-ordering-function
   #:agenda-ordering-function?
   #:allow-skolem-symbols-in-answers
   #:allow-skolem-symbols-in-answers?
   #:assert-context
   #:assert-context?
   #:assert-sequential
   #:assert-sequential?
   #:assert-supported
   #:assert-supported?
   #:assertion-file-commands
   #:assertion-file-commands?
   #:assertion-file-format
   #:assertion-file-format?
   #:assertion-file-if-does-not-exist
   #:assertion-file-if-does-not-exist?
   #:assertion-file-keywords
   #:assertion-file-keywords?
   #:assertion-file-negate-conjectures
   #:assertion-file-negate-conjectures?
   #:assertion-file-package
   #:assertion-file-package?
   #:assertion-file-readtable
   #:assertion-file-readtable?
   #:assertion-file-verbose
   #:assertion-file-verbose?
   #:assume-sequential
   #:assume-sequential?
   #:assume-supported
   #:assume-supported?
   #:bag-weight-factorial
   #:bag-weight-factorial?
   #:builtin-constant-weight
   #:builtin-constant-weight?
   #:changeable-properties-of-locked-constant
   #:changeable-properties-of-locked-constant?
   #:changeable-properties-of-locked-function
   #:changeable-properties-of-locked-function?
   #:declare-root-sort
   #:declare-root-sort?
   #:declare-string-sort
   #:declare-string-sort?
   #:default-1-ary-functions>2-ary-functions-in-default-ordering
   #:default-1-ary-functions>2-ary-functions-in-default-ordering?
   #:default-agenda-length-before-simplification-limit
   #:default-agenda-length-before-simplification-limit?
   #:default-agenda-length-limit
   #:default-agenda-length-limit?
   #:default-agenda-ordering-function
   #:default-agenda-ordering-function?
   #:default-allow-skolem-symbols-in-answers
   #:default-allow-skolem-symbols-in-answers?
   #:default-assert-context
   #:default-assert-context?
   #:default-assert-sequential
   #:default-assert-sequential?
   #:default-assert-supported
   #:default-assert-supported?
   #:default-assertion-file-commands
   #:default-assertion-file-commands?
   #:default-assertion-file-format
   #:default-assertion-file-format?
   #:default-assertion-file-if-does-not-exist
   #:default-assertion-file-if-does-not-exist?
   #:default-assertion-file-keywords
   #:default-assertion-file-keywords?
   #:default-assertion-file-negate-conjectures
   #:default-assertion-file-negate-conjectures?
   #:default-assertion-file-package
   #:default-assertion-file-package?
   #:default-assertion-file-readtable
   #:default-assertion-file-readtable?
   #:default-assertion-file-verbose
   #:default-assertion-file-verbose?
   #:default-assume-sequential
   #:default-assume-sequential?
   #:default-assume-supported
   #:default-assume-supported?
   #:default-bag-weight-factorial
   #:default-bag-weight-factorial?
   #:default-builtin-constant-weight
   #:default-builtin-constant-weight?
   #:default-changeable-properties-of-locked-constant
   #:default-changeable-properties-of-locked-constant?
   #:default-changeable-properties-of-locked-function
   #:default-changeable-properties-of-locked-function?
   #:default-declare-root-sort
   #:default-declare-root-sort?
   #:default-declare-string-sort
   #:default-declare-string-sort?
   #:default-eliminate-negations
   #:default-eliminate-negations?
   #:default-ex-join-negation
   #:default-ex-join-negation?
   #:default-feature-vector-symbol-number-folding
   #:default-feature-vector-symbol-number-folding?
   #:default-flatten-connectives
   #:default-flatten-connectives?
   #:default-input-floats-as-ratios
   #:default-input-floats-as-ratios?
   #:default-kbo-builtin-constant-weight
   #:default-kbo-builtin-constant-weight?
   #:default-kbo-status
   #:default-kbo-status?
   #:default-kbo-variable-weight
   #:default-kbo-variable-weight?
   #:default-level-pref-for-giving
   #:default-level-pref-for-giving?
   #:default-listen-for-commands
   #:default-listen-for-commands?
   #:default-meter-unify-bag
   #:default-meter-unify-bag?
   #:default-number-of-given-rows-limit
   #:default-number-of-given-rows-limit?
   #:default-number-of-rows-limit
   #:default-number-of-rows-limit?
   #:default-ordering-functions>constants
   #:default-ordering-functions>constants?
   #:default-partition-communication-table
   #:default-partition-communication-table?
   #:default-print-agenda-when-finished
   #:default-print-agenda-when-finished?
   #:default-print-assertion-analysis-notes
   #:default-print-assertion-analysis-notes?
   #:default-print-clocks-when-finished
   #:default-print-clocks-when-finished?
   #:default-print-final-rows
   #:default-print-final-rows?
   #:default-print-given-row-lines-printing
   #:default-print-given-row-lines-printing?
   #:default-print-given-row-lines-signalling
   #:default-print-given-row-lines-signalling?
   #:default-print-irrelevant-rows
   #:default-print-irrelevant-rows?
   #:default-print-options-when-starting
   #:default-print-options-when-starting?
   #:default-print-pure-rows
   #:default-print-pure-rows?
   #:default-print-rewrite-orientation
   #:default-print-rewrite-orientation?
   #:default-print-row-answers
   #:default-print-row-answers?
   #:default-print-row-constraints
   #:default-print-row-constraints?
   #:default-print-row-goals
   #:default-print-row-goals?
   #:default-print-row-length-limit
   #:default-print-row-length-limit?
   #:default-print-row-partitions
   #:default-print-row-partitions?
   #:default-print-row-reasons
   #:default-print-row-reasons?
   #:default-print-row-wffs-prettily
   #:default-print-row-wffs-prettily?
   #:default-print-rows-prettily
   #:default-print-rows-prettily?
   #:default-print-rows-shortened
   #:default-print-rows-shortened?
   #:default-print-rows-test
   #:default-print-rows-test?
   #:default-print-rows-when-derived
   #:default-print-rows-when-derived?
   #:default-print-rows-when-finished
   #:default-print-rows-when-finished?
   #:default-print-rows-when-given
   #:default-print-rows-when-given?
   #:default-print-rows-when-processed
   #:default-print-rows-when-processed?
   #:default-print-summary-when-finished
   #:default-print-summary-when-finished?
   #:default-print-symbol-table-warnings
   #:default-print-symbol-table-warnings?
   #:default-print-term-memory-when-finished
   #:default-print-term-memory-when-finished?
   #:default-print-time-used
   #:default-print-time-used?
   #:default-print-unorientable-rows
   #:default-print-unorientable-rows?
   #:default-prove-closure
   #:default-prove-closure?
   #:default-prove-sequential
   #:default-prove-sequential?
   #:default-prove-supported
   #:default-prove-supported?
   #:default-pruning-tests
   #:default-pruning-tests-before-simplification
   #:default-pruning-tests-before-simplification?
   #:default-pruning-tests?
   #:default-rcc8-region-sort-name
   #:default-rcc8-region-sort-name?
   #:default-refute-file-actions
   #:default-refute-file-actions?
   #:default-refute-file-closure
   #:default-refute-file-closure?
   #:default-refute-file-if-exists
   #:default-refute-file-if-exists?
   #:default-refute-file-ignore-errors
   #:default-refute-file-ignore-errors?
   #:default-refute-file-initialize
   #:default-refute-file-initialize?
   #:default-refute-file-options
   #:default-refute-file-options?
   #:default-refute-file-output-file
   #:default-refute-file-output-file?
   #:default-refute-file-verbose
   #:default-refute-file-verbose?
   #:default-rewrite-answers
   #:default-rewrite-answers?
   #:default-rewrite-constraints
   #:default-rewrite-constraints?
   #:default-row-argument-count-limit
   #:default-row-argument-count-limit?
   #:default-row-weight-before-simplification-limit
   #:default-row-weight-before-simplification-limit?
   #:default-row-weight-limit
   #:default-row-weight-limit?
   #:default-rpo-status
   #:default-rpo-status?
   #:default-run-time-limit
   #:default-run-time-limit?
   #:default-test-option14
   #:default-test-option14?
   #:default-test-option17
   #:default-test-option17?
   #:default-test-option18
   #:default-test-option18?
   #:default-test-option19
   #:default-test-option19?
   #:default-test-option2
   #:default-test-option20
   #:default-test-option20?
   #:default-test-option21
   #:default-test-option21?
   #:default-test-option23
   #:default-test-option23?
   #:default-test-option29
   #:default-test-option29?
   #:default-test-option2?
   #:default-test-option3
   #:default-test-option30
   #:default-test-option30?
   #:default-test-option36
   #:default-test-option36?
   #:default-test-option37
   #:default-test-option37?
   #:default-test-option38
   #:default-test-option38?
   #:default-test-option39
   #:default-test-option39?
   #:default-test-option3?
   #:default-test-option40
   #:default-test-option40?
   #:default-test-option41
   #:default-test-option41?
   #:default-test-option42
   #:default-test-option42?
   #:default-test-option43
   #:default-test-option43?
   #:default-test-option44
   #:default-test-option44?
   #:default-test-option45
   #:default-test-option45?
   #:default-test-option49
   #:default-test-option49?
   #:default-test-option50
   #:default-test-option50?
   #:default-test-option51
   #:default-test-option51?
   #:default-test-option52
   #:default-test-option52?
   #:default-test-option53
   #:default-test-option53?
   #:default-test-option54
   #:default-test-option54?
   #:default-test-option55
   #:default-test-option55?
   #:default-test-option56
   #:default-test-option56?
   #:default-test-option57
   #:default-test-option57?
   #:default-test-option58
   #:default-test-option58?
   #:default-test-option59
   #:default-test-option59?
   #:default-test-option6
   #:default-test-option60
   #:default-test-option60?
   #:default-test-option6?
   #:default-test-option8
   #:default-test-option8?
   #:default-test-option9
   #:default-test-option9?
   #:default-time-interval-sort-name
   #:default-time-interval-sort-name?
   #:default-time-point-sort-name
   #:default-time-point-sort-name?
   #:default-trace-dp-refute
   #:default-trace-dp-refute?
   #:default-trace-dpll-subsumption
   #:default-trace-dpll-subsumption?
   #:default-trace-optimize-sparse-vector-expression
   #:default-trace-optimize-sparse-vector-expression?
   #:default-trace-rewrite
   #:default-trace-rewrite?
   #:default-trace-unify
   #:default-trace-unify-bag-basis
   #:default-trace-unify-bag-basis?
   #:default-trace-unify-bag-bindings
   #:default-trace-unify-bag-bindings?
   #:default-trace-unify?
   #:default-unify-bag-basis-size-limit
   #:default-unify-bag-basis-size-limit?
   #:default-use-ac-connectives
   #:default-use-ac-connectives?
   #:default-use-answers-during-subsumption
   #:default-use-answers-during-subsumption?
   #:default-use-assertion-analysis
   #:default-use-assertion-analysis?
   #:default-use-associative-identity
   #:default-use-associative-identity?
   #:default-use-associative-unification
   #:default-use-associative-unification?
   #:default-use-clausification
   #:default-use-clausification?
   #:default-use-closure-when-satisfiable
   #:default-use-closure-when-satisfiable?
   #:default-use-condensing
   #:default-use-condensing?
   #:default-use-conditional-answer-creation
   #:default-use-conditional-answer-creation?
   #:default-use-constraint-purification
   #:default-use-constraint-purification?
   #:default-use-constraint-solver-in-subsumption
   #:default-use-constraint-solver-in-subsumption?
   #:default-use-constructive-answer-restriction
   #:default-use-constructive-answer-restriction?
   #:default-use-default-ordering
   #:default-use-default-ordering?
   #:default-use-dp-subsumption
   #:default-use-dp-subsumption?
   #:default-use-embedded-rewrites
   #:default-use-embedded-rewrites?
   #:default-use-equality-elimination
   #:default-use-equality-elimination?
   #:default-use-equality-factoring
   #:default-use-equality-factoring?
   #:default-use-extended-implications
   #:default-use-extended-implications?
   #:default-use-extended-quantifiers
   #:default-use-extended-quantifiers?
   #:default-use-factoring
   #:default-use-factoring?
   #:default-use-function-creation
   #:default-use-function-creation?
   #:default-use-hyperresolution
   #:default-use-hyperresolution?
   #:default-use-indefinite-answers
   #:default-use-indefinite-answers?
   #:default-use-input-restriction
   #:default-use-input-restriction?
   #:default-use-literal-ordering-with-hyperresolution
   #:default-use-literal-ordering-with-hyperresolution?
   #:default-use-literal-ordering-with-negative-hyperresolution
   #:default-use-literal-ordering-with-negative-hyperresolution?
   #:default-use-literal-ordering-with-paramodulation
   #:default-use-literal-ordering-with-paramodulation?
   #:default-use-literal-ordering-with-resolution
   #:default-use-literal-ordering-with-resolution?
   #:default-use-literal-ordering-with-ur-resolution
   #:default-use-literal-ordering-with-ur-resolution?
   #:default-use-lookahead-in-dpll-for-subsumption
   #:default-use-lookahead-in-dpll-for-subsumption?
   #:default-use-magic-transformation
   #:default-use-magic-transformation?
   #:default-use-negative-hyperresolution
   #:default-use-negative-hyperresolution?
   #:default-use-paramodulation
   #:default-use-paramodulation-only-from-units
   #:default-use-paramodulation-only-from-units?
   #:default-use-paramodulation-only-into-units
   #:default-use-paramodulation-only-into-units?
   #:default-use-paramodulation?
   #:default-use-partitions
   #:default-use-partitions?
   #:default-use-purity-test
   #:default-use-purity-test?
   #:default-use-quantifier-preservation
   #:default-use-quantifier-preservation?
   #:default-use-relevance-test
   #:default-use-relevance-test?
   #:default-use-replacement-resolution-with-x=x
   #:default-use-replacement-resolution-with-x=x?
   #:default-use-resolution
   #:default-use-resolution?
   #:default-use-resolve-code
   #:default-use-resolve-code?
   #:default-use-simplification-by-equalities
   #:default-use-simplification-by-equalities?
   #:default-use-simplification-by-units
   #:default-use-simplification-by-units?
   #:default-use-single-replacement-paramodulation
   #:default-use-single-replacement-paramodulation?
   #:default-use-sort-relativization
   #:default-use-sort-relativization?
   #:default-use-subsume-bag
   #:default-use-subsume-bag?
   #:default-use-subsumption
   #:default-use-subsumption-by-false
   #:default-use-subsumption-by-false?
   #:default-use-subsumption?
   #:default-use-term-memory-deletion
   #:default-use-term-memory-deletion?
   #:default-use-term-ordering
   #:default-use-term-ordering-cache
   #:default-use-term-ordering-cache?
   #:default-use-term-ordering?
   #:default-use-to-lisp-code
   #:default-use-to-lisp-code?
   #:default-use-unit-restriction
   #:default-use-unit-restriction?
   #:default-use-ur-pttp
   #:default-use-ur-pttp?
   #:default-use-ur-resolution
   #:default-use-ur-resolution?
   #:default-use-variable-name-sorts
   #:default-use-variable-name-sorts?
   #:default-use-well-sorting
   #:default-use-well-sorting?
   #:default-variable-sort-marker
   #:default-variable-sort-marker?
   #:default-variable-symbol-prefixes
   #:default-variable-symbol-prefixes?
   #:default-variable-to-lisp-code
   #:default-variable-to-lisp-code?
   #:default-variable-weight
   #:default-variable-weight?
   #:eliminate-negations
   #:eliminate-negations?
   #:ex-join-negation
   #:ex-join-negation?
   #:feature-vector-symbol-number-folding
   #:feature-vector-symbol-number-folding?
   #:flatten-connectives
   #:flatten-connectives?
   #:input-floats-as-ratios
   #:input-floats-as-ratios?
   #:kbo-builtin-constant-weight
   #:kbo-builtin-constant-weight?
   #:kbo-status
   #:kbo-status?
   #:kbo-variable-weight
   #:kbo-variable-weight?
   #:level-pref-for-giving
   #:level-pref-for-giving?
   #:listen-for-commands
   #:listen-for-commands?
   #:meter-unify-bag
   #:meter-unify-bag?
   #:number-of-given-rows-limit
   #:number-of-given-rows-limit?
   #:number-of-rows-limit
   #:number-of-rows-limit?
   #:ordering-functions>constants
   #:ordering-functions>constants?
   #:partition-communication-table
   #:partition-communication-table?
   #:print-agenda-when-finished
   #:print-agenda-when-finished?
   #:print-assertion-analysis-notes
   #:print-assertion-analysis-notes?
   #:print-clocks-when-finished
   #:print-clocks-when-finished?
   #:print-final-rows
   #:print-final-rows?
   #:print-given-row-lines-printing
   #:print-given-row-lines-printing?
   #:print-given-row-lines-signalling
   #:print-given-row-lines-signalling?
   #:print-irrelevant-rows
   #:print-irrelevant-rows?
   #:print-options-when-starting
   #:print-options-when-starting?
   #:print-pure-rows
   #:print-pure-rows?
   #:print-rewrite-orientation
   #:print-rewrite-orientation?
   #:print-row-answers
   #:print-row-answers?
   #:print-row-constraints
   #:print-row-constraints?
   #:print-row-goals
   #:print-row-goals?
   #:print-row-length-limit
   #:print-row-length-limit?
   #:print-row-partitions
   #:print-row-partitions?
   #:print-row-reasons
   #:print-row-reasons?
   #:print-row-wffs-prettily
   #:print-row-wffs-prettily?
   #:print-rows-prettily
   #:print-rows-prettily?
   #:print-rows-shortened
   #:print-rows-shortened?
   #:print-rows-test
   #:print-rows-test?
   #:print-rows-when-derived
   #:print-rows-when-derived?
   #:print-rows-when-finished
   #:print-rows-when-finished?
   #:print-rows-when-given
   #:print-rows-when-given?
   #:print-rows-when-processed
   #:print-rows-when-processed?
   #:print-summary-when-finished
   #:print-summary-when-finished?
   #:print-symbol-table-warnings
   #:print-symbol-table-warnings?
   #:print-term-memory-when-finished
   #:print-term-memory-when-finished?
   #:print-time-used
   #:print-time-used?
   #:print-unorientable-rows
   #:print-unorientable-rows?
   #:prove-closure
   #:prove-closure?
   #:prove-sequential
   #:prove-sequential?
   #:prove-supported
   #:prove-supported?
   #:pruning-tests
   #:pruning-tests-before-simplification
   #:pruning-tests-before-simplification?
   #:pruning-tests?
   #:rcc8-region-sort-name
   #:rcc8-region-sort-name?
   #:refute-file-actions
   #:refute-file-actions?
   #:refute-file-closure
   #:refute-file-closure?
   #:refute-file-if-exists
   #:refute-file-if-exists?
   #:refute-file-ignore-errors
   #:refute-file-ignore-errors?
   #:refute-file-initialize
   #:refute-file-initialize?
   #:refute-file-options
   #:refute-file-options?
   #:refute-file-output-file
   #:refute-file-output-file?
   #:refute-file-verbose
   #:refute-file-verbose?
   #:rewrite-answers
   #:rewrite-answers?
   #:rewrite-constraints
   #:rewrite-constraints?
   #:row-argument-count-limit
   #:row-argument-count-limit?
   #:row-weight-before-simplification-limit
   #:row-weight-before-simplification-limit?
   #:row-weight-limit
   #:row-weight-limit?
   #:rpo-status
   #:rpo-status?
   #:run-time-limit
   #:run-time-limit?
   #:test-option14
   #:test-option14?
   #:test-option17
   #:test-option17?
   #:test-option18
   #:test-option18? 
   #:test-option19
   #:test-option19?
   #:test-option2
   #:test-option20
   #:test-option20?
   #:test-option21
   #:test-option21?
   #:test-option23
   #:test-option23?
   #:test-option29
   #:test-option29?
   #:test-option2?
   #:test-option3
   #:test-option30
   #:test-option30?
   #:test-option36
   #:test-option36?
   #:test-option37
   #:test-option37?
   #:test-option38
   #:test-option38?
   #:test-option39
   #:test-option39?
   #:test-option3?
   #:test-option40
   #:test-option40?
   #:test-option41
   #:test-option41?
   #:test-option42
   #:test-option42?
   #:test-option43
   #:test-option43?
   #:test-option44
   #:test-option44?
   #:test-option45
   #:test-option45?
   #:test-option49
   #:test-option49?
   #:test-option50
   #:test-option50?
   #:test-option51
   #:test-option51?
   #:test-option52
   #:test-option52?
   #:test-option53
   #:test-option53?
   #:test-option54
   #:test-option54?
   #:test-option55
   #:test-option55?
   #:test-option56
   #:test-option56?
   #:test-option57
   #:test-option57?
   #:test-option58
   #:test-option58?
   #:test-option59
   #:test-option59?
   #:test-option6
   #:test-option60
   #:test-option60?
   #:test-option6?
   #:test-option8
   #:test-option8?
   #:test-option9
   #:test-option9?
   #:time-interval-sort-name
   #:time-interval-sort-name?
   #:time-point-sort-name
   #:time-point-sort-name?
   #:trace-dp-refute
   #:trace-dp-refute?
   #:trace-dpll-subsumption
   #:trace-dpll-subsumption?
   #:trace-optimize-sparse-vector-expression
   #:trace-optimize-sparse-vector-expression?
   #:trace-rewrite
   #:trace-rewrite?
   #:trace-unify
   #:trace-unify-bag-basis
   #:trace-unify-bag-basis?
   #:trace-unify-bag-bindings
   #:trace-unify-bag-bindings?
   #:trace-unify?
   #:unify-bag-basis-size-limit
   #:unify-bag-basis-size-limit?
   #:use-ac-connectives
   #:use-ac-connectives?
   #:use-answers-during-subsumption
   #:use-answers-during-subsumption?
   #:use-assertion-analysis
   #:use-assertion-analysis?
   #:use-associative-identity
   #:use-associative-identity?
   #:use-associative-unification
   #:use-associative-unification?
   #:use-clausification
   #:use-clausification?
   #:use-closure-when-satisfiable
   #:use-closure-when-satisfiable?
   #:use-condensing
   #:use-condensing?
   #:use-conditional-answer-creation
   #:use-conditional-answer-creation?
   #:use-constraint-purification
   #:use-constraint-purification?
   #:use-constraint-solver-in-subsumption
   #:use-constraint-solver-in-subsumption?
   #:use-constructive-answer-restriction
   #:use-constructive-answer-restriction?
   #:use-default-ordering
   #:use-default-ordering?
   #:use-dp-subsumption
   #:use-dp-subsumption?
   #:use-embedded-rewrites
   #:use-embedded-rewrites?
   #:use-equality-elimination
   #:use-equality-elimination?
   #:use-equality-factoring
   #:use-equality-factoring?
   #:use-extended-implications
   #:use-extended-implications?
   #:use-extended-quantifiers
   #:use-extended-quantifiers?
   #:use-factoring
   #:use-factoring?
   #:use-function-creation
   #:use-function-creation?
   #:use-hyperresolution
   #:use-hyperresolution?
   #:use-indefinite-answers
   #:use-indefinite-answers?
   #:use-input-restriction
   #:use-input-restriction?
   #:use-literal-ordering-with-hyperresolution
   #:use-literal-ordering-with-hyperresolution?
   #:use-literal-ordering-with-negative-hyperresolution
   #:use-literal-ordering-with-negative-hyperresolution?
   #:use-literal-ordering-with-paramodulation
   #:use-literal-ordering-with-paramodulation?
   #:use-literal-ordering-with-resolution
   #:use-literal-ordering-with-resolution?
   #:use-literal-ordering-with-ur-resolution
   #:use-literal-ordering-with-ur-resolution?
   #:use-lookahead-in-dpll-for-subsumption
   #:use-lookahead-in-dpll-for-subsumption?
   #:use-magic-transformation
   #:use-magic-transformation?
   #:use-negative-hyperresolution
   #:use-negative-hyperresolution?
   #:use-paramodulation
   #:use-paramodulation-only-from-units
   #:use-paramodulation-only-from-units?
   #:use-paramodulation-only-into-units
   #:use-paramodulation-only-into-units?
   #:use-paramodulation?
   #:use-partitions
   #:use-partitions?
   #:use-purity-test
   #:use-purity-test?
   #:use-quantifier-preservation
   #:use-quantifier-preservation?
   #:use-relevance-test
   #:use-relevance-test?
   #:use-replacement-resolution-with-x=x
   #:use-replacement-resolution-with-x=x?
   #:use-resolution
   #:use-resolution?
   #:use-resolve-code
   #:use-resolve-code?
   #:use-simplification-by-equalities
   #:use-simplification-by-equalities?
   #:use-simplification-by-units
   #:use-simplification-by-units?
   #:use-single-replacement-paramodulation
   #:use-single-replacement-paramodulation?
   #:use-sort-relativization
   #:use-sort-relativization?
   #:use-subsume-bag
   #:use-subsume-bag?
   #:use-subsumption
   #:use-subsumption-by-false
   #:use-subsumption-by-false?
   #:use-subsumption?
   #:use-term-memory-deletion
   #:use-term-memory-deletion?
   #:use-term-ordering
   #:use-term-ordering-cache
   #:use-term-ordering-cache?
   #:use-term-ordering?
   #:use-to-lisp-code
   #:use-to-lisp-code?
   #:use-unit-restriction
   #:use-unit-restriction?
   #:use-ur-pttp
   #:use-ur-pttp?
   #:use-ur-resolution
   #:use-ur-resolution?
   #:use-variable-name-sorts
   #:use-variable-name-sorts?
   #:use-well-sorting
   #:use-well-sorting?
   #:variable-sort-marker
   #:variable-sort-marker?
   #:variable-symbol-prefixes
   #:variable-symbol-prefixes?
   #:variable-to-lisp-code
   #:variable-to-lisp-code?
   #:variable-weight
   #:variable-weight?
   ))

(defpackage :snark-user
  (:use :common-lisp
        :snark-lisp
        :snark-deque
        :snark-sparse-array
        :snark-dpll
        :snark)
  (:shadowing-import-from :snark #:assert))

;;; snark-pkg.lisp EOF
