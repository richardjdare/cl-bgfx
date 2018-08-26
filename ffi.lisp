;;;; ffi.lisp
;;;; Foreign function interface for cl-bgfx

(in-package #:cl-bgfx)

(pushnew (asdf:system-relative-pathname :cl-bgfx #p"lib/")
	 cffi:*foreign-library-directories*
	 :test #'equal)

(cffi:define-foreign-library bgfxlib
  ((:and :windows :x86-64) (:default "windows/x64/bgfx-shared-libDebug"))
  ((:and :windows :x86-32) (:default "/windows/x86/bgfx-shared-libDebug")))

#|
(cffi:define-foreign-library bgfxlib
  ((:not :windows) (:default "bgfx-shared-libDebug"))
  (:windows (:default "bgfx-shared-libDebug")))
|#

(cffi:use-foreign-library bgfxlib)

(cffi:defcenum bgfx-renderer-type
  :bgfx-renderer-type-noop
  :bgfx-renderer-type-direct3d9
  :bgfx-renderer-type-direct3d11
  :bgfx-renderer-type-direct3d12
  :bgfx-renderer-type-gnm
  :bgfx-renderer-type-metal
  :bgfx-renderer-type-opengles
  :bgfx-renderer-type-opengl
  :bgfx-renderer-type-vulkan
  :bgfx-renderer-type-count)

(cffi:defcenum bgfx-access
  :bgfx-access-read
  :bgfx-access-write
  :bgfx-access-readwrite
  :bgfx-access-count)

(cffi:defcenum bgfx-attrib
  :bgfx-attrib-position
  :bgfx-attrib-normal
  :bgfx-attrib-tangent
  :bgfx-attrib-bitangent
  :bgfx-attrib-color0
  :bgfx-attrib-color1
  :bgfx-attrib-color2
  :bgfx-attrib-color3
  :bgfx-attrib-indices
  :bgfx-attrib-weight
  :bgfx-attrib-texcoord0
  :bgfx-attrib-texcoord1
  :bgfx-attrib-texcoord2
  :bgfx-attrib-texcoord3
  :bgfx-attrib-texcoord4
  :bgfx-attrib-texcoord5
  :bgfx-attrib-texcoord6
  :bgfx-attrib-texcoord7
  :bgfx-attrib-count)
			 
(cffi:defcenum bgfx-attrib-type
  :bgfx-attrib-type-uint8
  :bgfx-attrib-type-uint10
  :bgfx-attrib-type-int16
  :bgfx-attrib-type-half
  :bgfx-attrib-type-float
  :bgfx-attrib-type-count)

(cffi:defcenum bgfx-texture-format
  :bgfx-texture-format-bc1
  :bgfx-texture-format-bc2
  :bgfx-texture-format-bc3
  :bgfx-texture-format-bc4
  :bgfx-texture-format-bc5
  :bgfx-texture-format-bc6h
  :bgfx-texture-format-bc7
  :bgfx-texture-format-etc1
  :bgfx-texture-format-etc2
  :bgfx-texture-format-etc2a
  :bgfx-texture-format-etc2a1
  :bgfx-texture-format-ptc12
  :bgfx-texture-format-ptc14
  :bgfx-texture-format-ptc12a
  :bgfx-texture-format-ptc14a
  :bgfx-texture-format-ptc22
  :bgfx-texture-format-ptc24
  :bgfx-texture-format-atc
  :bgfx-texture-format-atce
  :bgfx-texture-format-atci
  :bgfx-texture-format-astc4x4
  :bgfx-texture-format-astc5x5
  :bgfx-texture-format-astc6x6
  :bgfx-texture-format-astc8x5
  :bgfx-texture-format-astc8x6
  :bgfx-texture-format-astc10x5
  :bgfx-texture-format-unknown
  :bgfx-texture-format-r1
  :bgfx-texture-format-a8
  :bgfx-texture-format-r8
  :bgfx-texture-format-r8i
  :bgfx-texture-format-r8u
  :bgfx-texture-format-r8s
  :bgfx-texture-format-r16
  :bgfx-texture-format-r16i
  :bgfx-texture-format-r16u
  :bgfx-texture-format-r16f
  :bgfx-texture-format-r16s
  :bgfx-texture-format-r32i
  :bgfx-texture-format-r32u
  :bgfx-texture-format-r32f
  :bgfx-texture-format-rg8
  :bgfx-texture-format-rg8i
  :bgfx-texture-format-rg8u
  :bgfx-texture-format-rg8s
  :bgfx-texture-format-rg16
  :bgfx-texture-format-rg16i
  :bgfx-texture-format-rg16u
  :bgfx-texture-format-rg16f
  :bgfx-texture-format-rg16s
  :bgfx-texture-format-rg32i
  :bgfx-texture-format-rg32u
  :bgfx-texture-format-rg32f
  :bgfx-texture-format-rgb8
  :bgfx-texture-format-rgb8i
  :bgfx-texture-format-rgb8u
  :bgfx-texture-format-rgb8s
  :bgfx-texture-format-rgb9e5f
  :bgfx-texture-format-bgra8
  :bgfx-texture-format-rgba8
  :bgfx-texture-format-rgba8i
  :bgfx-texture-format-rgba8u
  :bgfx-texture-format-rgba8s
  :bgfx-texture-format-rgba16
  :bgfx-texture-format-rgba16i
  :bgfx-texture-format-rgba16u
  :bgfx-texture-format-rgba16f
  :bgfx-texture-format-rgba16s
  :bgfx-texture-format-rgba32i
  :bgfx-texture-format-rgba32u
  :bgfx-texture-format-rgba32f
  :bgfx-texture-format-r5g6b5
  :bgfx-texture-format-rgba4
  :bgfx-texture-format-rgb5a1
  :bgfx-texture-format-rgb10a2
  :bgfx-texture-format-rg11b10f
  :bgfx-texture-format-unknown-depth
  :bgfx-texture-format-d16
  :bgfx-texture-format-d24
  :bgfx-texture-format-d24s8
  :bgfx-texture-format-d32
  :bgfx-texture-format-d16f
  :bgfx-texture-format-d24f
  :bgfx-texture-format-d32f
  :bgfx-texture-format-d0s8
  :bgfx-texture-format-count)

(cffi:defcenum bgfx-uniform-type
  :bgfx-uniform-type-int1
  :bgfx-uniform-type-end
  :bgfx-uniform-type-vec4
  :bgfx-uniform-type-mat3
  :bgfx-uniform-type-mat4
  :bgfx-uniform-type-count)

(cffi:defcenum bgfx-backbuffer-ratio
  :bgfx-backbuffer-ratio-equal
  :bgfx-backbuffer-ratio-half
  :bgfx-backbuffer-ratio-quarter
  :bgfx-backbuffer-ratio-eighth
  :bgfx-backbuffer-ratio-sixteenth
  :bgfx-backbuffer-ratio-double
  :bgfx-backbuffer-ratio-count)

(cffi:defcenum bgfx-occlusion-query-result
  :bgfx-occlusion-query-result-invisible
  :bgfx-occlusion-query-result-visible
  :bgfx-occlusion-query-result-noresult
  :bgfx-occlusion-query-result-count)

(cffi:defcenum bgfx-topology
  :bgfx-topology-tri-list
  :bgfx-topology-tri-strip
  :bgfx-topology-line-list
  :bgfx-topology-line-strip
  :bgfx-topology-point-list
  :bgfx-topology-count)

(cffi:defcenum bgfx-topology-convert
  :bgfx-topology-convert-tri-list-flip-winding
  :bgfx-topology-convert-tri-strip-flip-winding
  :bgfx-topology-convert-tri-list-to-line-list
  :bgfx-topology-convert-tri-strip-to-tri-list
  :bgfx-topology-convert-line-strip-to-line-list
  :bgfx-topology-convert-count)

(cffi:defcenum bgfx-topology-sort
  :bgfx-topology-sort-direction-front-to-back-min
  :bgfx-topology-sort-direction-front-to-back-avg
  :bgfx-topology-sort-direction-front-to-back-max
  :bgfx-topology-sort-direction-back-to-front-min
  :bgfx-topology-sort-direction-back-to-front-avg
  :bgfx-topology-sort-direction-back-to-front-max
  :bgfx-topology-sort-distance-front-to-back-min
  :bgfx-topology-sort-distance-front-to-back-avg
  :bgfx-topology-sort-distance-front-to-back-max
  :bgfx-topology-sort-distance-back-to-front-min
  :bgfx-topology-sort-distance-back-to-front-avg
  :bgfx-topology-sort-distance-back-to-front-max
  :bgfx-topology-sort-count)

(cffi:defcenum bgfx-view-mode
  :bgfx-view-mode-default
  :bgfx-view-mode-sequential
  :bgfx-view-mode-depth-ascending
  :bgfx-view-mode-depth-descending
  :bgfx-view-mode-ccount)

;; In bgfx these handles are structs containing a single uint16
;; They are returned by value by several functions
;; which makes working with CFFI more complicated
;; so I treat em as variables instead.

(defmacro bgfx-handle (name)
  `(cffi:defctype ,name :uint16))

(bgfx-handle bgfx-dynamic-index-buffer-handle)
(bgfx-handle bgfx-dynamic-vertex-buffer-handle)
(bgfx-handle bgfx-frame-buffer-handle)
(bgfx-handle bgfx-index-buffer-handle)
(bgfx-handle bgfx-indirect-buffer-handle)
(bgfx-handle bgfx-occlusion-query-handle)
(bgfx-handle bgfx-program-handle)
(bgfx-handle bgfx-shader-handle)
(bgfx-handle bgfx-texture-handle)
(bgfx-handle bgfx-uniform-handle)
(bgfx-handle bgfx-vertex-buffer-handle)
(bgfx-handle bgfx-vertex-decl-handle)

#|
typedef void (*bgfx_release_fn_t)(void* _ptr, void* _userData);
|#
(cffi:defctype bgfx-release-fn :pointer)

(cffi:defcstruct bgfx-memory
  (data (:pointer :uint8))
  (size :uint32))

(cffi:defcstruct bgfx-transform
  (data (:pointer :float))
  (num :uint16))

(cffi:defctype bgfx-view-id :uint16)

(cffi:defcstruct bgfx-view-stats
  (name :char :count 256)
  (view :uint16)
  (cpu-time-elapsed :uint64)
  (gpu-time-elapsed :uint64))

(cffi:defcstruct bgfx-encoder-stats
  (cpu-time-begin :uint64)
  (cpu-time-end :uint64))

(cffi:defcstruct bgfx-stats
  (cpu-time-frame :int64)
  (cpu-time-begin :int64)
  (cpu-time-end :int64)
  (cpu-timer-freq :int64)
  (gpu-time-begin :int64)
  (gpu-time-end :int64)
  (gpu-timer-freq :int64)
  (wait-render :int64)
  (wait-submit :int64)
  (num-draw :uint32)
  (num-compute :uint32)
  (max-gpu-latency :uint32)  
  (num-dynamic-indexbuffers :uint16)
  (num-dynamic-vertexbuffers :uint16)
  (num-frame-buffers :uint16)
  (num-index-buffers :uint16)
  (num-occlusion-queries :uint16)
  (num-programs :uint16)
  (num-shaders :uint16)
  (num-textures :uint16)
  (num-uniforms :uint16)
  (num-vertexbuffers :uint16)
  (num-vertex-decls :uint16)
  (texture-memory-used :int64)
  (rt-memory-used :int64)
  (transient-vb-used :int32)
  (transient-ib-used :int32)
  (num-prims :uint32 :count #.(cffi:foreign-enum-value 'bgfx-topology :bgfx-topology-count))
  (gpu-memory-max :int64)
  (gpu-memory-used :int64)
  (width :uint16)
  (height :uint16)
  (text-width :uint16)
  (text-height :uint16)
  (num-views :uint16)
  (view-stats (:struct bgfx-view-stats) :count 256)
  (num-encoders :uint8)
  (bgfx-encoder-stats (:pointer (:struct bgfx-encoder-stats))))

(cffi:defcstruct bgfx-vertex-decl
  (hash :uint32)
  (stride :uint16)
  (offset :uint16 :count #.(cffi:foreign-enum-value 'bgfx-attrib :bgfx-attrib-count))
  (attributes :uint16 :count #.(cffi:foreign-enum-value 'bgfx-attrib :bgfx-attrib-count)))

(cffi:defcstruct bgfx-transient-index-buffer
  (data (:pointer :uint8))
  (size :uint32)
  (handle  bgfx-index-buffer-handle)
  (start-index :uint32))

(cffi:defcstruct bgfx-transient-vertex-buffer
  (data (:pointer :uint8))
  (size :uint32)
  (start-vertex :uint32)
  (stride :uint16)
  (handle bgfx-vertex-buffer-handle)
  (decl bgfx-vertex-decl-handle))

(cffi:defcstruct bgfx-instance-data-buffer
  (data (:pointer :uint8))
  (size :uint32)
  (offset :uint32)
  (num :uint32)
  (stride :uint16)
  (handle bgfx-vertex-buffer-handle))

(cffi:defcstruct bgfx-texture-info
  (format bgfx-texture-format)
  (storage-size :uint32)
  (width :uint16)
  (height :uint16)
  (depth :uint16)
  (num-layers :uint16)
  (num-mips :uint8)
  (bits-per-pixel :uint8)
  (cube-map :bool))

(cffi:defcstruct bgfx-uniform-info
  (name :char :count 256)
  (type bgfx-uniform-type)
  (num :uint16))

(cffi:defcstruct bgfx-attachment
  (handle bgfx-texture-handle)
  (mip :uint16)
  (layer :uint16))

(cffi:defcstruct bgfx-caps-gpu
  (vendor-id :uint16)
  (device-id :uint16))

(cffi:defcstruct bgfx-caps-limits
  (max-draw-calls :uint32)
  (max-blits :uint32)
  (max-texture-size :uint32)
  (max-texture-layers :uint32)
  (max-views :uint32)
  (max-frameBuffers :uint32)
  (max-fb-attachments :uint32)
  (max-programs :uint32)
  (max-shaders :uint32)
  (max-textures :uint32)
  (max-texture-samplers :uint32)
  (max-vertex-decls :uint32)
  (max-vertex-streams :uint32)
  (max-index-buffers :uint32)
  (max-vertex-buffers :uint32)
  (max-dynamic-index-buffers :uint32)
  (max-dynamic-vertex-buffers :uint32)
  (max-uniforms :uint32)
  (max-occlusion-queries :uint32)
  (max-encoders :uint32)
  (transient-vb-size :uint32)
  (transient-ib-size :uint32))

(cffi:defcstruct bgfx-caps
  (renderer-type bgfx-renderer-type)
  (supported :uint64)
  (vendor-id :uint16)
  (device-id :uint16)
  (homogeneous-depth :bool)
  (origin-bottom-left :bool)
  (num-gpus :uint8)
  (gpu (:struct bgfx-caps-gpu) :count 4)
  (limits (:struct bgfx-caps-limits)))

(cffi:defcenum bgfx-fatal
  :bgfx-fatal-debug-check
  :bgfx-fatal-invalid-shader
  :bgfx-fatal-unable-to-initialize
  :bgfx-fatal-unable-to-create-texture
  :bgfx-fatal-device-lost
  :bgfx-fatal-count)

(cffi:defcstruct bgfx-callback-vtbl
  (fatal :pointer)
  (trace-vargs :pointer)
  (profiler-begin :pointer)
  (profiler-end :pointer)
  (cache-read-size :pointer)
  (cache-read :pointer)
  (cache-write :pointer)
  (screen-shot :pointer)
  (capture-begin :pointer)
  (capture-end :pointer)
  (capture-frame :pointer))

(cffi:defcstruct bgfx-callback-interface
  (vtbl (:pointer (:struct bgfx-callback-vtbl))))

(cffi:defcstruct bgfx-allocator-vtbl
  (bgfx-allocator-interface :pointer))

(cffi:defcstruct bgfx-allocator-interface
  (vtbl (:pointer (:struct bgfx-allocator-vtbl))))

(cffi:defcstruct bgfx-resolution
  (width :uint32)
  (height :uint32)
  (reset :uint32))

(cffi:defcstruct bgfx-init-limits
  (max-encoders :uint16)
  (transient-vb-size :uint32)
  (transient-ib-size :uint32))

(cffi:defcstruct bgfx-init-s
  (type bgfx-renderer-type)
  (vendor-id :uint16)
  (device-id :uint16)
  (debug :bool)
  (profile :bool)
  (resolution (:pointer (:struct bgfx-resolution)))
  (limits (:pointer (:struct bgfx-init-limits)))
  (callback (:pointer (:struct bgfx-callback-interface)))
  (allocator (:pointer (:struct bgfx-allocator-interface))))

(cffi:defcfun "bgfx_vertex_decl_begin" :void
  (decl (:pointer (:struct bgfx-vertex-decl)))
  (renderer bgfx-renderer-type))

(cffi:defcfun "bgfx_vertex_decl_add" :void
  (decl (:pointer (:struct bgfx-vertex-decl)))
  (attrib bgfx-attrib)
  (num :uint8)
  (type bgfx-attrib-type)
  (normalized :bool)
  (as-int :bool))

(cffi:defcfun "bgfx_vertex_decl_decode" :void
  (decl (:pointer (:struct bgfx-vertex-decl)))
  (attrib bgfx-attrib)
  (num (:pointer :uint8))
  (type (:pointer bgfx-attrib-type))
  (normalized (:pointer :bool))
  (as-int (:pointer :bool)))

(cffi:defcfun "bgfx_vertex_decl_has" :void
  (decl (:pointer (:struct bgfx-vertex-decl)))
  (attrib bgfx-attrib))

(cffi:defcfun "bgfx_vertex_decl_skip" :void
  (decl (:pointer (:struct bgfx-vertex-decl)))
  (num :uint8))

(cffi:defcfun "bgfx_vertex_decl_end" :void
  (decl (:pointer (:struct bgfx-vertex-decl))))

(cffi:defcfun "bgfx_vertex_pack" :void
  (input :float :count 4)
  (input-normalized :bool)
  (attr bgfx-attrib)
  (decl (:pointer (:struct bgfx-vertex-decl)))
  (data (:pointer :void))
  (index :uint32))

(cffi:defcfun "bgfx_vertex_unpack" :void
  (output :float :count 4)
  (attr bgfx-attrib)
  (decl (:pointer (:struct bgfx-vertex-decl)))
  (data (:pointer :void))
  (index :uint32))

(cffi:defcfun "bgfx_vertex_convert" :void
  (dest-decl (:pointer (:struct bgfx-vertex-decl)))
  (dest-data (:pointer :void))
  (src-decl (:pointer (:struct bgfx-vertex-decl)))
  (src-data (:pointer :void))
  (num :uint32))

(cffi:defcfun "bgfx_weld_vertices" :uint16
  (output (:pointer :uint16))
  (decl (:pointer (:struct bgfx-vertex-decl)))
  (data (:pointer :void))
  (num :uint16)
  (epsilon :float))

(cffi:defcfun "bgfx_topology_convert" :uint32
  (conversion bgfx-topology-convert)
  (dst (:pointer :void))
  (dst-size :uint32)
  (indices (:pointer :void))
  (num-indices :uint32)
  (index32 :bool))

(cffi:defcfun "bgfx_topolog_sort_tri_list" :void
  (sort bgfx-topology-sort)
  (dst (:pointer :void))
  (dst-size :uint32)
  (dir :float :count 3)
  (pos :float :count 3)
  (vertices (:pointer :void))
  (stride :uint32)
  (indices (:pointer :void))
  (num-indices :uint32)
  (index32 :bool))

(cffi:defcfun "bgfx_get_supported_renderers" :uint8
  (max :uint8)
  (enum (:pointer bgfx-renderer-type)))

(cffi:defcfun "bgfx_get_renderer_name" :string
  (type bgfx-renderer-type))

(cffi:defcfun "bgfx_init_ctor" :void
  (init (:pointer (:struct bgfx-init-s))))

(cffi:defcfun "bgfx_init" :bool
  (init (:pointer (:struct bgfx-init-s))))

(cffi:defcfun "bgfx_shutdown" :void)

(cffi:defcfun "bgfx_reset" :void
  (width :uint32)
  (height :uint32)
  (flags :uint32))

;; this actually returns a ptr to bgfx-encoder which isnt defined anywhere I can find
(cffi:defcfun "bgfx_begin" (:pointer (:void)))

;; encoder is actually a ptr to bgfx-encoder
(cffi:defcfun "bgfx_end" :void
  (encoder (:pointer (:void))))

(cffi:defcfun "bgfx_frame" :uint32
  (capture :bool))

(cffi:defcfun "bgfx_get_renderer_type" bgfx-renderer-type)

(cffi:defcfun "bgfx_get_caps" (:pointer (:struct bgfx-caps)))

(cffi:defcfun "bgfx_get_stats" (:pointer (:struct bgfx-stats)))

(cffi:defcfun "bgfx_alloc" (:pointer (:struct bgfx-memory))
  (size :uint32))

(cffi:defcfun "bgfx_copy" (:pointer (:struct bgfx-memory))
  (data (:pointer :void))
  (size :uint32))

(cffi:defcfun "bgfx_make_ref" (:pointer (:struct bgfx-memory))
  (data (:pointer :void))
  (size :uint32))

(cffi:defcfun "bgfx_make_ref_release" (:pointer (:struct bgfx-memory))
  (data (:pointer :void))
  (size :uint32)
  (release-fn bgfx-release-fn)
  (user-data (:pointer :void)))

(cffi:defcfun "bgfx_set_debug" :void
  (debug :uint32))

(cffi:defcfun "bgfx_dbg_text_clear" :void
  (attr :uint8)
  (small :bool))

(cffi:defcfun "bgfx_dbg_text_printf" :void
  (x :uint16)
  (y :uint16)
  (attr :uint8)
  (format :string))

;; what is a va_list to cffi? (arg-list)
(cffi:defcfun "bgfx_dbg_text_vprintf" :void
  (x :uint16)
  (y :uint16)
  (attr :uint8)
  (format :string)
  (arg-list :string))

(cffi:defcfun "bgfx_dbg_text_image" :void
  (x :uint16)
  (y :uint16)
  (width :uint16)
  (height :uint16)
  (data (:pointer :void))
  (pitch :uint16))

(cffi:defcfun "bgfx_create_index_buffer" bgfx-index-buffer-handle
  (mem (:pointer (:struct bgfx-memory)))
  (flags :uint16))
  
(cffi:defcfun "bgfx_destroy_index_buffer" :void
  (handle bgfx-index-buffer-handle))

(cffi:defcfun "bgfx_create_vertex_buffer" bgfx-vertex-buffer-handle
  (mem (:pointer (:struct bgfx-memory)))
  (decl  (:pointer (:struct bgfx-vertex-decl)))
  (flags :uint16))

(cffi:defcfun "bgfx_destroy_vertex_buffer" :void
  (handle bgfx-vertex-buffer-handle))

(cffi:defcfun "bgfx_create_dynamic_index_buffer" bgfx-dynamic-index-buffer-handle
  (num :uint32)
  (flags :uint16))

(cffi:defcfun "bgfx_create_dynamic_index_buffer_mem" bgfx-dynamic-index-buffer-handle
  (mem (:pointer (:struct bgfx-memory)))
  (flags :uint16))

(cffi:defcfun "bgfx_update_dynamic_index_buffer" :void
  (handle bgfx-dynamic-index-buffer-handle)
  (start-index :uint32)
  (mem (:pointer (:struct bgfx-memory))))

(cffi:defcfun "bgfx_destroy_dynamic_index_buffer" :void
  (handle bgfx-dynamic-index-buffer-handle))

(cffi:defcfun "bgfx_create_dynamic_vertex_buffer" bgfx-dynamic-vertex-buffer-handle
  (num :uint32)
  (decl (:pointer (:struct bgfx-vertex-decl)))
  (flags :uint16))

(cffi:defcfun "bgfx_create_dynamic_vertex_buffer_mem" bgfx-dynamic-vertex-buffer-handle
  (mem (:pointer (:struct bgfx-memory)))
  (decl (:pointer (:struct bgfx-vertex-decl)))
  (flags :uint16))

(cffi:defcfun "bgfx_update_dynamic_vertex_buffer" :void
  (handle bgfx-dynamic-vertex-buffer-handle)
  (start-vertex :uint32)
  (mem (:pointer (:struct bgfx-memory))))

(cffi:defcfun "bgfx_destroy_dynamic_vertex_buffer" :void
  (handle bgfx-vertex-buffer-handle))

(cffi:defcfun "bgfx_get_avail_transient_index_buffer" :uint32
  (num :uint32))

(cffi:defcfun "bgfx_get_avail_transient_vertex_buffer" :uint32
  (num :uint32)
  (decl (:pointer (:struct bgfx-vertex-decl))))

(cffi:defcfun "bgfx_get_avail_instance_data_buffer" :uint32
  (num :uint32)
  (stride :uint16))

(cffi:defcfun "bgfx_alloc_transient_index_buffer" :void
  (tib (:pointer (:struct bgfx-transient-index-buffer)))
  (num :uint32))

(cffi:defcfun "bgfx_alloc_transient_vertex_buffer" :void
  (tvb (:pointer (:struct bgfx-transient-vertex-buffer)))
  (num :uint32)
  (decl (:pointer (:struct bgfx-vertex-decl))))
 
(cffi:defcfun "bgfx_alloc_transient_buffers" :bool
  (tvb (:pointer (:struct bgfx-transient-vertex-buffer)))
  (decl (:pointer (:struct bgfx-vertex-decl)))
  (num-vertices :uint32)
  (tib (:pointer (:struct bgfx-transient-index-buffer)))
  (num-indices :uint32))

(cffi:defcfun "bgfx_alloc_instance_data_buffers" :void
  (idb (:pointer (:struct bgfx-instance-data-buffer)))
  (num :uint32)
  (stride :uint16))

(cffi:defcfun "bgfx_create_indirect_buffer" bgfx-indirect-buffer-handle
  (num :uint32))

(cffi:defcfun "bgfx_destroy_indirect_buffer" :void
  (handle bgfx-indirect-buffer-handle))

(cffi:defcfun "bgfx_create_shader" bgfx-shader-handle
  (mem (:pointer (:struct bgfx-memory))))

(cffi:defcfun "bgfx_get_shader_uniforms" :uint16
  (handle bgfx-shader-handle)
  (uniforms (:pointer bgfx-uniform-handle))
  (max :uint16))

(cffi:defcfun "bgfx_get_uniform_info" :void
  (handle bgfx-uniform-handle)
  (info (:pointer (:struct bgfx-uniform-info))))

(cffi:defcfun "bgfx_set_shader_name" :void
  (handle bgfx-shader-handle)
  (name :string)
  (length :int32))

(cffi:defcfun "bgfx_destroy_shader" :void
  (handle bgfx-shader-handle))

(cffi:defcfun "bgfx_create_program" bgfx-program-handle
  (csh bgfx-shader-handle)
  (destroy-shaders :bool))

(cffi:defcfun "bgfx_create_compute_program" bgfx-program-handle
  (csh bgfx-shader-handle)
  (destroy-shaders :bool))  

(cffi:defcfun "bgfx_destroy_program" :void
  (handle bgfx-program-handle))

(cffi:defcfun "bgfx_is_texture_valid" :bool
  (depth :uint16)
  (cube-map :bool)
  (num-layers :uint16)
  (format bgfx-texture-format)
  (flags :uint32))

(cffi:defcfun "bgfx_calc_texture_size" :void
  (info (:pointer (:struct bgfx-texture-info)))
  (width :uint16)
  (height :uint16)
  (depth :uint16)
  (cube-map :bool)
  (has-mips :bool)
  (num-layers :uint16)
  (format bgfx-texture-format))

(cffi:defcfun "bgfx_create_texture" bgfx-texture-handle
  (mem (:pointer (:struct bgfx-memory)))
  (flags :uint32)
  (skip :uint8)
  (info (:pointer (:struct bgfx-texture-info))))

(cffi:defcfun "bgfx_create_texture_2d" bgfx-texture-handle
  (width :uint16)
  (height :uint16)
  (has-mips :bool)
  (num-layers :uint16)
  (format bgfx-texture-format)
  (flags :uint32)
  (mem (:pointer (:struct bgfx-memory))))

(cffi:defcfun "bgfx_create_texture_2d_scaled" bgfx-texture-handle
  (ratio bgfx-backbuffer-ratio)
  (has-mips :bool)
  (num-layers :uint16)
  (texture-format bgfx-texture-format)
  (flags :uint32))

(cffi:defcfun "bgfx_create_texture_3d" bgfx-texture-handle
  (width :uint16)
  (height :uint16)
  (depth :uint16)
  (has-mips :bool)
  (format bgfx-texture-format)
  (flags :uint32)
  (mem (:pointer (:struct bgfx-memory))))

(cffi:defcfun "bgfx_create_texture_cube" bgfx-texture-handle
  (size :uint16)
  (has-mips :bool)
  (num-layers :uint16)
  (format bgfx-texture-format)
  (flags :uint32)
  (mem (:pointer (:struct bgfx-memory))))

(cffi:defcfun "bgfx_update_texture_2d" :void
  (handle bgfx-texture-handle)
  (layer :uint16)
  (mip :uint8)
  (x :uint16)
  (y :uint16)
  (width :uint16)
  (height :uint16)
  (mem (:pointer (:struct bgfx-memory)))
  (pitch :uint16))

(cffi:defcfun "bgfx_update_texture_3d" :void
  (handle bgfx-texture-handle)
  (mip :uint8)
  (x :uint16)
  (y :uint16)
  (z :uint16)
  (width :uint16)
  (height :uint16)
  (depth :uint16)
  (mem (:pointer (:struct bgfx-memory))))

(cffi:defcfun "bgfx_update_texture_cube" :void
  (handle bgfx-texture-handle)
  (layer :uint16)
  (side :uint8)
  (mip :uint8)
  (x :uint16)
  (y :uint16)
  (width :uint16)
  (height :uint16)
  (mem (:pointer (:struct bgfx-memory)))
  (pitch :uint16))

(cffi:defcfun "bgfx_read_texture" :uint32
  (handle bgfx-texture-handle)
  (data (:pointer :void))
  (mip :uint8))

(cffi:defcfun "bgfx_set_texture_name" :void
  (handle bgfx-texture-handle)
  (name :string)
  (len :int32))

(cffi:defcfun "bgfx_destroy_texture" :void
  (handle bgfx-texture-handle))

(cffi:defcfun "bgfx_create_frame_buffer" bgfx-frame-buffer-handle
  (width :uint16)
  (height :uint16)
  (format bgfx-texture-format)
  (texture-flags :uint32))

(cffi:defcfun "bgfx_create_frame_buffer_scaled" bgfx-frame-buffer-handle
  (ratio bgfx-backbuffer-ratio)
  (format bgfx-texture-format)
  (texture-flags :uint32))

(cffi:defcfun "bgfx_create_frame_buffer_from_handles" bgfx-frame-buffer-handle
  (num :uint8)
  (handles (:pointer bgfx-texture-handle))
  (destroy-textures :bool))

(cffi:defcfun "bgfx_create_frame_buffer_from_attachment" bgfx-frame-buffer-handle
  (num :uint8)
  (attachment (:pointer (:struct bgfx-attachment)))
  (destroy-texture :bool))

(cffi:defcfun "bgfx_create_frame_buffer_from_nwh" bgfx-frame-buffer-handle
  (nwh (:pointer :void))
  (width :uint16)
  (height :uint16)
  (depth-format bgfx-texture-format))

(cffi:defcfun "bgfx_get_texture" bgfx-texture-handle
  (handle bgfx-frame-buffer-handle)
  (attachment :uint8))

(cffi:defcfun "bgfx_destroy_frame_buffer" :void
  (handle bgfx-frame-buffer-handle))

(cffi:defcfun "bgfx_create_uniform" bgfx-uniform-handle
  (name :string)
  (type bgfx-uniform-type)
  (num :uint16))

(cffi:defcfun "bgfx_destroy_uniform" :void
  (handle bgfx-uniform-handle))

(cffi:defcfun "bgfx_create_occlusion_query" bgfx-occlusion-query-handle)

(cffi:defcfun "bgfx_get_result" bgfx-occlusion-query-result
  (handle bgfx-occlusion-query-handle)
  (result (:pointer :int32)))

(cffi:defcfun "bgfx_destroy_occlusion_query" :void
  (handle bgfx-occlusion-query-handle))

(cffi:defcfun "bgfx_set_palette_color" :void
  (index :uint8)
  (rgba :float :count 4))

(cffi:defcfun "bgfx_set_view_name" :void
  (id bgfx-view-id)
  (name :string))

(cffi:defcfun "bgfx_set_view_rect" :void
  (id bgfx-view-id)
  (x :uint16)
  (y :uint16)
  (width :uint16)
  (height :uint16))

(cffi:defcfun "bgfx_set_view_rect_auto" :void
  (id bgfx-view-id)
  (x :uint16)
  (y :uint16)
  (ratio bgfx-backbuffer-ratio))

(cffi:defcfun "bgfx_set_view_scissor" :void
  (id bgfx-view-id)
  (x :uint16)
  (y :uint16)
  (width :uint16)
  (height :uint16))

(cffi:defcfun "bgfx_set_view_clear" :void
  (id bgfx-view-id)
  (flags :uint16)
  (rgba :uint32)
  (depth :float)
  (stencil :uint8))

(cffi:defcfun "bgfx_set_view_clear_mrt" :void
  (id bgfx-view-id)
  (flags :uint16)
  (depth :float)
  (stencil :uint8)
  (_0 :uint8)
  (_1 :uint8)
  (_2 :uint8)
  (_3 :uint8)
  (_4 :uint8)
  (_5 :uint8)
  (_6 :uint8)
  (_7 :uint8))

(cffi:defcfun "bgfx_set_view_mode" :void
  (id bgfx-view-id)
  (mode bgfx-view-mode))

(cffi:defcfun "bgfx_set_view_frame_buffer" :void
  (id bgfx-view-id)
  (handle bgfx-frame-buffer-handle))
  
(cffi:defcfun "bgfx_set_view_transform" :void
  (id bgfx-view-id)
  (view (:pointer :void))
  (proj (:pointer :void)))

(cffi:defcfun "bgfx_set_view_transform_stereo" :void
  (id bgfx-view-id)
  (view (:pointer :void))
  (proj-l (:pointer :void))
  (flags :uint8)
  (proj-r (:pointer :void)))

;; order is ptr to bgfx-view-id
(cffi:defcfun "bgfx_set_view_order" :void
  (id :uint16)
  (num :uint16)
  (order (:pointer :uint16)))

(cffi:defcfun "bgfx_reset_view" :void
  (id bgfx-view-id))

(cffi:defcfun "bgfx_set_marker" :void
  (marker :string))

(cffi:defcfun "bgfx_set_state" :void
  (state :uint64)
  (rgba :uint32))

(cffi:defcfun "bgfx_set_condition" :void
  (handle bgfx-occlusion-query-handle)
  (visible :bool))

(cffi:defcfun "bgfx_set_stencil" :void
  (f-stencil :uint32)
  (b-stencil :uint32))

(cffi:defcfun "bgfx_set_scissor" :uint16
  (x :uint16)
  (y :uint16)
  (width :uint16)
  (height :uint16))

(cffi:defcfun "bgfx_set_scissor_cached" :void
  (cache :uint16))

(cffi:defcfun "bgfx_set_transform" :uint32
  (mtx (:pointer :void))
  (num :uint16))

(cffi:defcfun "bgfx_alloc_transform" :uint32
  (transform (:pointer (:struct bgfx-transform)))
  (num :uint16))

(cffi:defcfun "bgfx_set_transform_cached" :void
  (cache :uint32)
  (num :uint16))

(cffi:defcfun "bgfx_set_uniform" :void
  (handle bgfx-uniform-handle)
  (value (:pointer :void))
  (num :uint16))

(cffi:defcfun "bgfx_set_index_buffer" :void
  (handle bgfx-index-buffer-handle)
  (first-index :uint32)
  (num-indices :uint32))

(cffi:defcfun "bgfx_set_dynamic_index_buffer" :void
  (handle bgfx-dynamic-index-buffer-handle)
  (first-index :uint32)
  (num-indices :uint32))

(cffi:defcfun "bgfx_set_transient_index_buffer" :void
  (tib (:pointer (:struct bgfx-transient-index-buffer)))
  (first-index :uint32)
  (num-indices :uint32))

(cffi:defcfun "bgfx_set_vertex_buffer" :void
  (stream :uint8)
  (handle bgfx-vertex-buffer-handle)
  (start-vertex :uint32)
  (num-vertices :uint32))
	      
(cffi:defcfun "bgfx_set_dynamic_vertex_buffer" :void
  (stream :uint8)
  (handle bgfx-dynamic-vertex-buffer-handle)
  (start-vertex :uint32)
  (num-vertices :uint32))
  
(cffi:defcfun "bgfx_set_transient_vertex_buffer" :void
  (stream :uint8)
  (tvb (:pointer (:struct bgfx-transient-vertex-buffer)))
  (start-vertex :uint32)
  (num-vertices :uint32))

(cffi:defcfun "bgfx_set_vertex_count" :void
  (num-vertices :uint32))

(cffi:defcfun "bgfx_set_instance_data_buffer" :void
  (idb (:pointer (:struct bgfx-instance-data-buffer)))
  (start :uint32)
  (num :uint32))

(cffi:defcfun "bgfx_set_instance_data_from_vertex_buffer" :void
  (handle bgfx-vertex-buffer-handle)
  (start-vertex :uint32)
  (num :uint32))

(cffi:defcfun "bgfx_set_instance_data_from_dynamic_vertex_buffer" :void
  (handle bgfx-dynamic-vertex-buffer-handle)
  (start-vertex :uint32)
  (num :uint32))

(cffi:defcfun "bgfx_set_texture" :void
  (stage :uint8)
  (sampler bgfx-uniform-handle)
  (handle bgfx-texture-handle)
  (flags :uint32))

(cffi:defcfun "bgfx_touch" :uint32
  (id bgfx-view-id))

(cffi:defcfun "bgfx_submit" :uint32
  (id bgfx-view-id)
  (handle bgfx-program-handle)
  (depth :int32)
  (preserve-state :bool))

(cffi:defcfun "bgfx_submit_occlusion_query" :uint32
  (id bgfx-view-id)
  (program bgfx-program-handle)
  (occlusion-query bgfx-occlusion-query-handle)
  (depth :int32)
  (preserve-state :bool))

(cffi:defcfun "bgfx_submit_indirect" :uint32
  (id bgfx-view-id)
  (handle bgfx-program-handle)
  (indirect-handle bgfx-indirect-buffer-handle)
  (start :uint16)
  (num :uint16)
  (depth :uint32)
  (preserve-state :bool))

(cffi:defcfun "bgfx_set_image" :void
  (stage :uint8)
  (handle bgfx-texture-handle)
  (mip :uint8)
  (access bgfx-access)
  (format bgfx-texture-format))

(cffi:defcfun "bgfx_set_compute_index_buffer" :void
  (stage :uint8)
  (handle bgfx-index-buffer-handle)
  (access bgfx-access))

(cffi:defcfun "bgfx_set_compute_vertex_buffer" :void
  (stage :uint8)
  (handle bgfx-vertex-buffer-handle)
  (access bgfx-access))

(cffi:defcfun "bgfx_set_compute_dynamic_index_buffer" :void
  (stage :uint8)
  (handle bgfx-dynamic-index-buffer-handle)
  (access bgfx-access))

(cffi:defcfun "bgfx_set_compute_dynamic_vertex_buffer" :void
  (stage :uint8)
  (handle bgfx-dynamic-vertex-buffer-handle)
  (access bgfx-access))

(cffi:defcfun "bgfx_set_compute_indirect_buffer" :void
  (stage :uint8)
  (handle bgfx-indirect-buffer-handle)
  (access bgfx-access))

(cffi:defcfun "bgfx_dispatch" :void
  (id bgfx-view-id)
  (handle bgfx-program-handle)
  (indirect-handle bgfx-indirect-buffer-handle)
  (start :uint16)
  (num :uint16)
  (flags :uint8))

(cffi:defcfun "bgfx_dispatch_indirect" :uint32
  (id bgfx-view-id)
  (handle bgfx-program-handle)
  (indirect-handle bgfx-indirect-buffer-handle)
  (start :uint16)
  (num :uint16)
  (flags :uint8))

(cffi:defcfun "bgfx_discard" :void)

(cffi:defcfun "bgfx_blit" :void
  (id bgfx-view-id)
  (dst bgfx-texture-handle)
  (dst-mip :uint8)
  (dst-x :uint16)
  (dst-y :uint16)
  (dst-z :uint16)
  (src bgfx-texture-handle)
  (src-mip :uint8)
  (src-x :uint16)
  (src-y :uint16)
  (src-z :uint16)
  (width :uint16)
  (height :uint16)
  (depth :uint16))

;;; a param of these "bgfx_encoder_*" functions is a ptr to struct bgfx_encoder_s
;;; which is not defined anywhere, so I just treat it as an untyped ptr
(cffi:defcfun "bgfx_encoder_set_marker" :void
  (encoder :pointer)
  (marker (:pointer :char)))

(cffi:defcfun "bgfx_encoder_set_state" :void
  (encoder :pointer)
  (state :uint64)
  (rgba :uint32))

(cffi:defcfun "bgfx_encoder_set_condition" :void
  (encoder :pointer)
  (handle bgfx-occlusion-query-handle)
  (visible :bool))

(cffi:defcfun "bgfx_encoder_set_stencil" :void
  (encoder :pointer)
  (fstencil :uint32)
  (bstencil :uint32))

(cffi:defcfun "bgfx_encoder_set_scissor" :uint16
  (encoder :pointer)
  (x :uint16)
  (y :uint16)
  (width :uint16)
  (height :uint16))

(cffi:defcfun "bgfx_encoder_set_scissor_cached" :void
  (encoder :pointer)
  (cache :uint16))

(cffi:defcfun "bgfx_encoder_set_transform" :uint32
  (encoder :pointer)
  (mtx (:pointer :void))
  (num :uint16))

(cffi:defcfun "bgfx_encoder_alloc_transform" :uint32
  (encoder :pointer)
  (transform (:pointer (:struct bgfx-transform)))
  (num :uint16))

(cffi:defcfun "bgfx_encoder_set_transform_cached" :void
  (encoder :pointer)
  (cache :uint32)
  (num :uint16))

(cffi:defcfun "bgfx_encoder_set_uniform" :void
  (encoder :pointer)
  (handle bgfx-uniform-handle)
  (value (:pointer :void))
  (num :uint16))

(cffi:defcfun "bgfx_encoder_set_index_buffer" :void
  (encoder :pointer)
  (handle bgfx-index-buffer-handle)
  (first-index :uint32)
  (num-indices :uint32))

(cffi:defcfun "bgfx_encoder_set_dynamic_index_buffer" :void
  (encoder :pointer)
  (handle bgfx-dynamic-index-buffer-handle)
  (first-index :uint32)
  (num-indices :uint32))

(cffi:defcfun "bgfx_encoder_set_transient_index_buffer" :void
  (encoder :pointer)
  (tib (:pointer (:struct bgfx-transient-index-buffer)))
  (first-index :uint32)
  (num-indices :uint32))

(cffi:defcfun "bgfx_encoder_set_vertex_buffer" :void
  (encoder :pointer)
  (stream :uint8)
  (handle bgfx-vertex-buffer-handle)
  (start-vertex :uint32)
  (num-vertices :uint32))

(cffi:defcfun "bgfx_encoder_set_dynamic_vertex_buffer" :void
  (encoder :pointer)
  (stream :uint8)
  (handle bgfx-dynamic-vertex-buffer-handle)
  (start-vertex :uint32)
  (num-vertices :uint32))

(cffi:defcfun "bgfx_encoder_set_transient_vertex_buffer" :void
  (encoder :pointer)
  (stream :uint8)
  (tvb (:pointer (:struct bgfx-transient-vertex-buffer)))
  (start-vertex :uint32)
  (num-vertices :uint32))

(cffi:defcfun "bgfx_encoder_set_vertex_count" :void
  (encoder :pointer)
  (num-vertices :uint32))

(cffi:defcfun "bgfx_encoder_set_instance_data_buffer" :void
  (encoder :pointer)
  (idb (:pointer (:struct bgfx-instance-data-buffer)))
  (start :uint32)
  (num :uint32))

(cffi:defcfun "bgfx_encoder_set_instance_data_from_vertex_buffer" :void
  (encoder :pointer)
  (handle bgfx-vertex-buffer-handle)
  (start-vertex :uint32)
  (num :uint32))

(cffi:defcfun "bgfx_encoder_set_instance_data_from_dynamic_vertex_buffer" :void
  (encoder :pointer)
  (handle bgfx-dynamic-vertex-buffer-handle)
  (start-vertex :uint32)
  (num :uint32))

(cffi:defcfun "bgfx_encoder_set_texture" :void
  (encoder :pointer)
  (stage :uint8)
  (sampler bgfx-uniform-handle)
  (handle bgfx-texture-handle)
  (flags :uint32))

(cffi:defcfun "bgfx_encoder_touch" :void
  (encoder :pointer)
  (id bgfx-view-id))

(cffi:defcfun "bgfx_encoder_submit" :void
  (encoder :pointer)
  (id bgfx-view-id)
  (handle bgfx-program-handle)
  (depth :int32)
  (preserve-state :bool))

(cffi:defcfun "bgfx_encoder_submit_occlusion_query" :void
  (encoder :pointer)
  (id bgfx-view-id)
  (prgram bgfx-program-handle)
  (occlusion-query bgfx-occlusion-query-handle)
  (depth :int32)
  (preserve-state :bool))

(cffi:defcfun "bgfx_encoder_submit_indirect" :void
  (encoder :pointer)
  (id bgfx-view-id)
  (handle bgfx-program-handle)
  (indirect-handle bgfx-indirect-buffer-handle)
  (start :uint16)
  (num :uint16)
  (depth :int32)
  (preserve-state :bool))

(cffi:defcfun "bgfx_encoder_set_image" :void
  (encoder :pointer)
  (stage :uint8)
  (handle bgfx-texture-handle)
  (mip :uint8)
  (access bgfx-access)
  (format bgfx-texture-format))

(cffi:defcfun "bgfx_encoder_set_compute_index_buffer" :void
  (encoder :pointer)
  (stage :uint8)
  (handle bgfx-index-buffer-handle)
  (access bgfx-access))

(cffi:defcfun "bgfx_encoder_set_compute_vertex_buffer" :void
  (encoder :pointer)
  (stage :uint8)
  (handle bgfx-vertex-buffer-handle)
  (access bgfx-access))

(cffi:defcfun "bgfx_encoder_set_compute_dynamic_index_buffer" :void
  (encoder :pointer)
  (stage :uint8)
  (handle bgfx-dynamic-index-buffer-handle)
  (access bgfx-access))

(cffi:defcfun "bgfx_encoder_set_compute_dynamic_vertex_buffer" :void
  (encoder :pointer)
  (stage :uint8)
  (handle bgfx-dynamic-vertex-buffer-handle)
  (access bgfx-access))

(cffi:defcfun "bgfx_encoder_set_compute_indirect_buffer" :void
  (encoder :pointer)
  (stage :uint8)
  (handle bgfx-indirect-buffer-handle)
  (access bgfx-access))

(cffi:defcfun "bgfx_encoder_dispatch" :void
  (encoder :pointer)
  (id bgfx-view-id)
  (handle bgfx-program-handle)
  (num-x :uint32)
  (num-y :uint32)
  (num-z :uint32)
  (flags :uint8))

(cffi:defcfun "bgfx_encoder_dispatch_indirect" :void
  (encoder :pointer)
  (id bgfx-view-id)
  (handle bgfx-program-handle)
  (indirect-handle bgfx-indirect-buffer-handle)
  (start :uint16)
  (num :uint16)
  (flags :uint8))

(cffi:defcfun "bgfx_encoder_discard" :void
  (encoder :pointer))

(cffi:defcfun "bgfx_encoder_blit" :void
  (encoder :pointer)
  (id bgfx-view-id)
  (dst bgfx-texture-handle)
  (dst-mip :uint8)
  (dst-x :uint16)
  (dst-y :uint16)
  (dst-z :uint16)
  (src bgfx-texture-handle)
  (src-mip :uint8)
  (src-x :uint16)
  (src-y :uint16)
  (src-z :uint16)
  (width :uint16)
  (height :uint16)
  (depth :uint16))

(cffi:defcfun "bgfx_request_screen_shot" :void
  (handle bgfx-frame-buffer-handle)
  (file-path :string))

;;; these are from platform.h
(cffi:defcstruct bgfx-platform-data
  (ndt (:pointer :void))
  (nwh (:pointer :void))
  (context (:pointer :void))
  (back-buffer (:pointer :void))
  (back-buffer-ds (:pointer :void))
  (session (:pointer :void)))

(cffi:defcfun "bgfx_set_platform_data" :void
  (data (:pointer (:struct bgfx-platform-data))))

(cffi:defcenum bgfx-render-frame
  :bgfx-render-frame-no-context
  :bgfx-render-frame-render
  :bgfx-render-frame-timeout
  :bgfx-render-frame-exiting
  :bgfx-render-frame-count)
  
(cffi:defcfun "bgfx_render_frame" bgfx-render-frame
  (m-secs (:int32)))

(cffi:defcstruct bgfx-internal-data
  (caps (:pointer (:struct bgfx-caps)))
  (context (:pointer)))

(cffi:defcfun "bgfx_get_internal_data" (:pointer (:struct bgfx-internal-data)))

(cffi:defcfun "bgfx_override_internal_texture_ptr" :pointer
  (handle bgfx-texture-handle)
  (ptr :pointer))

(cffi:defcfun "bgfx_override_internal_texture" :pointer
  (handle bgfx-texture-handle)
  (width :uint16)
  (height :uint16)
  (num-mips :uint8)
  (format bgfx-texture-format)
  (flags :uint32))
