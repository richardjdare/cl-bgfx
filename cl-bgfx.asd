;;;; cl-bgfx.asd

(asdf:defsystem :cl-bgfx
  :description "Common Lisp bindings for the BGFX graphics library"
  :author "Richard Dare"
  :license "BSD 2-clause license"
  :depends-on (:cffi :trivial-main-thread)
  :serial t
  :components ((:file "package")
	       (:file "ffi")
	       (:file "defines")
               (:file "cl-bgfx")))


(asdf:defsystem :cl-bgfx-examples
  :description "Basic examples"
  :author "Richard Dare"
  :license "BSD 2-clause license"
  :depends-on (:cl-bgfx #:ftw)
  :serial t
  :components ((:file "examples/package")
	       (:file "examples/basic-example")))
