;;;; basic-example.lisp

(in-package :cl-bgfx-examples)

(defun winmain (class-name wndproc &key (width 800) (height 600))
  (register-class
   class-name 
   wndproc 
   :background (get-sys-color-brush :3d-face)
   :cursor (load-cursor :arrow))
  
  (let ((hwnd
	 (create-window
	  class-name 
	  :window-name class-name 
	  :styles '(:overlapped-window :visible)
	  :x 100 :y 100 :width width :height height))
        (msg (make-msg))
	(bgfx-init))
    
    (unwind-protect
         (progn
           (show-window hwnd)
           (update-window hwnd)
	   (setf bgfx-init (cffi:foreign-alloc '(:struct bgfx-init-s)))
	   (init-bgfx bgfx-init hwnd width height)
	   
	   (loop while (not (equal (msg-message msg) ftw::+wm-quit+)) do
		(if (peek-message
		     msg
		     :hwnd (cffi:null-pointer)
		     :filter-min 0
		     :filter-max 0
		     :remove-msg
		     :remove)
		    (progn
		      (translate-message msg)
		      (dispatch-message msg))
		    (mainloop))))
      (progn
	(bgfx-shutdown)
	(cffi:foreign-free bgfx-init)
	(unregister-class class-name)))))

(defun init-bgfx (bgfx-init hwnd width height)
  (bgfx-set-hwnd hwnd)
  (bgfx-init-ctor bgfx-init)
  (setf (cffi:foreign-slot-value bgfx-init '(:struct bgfx-init-s) 'type) :bgfx-renderer-type-direct3d11)
  (setf (cffi:foreign-slot-value bgfx-init '(:struct bgfx-init-s) 'debug) t)
  (bgfx-init bgfx-init)
  (bgfx-reset width height +BGFX-RESET-VSYNC+)
  (bgfx-set-debug +BGFX-DEBUG-TEXT+)
  (bgfx-set-view-clear 0 3 #x303030ff 1.0 0))

  
(defun mainloop ()
  (bgfx-set-view-clear 0 3 #x303030ff 1.0 0)
  (bgfx-set-view-rect 0 0 0 800 600)
  (bgfx-touch 0)
  (bgfx-dbg-text-clear 0 nil)
  (bgfx-dbg-text-printf 0 1 #x0f "Hello World.")
  (bgfx-frame nil))

(defwndproc simplewindow-wndproc (hwnd msg wparam lparam)
  (switch msg
    ((const +wm-destroy+)
     (post-quit-message)))
  (default-window-proc hwnd msg wparam lparam))

(defun basic-test ()
  (winmain "SIMPLEWINDOW"	       
	   (callback simplewindow-wndproc)))
