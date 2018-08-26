;;;; defines.lisp
;;;; constants etc. for cl-bgfx from /include/bgfx/defines.h

(in-package #:cl-bgfx)

(defconstant +bgfx-api-version+ 76)


;;; Color RGB/alpha/depth write. When it's not specified write will be disabled.
(defconstant +bgfx-state-write-r+ #x1 "Enable R write.")
(defconstant +bgfx-state-write-g+ #x2 "Enable G write.")
(defconstant +bgfx-state-write-b+ #x4 "Enable B write.")
(defconstant +bgfx-state-write-a+ #x8 "Enable alpha write.")
(defconstant +bgfx-state-write-z+ #x4000000000 "Enable depth write.")

(defconstant +bgfx-state-write-rgb+
  (logior 0
	  +bgfx-state-write-r+
	  +bgfx-state-write-g+
	  +bgfx-state-write-b+)
  "Enable RGB write")

(defconstant +bgfx-state-write-mask+
  (logior 0
	  +bgfx-state-write-rgb+
	  +bgfx-state-write-a+
	  +bgfx-state-write-z+)
  "Write all channels mask")

;;; Depth test state. When `BGFX_STATE_DEPTH_` is not specified depth test will be disabled.
(defconstant +bgfx-state-depth-test-less+ #x10 "Enable depth test, less.")
(defconstant +bgfx-state-depth-test-lequal+ #x20 "Enable depth test, less or equal.")
(defconstant +bgfx-state-depth-test-equal+ #x30 "Enable depth test, equal.")
(defconstant +bgfx-state-depth-test-gequal+ #x40 "Enable depth test, greater or equal.")
(defconstant +bgfx-state-depth-test-greater+ #x50 "Enable depth test, greater.")
(defconstant +bgfx-state-depth-test-notequal+ #x60 "Enable depth test, not equal.")
(defconstant +bgfx-state-depth-test-never+ #x70 "Enable depth test, never.")
(defconstant +bgfx-state-depth-test-always+ #x80 "Enable depth test, always.")
(defconstant +bgfx-state-depth-test-shift+ 4 "Depth test state bit shift.")
(defconstant +bgfx-state-depth-test-mask+ #xf0 "Depth test state bit mask.")

;;; Use BGFX_STATE_BLEND_FUNC(_src, _dst) or BGFX_STATE_BLEND_FUNC_SEPARATE(_srcRGB, _dstRGB, _srcA, _dstA)
;;; helper macros.

(defconstant +bgfx-state-blend-zero+ #x1000 "0, 0, 0, 0")
(defconstant +bgfx-state-blend-one+ #x2000 "1, 1, 1, 1")
(defconstant +bgfx-state-blend-src-color+ #x3000 "Rs, Gs, Bs, As")
(defconstant +bgfx-state-blend-inv-src-color+ #x4000 "1-Rs, 1-Gs, 1-Bs, 1-As")
(defconstant +bgfx-state-blend-src-alpha+ #x5000 "As, As, As, As")
(defconstant +bgfx-state-blend-inv-src-alpha+ #x6000 "1-As, 1-As, 1-As, 1-As")
(defconstant +bgfx-state-blend-dst-alpha+ #x7000 "Ad, Ad, Ad, Ad")
(defconstant +bgfx-state-blend-inv-dst-alpha+ #x8000 "1-Ad, 1-Ad, 1-Ad ,1-Ad")
(defconstant +bgfx-state-blend-dst-color+ #x9000 "Rd, Gd, Bd, Ad")
(defconstant +bgfx-state-blend-inv-dst-color+ #xa000 "1-Rd, 1-Gd, 1-Bd, 1-Ad")
(defconstant +bgfx-state-blend-src-alpha-sat+ #xb000 "f, f, f, 1; f = min(As, 1-Ad)")
(defconstant +bgfx-state-blend-factor+ #xc000 "Blend factor")
(defconstant +bgfx-state-blend-inv-factor+ #xd000 "1-Blend factor")
(defconstant +bgfx-state-blend-shift+ 12 "Blend state bit shift.")
(defconstant +bgfx-state-blend-mask+ #xffff000 "Blend state bit mask.")

;;; Use BGFX_STATE_BLEND_EQUATION(_equation) or BGFX_STATE_BLEND_EQUATION_SEPARATE(_equationRGB, _equationA)
;;; helper macros.
(defconstant +bgfx-state-blend-equation-add+ #x0 "Blend add: src + dst.")
(defconstant +bgfx-state-blend-equation-sub+ #x10000000 "Blend subtract: src - dst.")
(defconstant +bgfx-state-blend-equation-revsub+ #x20000000 "Blend reverse subtract: dst - src.")
(defconstant +bgfx-state-blend-equation-min+ #x30000000 "Blend min: min(src, dst).")
(defconstant +bgfx-state-blend-equation-max+ #x40000000 "Blend max: max(src, dst).")
(defconstant +bgfx-state-blend-equation-shift+ 28 "Blend equation bit shift.")
(defconstant +bgfx-state-blend-equation-mask+ #x3f0000000 "Blend equation bit mask.")

(defconstant +bgfx-state-blend-independent+ #x400000000 "Enable blend independent.")
(defconstant +bgfx-state-blend-alpha-to-coverage+ #x800000000 "Enable alpha to coverage.")

;;; Cull state. When `BGFX_STATE_CULL_*` is not specified culling will be disabled.
(defconstant +bgfx-state-cull-cw+ #x1000000000 "Cull clockwise triangles.")
(defconstant +bgfx-state-cull-ccw+ #x2000000000 "Cull counter-clockwise triangles.")
(defconstant +bgfx-state-cull-shift+ 36 "Culling mode bit shift.")
(defconstant +bgfx-state-cull-mask+ #x3000000000 "Culling mode bit mask.")

;;; See BGFX_STATE_ALPHA_REF(_ref) helper macro.
(defconstant +bgfx-state-alpha-ref-shift+ 40 "Alpha reference bit shift.")
(defconstant +bgfx-state-alpha-ref-mask+ #xff0000000000 "Alpha reference bit mask.")

(defconstant +bgfx-state-pt-tristrip+ #x1000000000000 "Tristrip.")
(defconstant +bgfx-state-pt-lines+ #x2000000000000 "Lines.")
(defconstant +bgfx-state-pt-linestrip+ #x3000000000000 "Line strip.")
(defconstant +bgfx-state-pt-points+ #x4000000000000 "Points.")
(defconstant +bgfx-state-pt-shift+ 48 "Primitive type bit shift.")
(defconstant +bgfx-state-pt-mask+ #x7000000000000 "Primitive type bit mask.")

;;; See BGFX_STATE_POINT_SIZE(_size) helper macro.
(defconstant +bgfx-state-point-size-shift+ 52 "Point size bit shift.")
(defconstant +bgfx-state-point-size-mask+ #xf0000000000000 "Point size bit mask.")

;;; Enable MSAA write when writing into MSAA frame buffer.
;;; This flag is ignored when not writing into MSAA frame buffer.
(defconstant +bgfx-state-msaa+ #x100000000000000 "Enable MSAA rasterization.")
(defconstant +bgfx-state-lineaa+ #x200000000000000 "Enable line AA rasterization.")
(defconstant +bgfx-state-conservative-raster+ #x400000000000000 "Enable conservative rasterization.")

;;; Do not use!
(defconstant +bgfx-state-reserved-shift+ 61 "Internal bits shift.")
(defconstant +bgfx-state-reserved-mask+ #xe000000000000000 "Internal bits mask.")

(defconstant +bgfx-state-none+ #x0 "No state.")
(defconstant +bgfx-state-mask+ 0 "State mask.")

;;; Default state is write to RGB, alpha, and depth with depth test less enabled, with clockwise
;;; culling and MSAA (when writing into MSAA frame buffer, otherwise this flag is ignored).
(defconstant +bgfx-state-default+
  (logior 0
	  +bgfx-state-write-rgb+
	  +bgfx-state-write-a+
	  +bgfx-state-write-z+
	  +bgfx-state-depth-test-less+
	  +bgfx-state-cull-cw+
	  +bgfx-state-msaa+))

#|
(defmacro bgfx-state-alpha-ref (ref)
  `(logand (ash ,ref +bgfx-state-alpha-ref-shift+)
	  +bgfx-state-alpha-ref-mask+))

(defmacro bgfx-state-point-size (size)
  `(logand (ash ,size +bgfx-state-point-size-shift+)
	  +bgfx-state-point-size-mask+))

(defmacro bgfx-state-blend-func-separate (src-rgb dst-rgb src-a dst-a)
  `(logior 0
	  (logior ,src-rgb (ash ,dst-rgb 4))
	  (ash (logior ,src-a (ash ,dst-a 4)) 8)))

(defmacro bgfx-state-blend-equation-separate (equation-rgb equation-a)
  `(logior equation-rgb (ash ,equation-a 3)))

(defmacro bgfx-state-blend-func (src dst)
  `(bgfx-state-blend-func-separate ,src ,dst ,src ,dst))

(defmacro bgfx-state-blend-equation (equation)
  `(bgfx-state-blend-equation-separate ,equation ,equation))

(defconstant bgfx-state-blend-add
  `(logior 0 (bgfx-state-blend-func +bgfx-state-blend-one+ +bgfx-state-blend-one+)))
|#

(defconstant +bgfx-stencil-func-ref-shift+ 0)
(defconstant +bgfx-stencil-func-ref-mask+ #xff)
(defconstant +bgfx-stencil-func-rmask-shift+ 8)
(defconstant +bgfx-stencil-func-rmask-mask+ #xff00)

(defconstant +bgfx-stencil-test-less+ #x10000 "Enable stencil test, less.")
(defconstant +bgfx-stencil-test-lequal+ #x20000 "Enable stencil test, less or equal.")
(defconstant +bgfx-stencil-test-equal+ #x30000 "Enable stencil test, equal.")
(defconstant +bgfx-stencil-test-gequal+ #x40000 "Enable stencil test, greater or equal.")
(defconstant +bgfx-stencil-test-greater+ #x50000 "Enable stencil test, greater.")
(defconstant +bgfx-stencil-test-notequal+ #x60000 "Enable stencil test, not equal.")
(defconstant +bgfx-stencil-test-never+ #x70000 "Enable stencil test, never.")
(defconstant +bgfx-stencil-test-always+ #x80000 "Enable stencil test, always.")
(defconstant +bgfx-stencil-test-shift+ 16 "Stencil test bit shift.")
(defconstant +bgfx-stencil-test-mask+ #xf0000 "Stencil test bit mask.")

(defconstant +bgfx-stencil-op-fail-s-zero+ #x0 "Zero.")
(defconstant +bgfx-stencil-op-fail-s-keep+ #x100000 "Keep.")
(defconstant +bgfx-stencil-op-fail-s-replace+ #x200000 "Replace.")
(defconstant +bgfx-stencil-op-fail-s-incr+ #x300000 "Increment and wrap.")
(defconstant +bgfx-stencil-op-fail-s-incrsat+ #x400000 "Increment and clamp.")
(defconstant +bgfx-stencil-op-fail-s-decr+ #x500000 "Decrement and wrap.")
(defconstant +bgfx-stencil-op-fail-s-decrsat+ #x600000 "Decrement and clamp.")
(defconstant +bgfx-stencil-op-fail-s-invert+ #x700000 "Invert.")
(defconstant +bgfx-stencil-op-fail-s-shift+ 20 "Stencil operation fail bit shift.")
(defconstant +bgfx-stencil-op-fail-s-mask+ #xf00000 "Stencil operation fail bit mask.")

(defconstant +bgfx-stencil-op-fail-z-zero+ #x0 "Zero.")
(defconstant +bgfx-stencil-op-fail-z-keep+ #x1000000 "Keep.")
(defconstant +bgfx-stencil-op-fail-z-replace+ #x2000000 "Replace.")
(defconstant +bgfx-stencil-op-fail-z-incr+ #x3000000 "Increment and wrap.")
(defconstant +bgfx-stencil-op-fail-z-incrsat+ #x4000000 "Increment and clamp.")
(defconstant +bgfx-stencil-op-fail-z-decr+ #x5000000 "Decrement and wrap.")
(defconstant +bgfx-stencil-op-fail-z-decrsat+ #x6000000 "Decrement and clamp.")
(defconstant +bgfx-stencil-op-fail-z-invert+ #x7000000 "Invert.")
(defconstant +bgfx-stencil-op-fail-z-shift+ 24 "Stencil operation depth fail bit shift")
(defconstant +bgfx-stencil-op-fail-z-mask+ #xf000000 "Stencil operation depth fail bit mask.")

(defconstant +bgfx-stencil-op-pass-z-zero+ #x0 "Zero.")
(defconstant +bgfx-stencil-op-pass-z-keep+ #x10000000 "Keep.")
(defconstant +bgfx-stencil-op-pass-z-replace+ #x20000000 "Replace.")
(defconstant +bgfx-stencil-op-pass-z-incr+ #x30000000 "Increment and wrap.")
(defconstant +bgfx-stencil-op-pass-z-incrsat+ #x40000000 "Increment and clamp.")
(defconstant +bgfx-stencil-op-pass-z-decr+ #x50000000 "Decrement and wrap.")
(defconstant +bgfx-stencil-op-pass-z-decrsat+ #x60000000 "Decrement and clamp.")
(defconstant +bgfx-stencil-op-pass-z-invert+ #x70000000 "Invert.")
(defconstant +bgfx-stencil-op-pass-z-shift+ 28 "Stencil operation depth pass bit shift")
(defconstant +bgfx-stencil-op-pass-z-mask+ #xf0000000 "Stencil operation depth pass bit mask.")

(defconstant +bgfx-stencil-none+ #x0 "")
(defconstant +bgfx-stencil-mask+ #xffffffff "")
(defconstant +bgfx-stencil-default+ #x0 "")

(defconstant +bgfx-clear-none+ #x0 "No clear flags.")
(defconstant +bgfx-clear-color+ #x1 "Clear color.")
(defconstant +bgfx-clear-depth+ #x2 "Clear depth.")
(defconstant +bgfx-clear-stencil+ #x4 "Clear stencil.")
(defconstant +bgfx-clear-discard-color-0+ #x8 "Discard frame buffer attachment 0.")
(defconstant +bgfx-clear-discard-color-1+ #x10 "Discard frame buffer attachment 1.")
(defconstant +bgfx-clear-discard-color-2+ #x20 "Discard frame buffer attachment 2.")
(defconstant +bgfx-clear-discard-color-3+ #x40 "Discard frame buffer attachment 3.")
(defconstant +bgfx-clear-discard-color-4+ #x80 "Discard frame buffer attachment 4.")
(defconstant +bgfx-clear-discard-color-5+ #x100 "Discard frame buffer attachment 5.")
(defconstant +bgfx-clear-discard-color-6+ #x200 "Discard frame buffer attachment 6.")
(defconstant +bgfx-clear-discard-color-7+ #x400 "Discard frame buffer attachment 7.")
(defconstant +bgfx-clear-discard-depth+ #x800 "Discard frame buffer depth attachment.")
(defconstant +bgfx-clear-discard-stencil+ #x1000 "Discard frame buffer stencil attachment.")

(defconstant +bgfx-clear-discard-color-mask+
  (logior 0
	  +bgfx-clear-discard-color-0+
	  +bgfx-clear-discard-color-1+
	  +bgfx-clear-discard-color-2+
	  +bgfx-clear-discard-color-3+
	  +bgfx-clear-discard-color-4+
	  +bgfx-clear-discard-color-5+
	  +bgfx-clear-discard-color-6+
	  +bgfx-clear-discard-color-7+))

(defconstant +bgfx-clear-discard-mask
  (logior 0
	  +bgfx-clear-discard-color-mask+
	  +bgfx-clear-discard-depth+
	  +bgfx-clear-discard-stencil+))

(defconstant +bgfx-debug-none+ #x0 "No debug.")
(defconstant +bgfx-debug-wireframe+ #x1 "Enable wireframe for all primitives.")
(defconstant +bgfx-debug-ifh+ #x2 "Enable infinitely fast hardware test. No draw calls will be submitted to driver. It's useful when profiling to quickly assess bottleneck between CPU and GPU.")
(defconstant +bgfx-debug-stats+ #x4 "Enable statistics display.")
(defconstant +bgfx-debug-text+ #x8 "Enable debug text display.")
(defconstant +bgfx-debug-profiler+ #x10 "Enable profiler.")

(defconstant +bgfx-buffer-none+ #x0)

(defconstant +bgfx-buffer-compute-format-8x1+ #x1 "1 8-bit value")
(defconstant +bgfx-buffer-compute-format-8x2+ #x2 "2 8-bit values")
(defconstant +bgfx-buffer-compute-format-8x4+ #x3 "4 8-bit values")
(defconstant +bgfx-buffer-compute-format-16x1+ #x4 "1 16-bit value")
(defconstant +bgfx-buffer-compute-format-16x2+ #x5 "2 16-bit values")
(defconstant +bgfx-buffer-compute-format-16x4+ #x6 "4 16-bit values")
(defconstant +bgfx-buffer-compute-format-32x1+ #x7 "1 32-bit value")
(defconstant +bgfx-buffer-compute-format-32x2+ #x8 "2 32-bit values")
(defconstant +bgfx-buffer-compute-format-32x4+ #x9 "4 32-bit values")
(defconstant +bgfx-buffer-compute-format-shift+ 0)
(defconstant +bgfx-buffer-compute-format-mask+ #xf)

(defconstant +bgfx-buffer-compute-type-int+ #x10 "Type `int`.")
(defconstant +bgfx-buffer-compute-type-uint+ #x20 "Type `uint`.")
(defconstant +bgfx-buffer-compute-type-float+ #x30 "Type `float`.")
(defconstant +bgfx-buffer-compute-type-shift+ 4)
(defconstant +bgfx-buffer-compute-type-mask+ #x30)

(defconstant +bgfx-buffer-compute-read+ #x100 "Buffer will be read by shader.")
(defconstant +bgfx-buffer-compute-write+ #x200 "Buffer will be used for writing.")
(defconstant +bgfx-buffer-draw-indirect+ #x400 "Buffer will be used for storing draw indirect commands.")
(defconstant +bgfx-buffer-allow-resize+ #x800 "Allow dynamic index/vertex buffer resize during update.")
(defconstant +bgfx-buffer-index32+ #x1000 "Index buffer contains 32-bit indices.")

(defconstant +bgfx-buffer-compute-read-write+
  (logior 0
	  +bgfx-buffer-compute-read+
	  +bgfx-buffer-compute-write+))

(defconstant +bgfx-texture-none+ #x0)
(defconstant +bgfx-texture-u-mirror+ #x1 "Wrap U mode: Mirror")
(defconstant +bgfx-texture-u-clamp+ #x2 "Wrap U mode: Clamp")
(defconstant +bgfx-texture-u-border+ #x3 "Wrap U mode: Border")
(defconstant +bgfx-texture-u-shift+ 0)
(defconstant +bgfx-texture-u-mask+ #x3)
(defconstant +bgfx-texture-v-mirror+ #x4 "Wrap V mode: Mirror")
(defconstant +bgfx-texture-v-clamp+ #x8 "Wrap V mode: Clamp")
(defconstant +bgfx-texture-v-border+ #xc "Wrap V mode: Border")
(defconstant +bgfx-texture-v-shift+ 2)
(defconstant +bgfx-texture-v-mask+ #xc)
(defconstant +bgfx-texture-w-mirror+ #x10 "Wrap W mode: Mirror")
(defconstant +bgfx-texture-w-clamp+ #x20 "Wrap W mode: Clamp")
(defconstant +bgfx-texture-w-border+ #x30 "Wrap W mode: Border")
(defconstant +bgfx-texture-w-shift+ 4)
(defconstant +bgfx-texture-w-mask+ #x30)
(defconstant +bgfx-texture-min-point+ #x40 "Min sampling mode: Point")
(defconstant +bgfx-texture-min-anisotropic+ #x80 "Min sampling mode: Anisotropic")
(defconstant +bgfx-texture-min-shift+ 6)
(defconstant +bgfx-texture-min-mask+ #xc0)
(defconstant +bgfx-texture-mag-point+ #x100 "Mag sampling mode: Point")
(defconstant +bgfx-texture-mag-anisotropic+ #x200 "Mag sampling mode: Anisotropic")
(defconstant +bgfx-texture-mag-shift+ 8)
(defconstant +bgfx-texture-mag-mask+ #x300)
(defconstant +bgfx-texture-mip-point+ #x400 "Mip sampling mode: Point")
(defconstant +bgfx-texture-mip-shift+ 10)
(defconstant +bgfx-texture-mip-mask+ #x400)
(defconstant +bgfx-texture-msaa-sample+ #x800 "Texture will be used for MSAA sampling.")
(defconstant +bgfx-texture-rt+ #x1000)
(defconstant +bgfx-texture-rt-msaa-x2+ #x2000 "Render target MSAAx2 mode.")
(defconstant +bgfx-texture-rt-msaa-x4+ #x3000 "Render target MSAAx4 mode.")
(defconstant +bgfx-texture-rt-msaa-x8+ #x4000 "Render target MSAAx8 mode.")
(defconstant +bgfx-texture-rt-msaa-x16+ #x5000 "Render target MSAAx16 mode.")
(defconstant +bgfx-texture-rt-msaa-shift+ 12)
(defconstant +bgfx-texture-rt-msaa-mask+ #x7000)
(defconstant +bgfx-texture-rt-write-only+ #x8000 "Render target will be used for writing only.")
(defconstant +bgfx-texture-rt-mask+ #xf000)
(defconstant +bgfx-texture-compare-less+ #x10000 "Compare when sampling depth texture: less.")
(defconstant +bgfx-texture-compare-lequal+ #x20000 "Compare when sampling depth texture: less or equal.")
(defconstant +bgfx-texture-compare-equal+ #x30000 "Compare when sampling depth texture: equal.")
(defconstant +bgfx-texture-compare-gequal+ #x40000 "Compare when sampling depth texture: greater or equal.")
(defconstant +bgfx-texture-compare-greater+ #x50000 "Compare when sampling depth texture: greater.")
(defconstant +bgfx-texture-compare-notequal+ #x60000 "Compare when sampling depth texture: not equal.")
(defconstant +bgfx-texture-compare-never+ #x70000 "Compare when sampling depth texture: never.")
(defconstant +bgfx-texture-compare-always+ #x80000 "Compare when sampling depth texture: always.")
(defconstant +bgfx-texture-compare-shift+ 16)
(defconstant +bgfx-texture-compare-mask+ #xf0000)
(defconstant +bgfx-texture-compute-write+ #x100000 "Texture will be used for compute write.")
(defconstant +bgfx-texture-srgb+ #x200000 "Sample texture as sRGB.")
(defconstant +bgfx-texture-blit-dst+ #x400000 "Texture will be used as blit destination.")
(defconstant +bgfx-texture-read-back+ #x800000 "Texture will be used for read back from GPU.")
(defconstant +bgfx-texture-border-color-shift+ 24)
(defconstant +bgfx-texture-border-color-mask+ #xf000000)
(defconstant +bgfx-texture-reserved-shift+ 28)
(defconstant +bgfx-texture-reserved-mask+ #xf0000000)

(defconstant +bgfx-texture-sampler-bits-mask+
  (logior 0
	  +bgfx-texture-u-mask+
	  +bgfx-texture-v-mask+
	  +bgfx-texture-w-mask+
	  +bgfx-texture-min-mask+
	  +bgfx-texture-mag-mask+
	  +bgfx-texture-mip-mask+
	  +bgfx-texture-compare-mask+))

(defconstant +bgfx-reset-none+ #x0 "No reset flags.")
(defconstant +bgfx-reset-fullscreen+ #x1 "Not supported yet.")
(defconstant +bgfx-reset-fullscreen-shift+ 0 "Fullscreen bit shift.")
(defconstant +bgfx-reset-fullscreen-mask+ #x1 "Fullscreen bit mask.")
(defconstant +bgfx-reset-msaa-x2+ #x10 "Enable 2x MSAA.")
(defconstant +bgfx-reset-msaa-x4+ #x20 "Enable 4x MSAA.")
(defconstant +bgfx-reset-msaa-x8+ #x30 "Enable 8x MSAA.")
(defconstant +bgfx-reset-msaa-x16+ #x40 "Enable 16x MSAA.")
(defconstant +bgfx-reset-msaa-shift+ 4 "MSAA mode bit shift.")
(defconstant +bgfx-reset-msaa-mask+ #x70 "MSAA mode bit mask.")
(defconstant +bgfx-reset-vsync+ #x80 "Enable V-Sync.")
(defconstant +bgfx-reset-maxanisotropy+ #x100 "Turn on/off max anisotropy.")
(defconstant +bgfx-reset-capture+ #x200 "Begin screen capture.")
(defconstant +bgfx-reset-flush-after-render+ #x2000 "Flush rendering after submitting to GPU.")
(defconstant +bgfx-reset-flip-after-render+ #x4000 "This flag specifies where flip occurs. Default behavior is that flip occurs before rendering new frame. This flag only has effect when `BGFX_CONFIG_MULTITHREADED=0`.")
(defconstant +bgfx-reset-srgb-backbuffer+ #x8000 "Enable sRGB backbuffer.")
(defconstant +bgfx-reset-hidpi+ #x10000 "Enable HiDPI rendering.")
(defconstant +bgfx-reset-depth-clamp+ #x20000 "Enable depth clamp.")
(defconstant +bgfx-reset-suspend+ #x40000 "Suspend rendering.")

(defconstant +bgfx-reset-reserved-shift+ 31 "Internal bits shift.")
(defconstant +bgfx-reset-reserved-mask+ #x80000000 "Internal bits mask.")

(defconstant +bgfx-caps-alpha-to-coverage+ #x1 "Alpha to coverage is supported.")
(defconstant +bgfx-caps-blend-independent+ #x2 "Blend independent is supported.")
(defconstant +bgfx-caps-compute+ #x4 "Compute shaders are supported.")
(defconstant +bgfx-caps-conservative-raster+ #x8 "Conservative rasterization is supported.")
(defconstant +bgfx-caps-draw-indirect+ #x10 "Draw indirect is supported.")
(defconstant +bgfx-caps-fragment-depth+ #x20 "Fragment depth is accessible in fragment shader.")
(defconstant +bgfx-caps-fragment-ordering+ #x40 "Fragment ordering is available in fragment shader.")
(defconstant +bgfx-caps-graphics-debugger+ #x80 "Graphics debugger is present.")
(defconstant +bgfx-caps-hidpi+ #x100 "HiDPI rendering is supported.")
(defconstant +bgfx-caps-index32+ #x400 "32-bit indices are supported.")
(defconstant +bgfx-caps-instancing+ #x800 "Instancing is supported.")
(defconstant +bgfx-caps-occlusion-query+ #x1000 "Occlusion query is supported.")
(defconstant +bgfx-caps-renderer-multithreaded+ #x2000 "Renderer is on separate thread.")
(defconstant +bgfx-caps-swap-chain+ #x4000 "Multiple windows are supported.")
(defconstant +bgfx-caps-texture-2d-array+ #x8000 "2D texture array is supported.")
(defconstant +bgfx-caps-texture-3d+ #x10000 "3D textures are supported.")
(defconstant +bgfx-caps-texture-blit+ #x20000 "Texture blit is supported.")
(defconstant +bgfx-caps-texture-compare-all+ #xc0000 "All texture compare modes are supported.")
(defconstant +bgfx-caps-texture-compare-lequal+ #x80000 "Texture compare less equal mode is supported.")
(defconstant +bgfx-caps-texture-cube-array+ #x100000 "Cubemap texture array is supported.")
(defconstant +bgfx-caps-texture-direct-access+ #x200000 "CPU direct access to GPU texture memory.")
(defconstant +bgfx-caps-texture-read-back+ #x400000 "Read-back texture is supported.")
(defconstant +bgfx-caps-vertex-attrib-half+ #x800000 "Vertex attribute half-float is supported.")
(defconstant +bgfx-caps-vertex-attrib-uint10+ #x800000 "Vertex attribute 10_10_10_2 is supported.")
(defconstant +bgfx-caps-vertex-id+ #x1000000 "Rendering with VertexID only is supported.")

(defconstant +bgfx-caps-format-texture-none+ #x0 "Texture format is not supported.")
(defconstant +bgfx-caps-format-texture-2d+ #x1 "Texture format is supported.")
(defconstant +bgfx-caps-format-texture-2d-srgb+ #x2 "Texture as sRGB format is supported.")
(defconstant +bgfx-caps-format-texture-2d-emulated+ #x4 "Texture format is emulated.")
(defconstant +bgfx-caps-format-texture-3d+ #x8 "Texture format is supported.")
(defconstant +bgfx-caps-format-texture-3d-srgb+ #x10 "Texture as sRGB format is supported.")
(defconstant +bgfx-caps-format-texture-3d-emulated+ #x20 "Texture format is emulated.")
(defconstant +bgfx-caps-format-texture-cube+ #x40 "Texture format is supported.")
(defconstant +bgfx-caps-format-texture-cube-srgb+ #x80 "Texture as sRGB format is supported.")
(defconstant +bgfx-caps-format-texture-cube-emulated+ #x100 "Texture format is emulated.")
(defconstant +bgfx-caps-format-texture-vertex+ #x200 "Texture format can be used from vertex shader.")
(defconstant +bgfx-caps-format-texture-image+ #x400 "Texture format can be used as image from compute shader.")
(defconstant +bgfx-caps-format-texture-framebuffer+ #x800 "Texture format can be used as frame buffer.")
(defconstant +bgfx-caps-format-texture-framebuffer-msaa+ #x1000 "Texture format can be used as MSAA frame buffer.")
(defconstant +bgfx-caps-format-texture-msaa+ #x2000 "Texture can be sampled as MSAA.")
(defconstant +bgfx-caps-format-texture-mip-autogen+ #x4000 "Texture format supports auto-generated mips.")

(defconstant +bgfx-view-none+ #x0)
(defconstant +bgfx-view-stereo+ #x1 "View will be rendered in stereo mode.")

(defconstant +bgfx-submit-eye-left+ #x1 "Submit to left eye.")
(defconstant +bgfx-submit-eye-right+ #x2 "Submit to right eye.")
(defconstant +bgfx-submit-eye-mask+ #x3)
(defconstant +bgfx-submit-eye-first+ +bgfx-submit-eye-left+)

(defconstant +bgfx-submit-reserved-shift+ 7 "Internal bits shift.")
(defconstant +bgfx-submit-reserved-mask+ #x80 "Internal bits mask.")

(defconstant +bgfx-pci-id-none+ #x0 "Autoselect adapter.")
(defconstant +bgfx-pci-id-software-rasterizer+ #x1 "Software rasterizer.")
(defconstant +bgfx-pci-id-amd+ #x1002 "AMD adapter.")
(defconstant +bgfx-pci-id-intel+ #x8086 "Intel adapter.")
(defconstant +bgfx-pci-id-nvidia+ #x10de "nVidia adapter.")

(defconstant +bgfx-cube-map-positive-x+ #x0 "Cubemap +x.")
(defconstant +bgfx-cube-map-negative-x+ #x1 "Cubemap -x.")
(defconstant +bgfx-cube-map-positive-y+ #x2 "Cubemap +y.")
(defconstant +bgfx-cube-map-negative-y+ #x3 "Cubemap -y.")
(defconstant +bgfx-cube-map-positive-z+ #x4 "Cubemap +z.")
(defconstant +bgfx-cube-map-negative-z+ #x5 "Cubemap -z.")
