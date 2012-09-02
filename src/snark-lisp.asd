(asdf:defsystem #:snark-lisp
  :serial t
  :description "The Snark Theorem Prover for Poem"
  :version "20120808.009"
  :author "Mark E. Stickel, SRI International"
  :license "MPL 1.1, see file LICENSE"
  :depends-on (#:snark-auxiliary-packages)
  :components ((:file "mvlet")
	       (:file "progc")
	       (:file "lisp")
	       (:file "collectors")
	       (:file "map-file")
	       (:file "clocks")
	       (:file "counters")
	       (:file "pattern-match")
	       (:file "topological-sort")))

