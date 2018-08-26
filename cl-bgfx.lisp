;;;; cl-bgfx.lisp

(in-package #:cl-bgfx)

;;; we need to use memset to zero out structs before use
(cffi:defctype size_t #-x86-64 :uint32 #+x86-64 :uint64)

(cffi:defcfun "memset" :pointer
  (s :pointer)
  (c :int)
  (n size_t))

(defun run-bgfx ()
  (trivial-main-thread:with-body-in-main-thread ()
    (print (bgfx-init :BGFX-RENDERER-TYPE-NOOP 0 0 (cffi:null-pointer) (cffi:null-pointer)))
    (bgfx-shutdown)))

(defun bgfx-set-hwnd (hwnd)
  (cffi:with-foreign-object (p '(:struct bgfx-platform-data))
    (memset p 0 (cffi:foreign-type-size '(:struct bgfx-platform-data)))
    (setf (cffi:foreign-slot-value p '(:struct bgfx-platform-data) 'nwh) hwnd)
    (bgfx-set-platform-data p)))
