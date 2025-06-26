#pragma once

#include once "crt/stdio.bi"
#include once "crt/stdlib.bi"
#include once "crt/stddef.bi"
#include once "crt/limits.bi"
#include once "crt/string.bi"
#include once "crt/stdint.bi"
#inclib "yyjson"

extern "C"

#define YYJSON_H
const YYJSON_MSC_VER = 0
type bool as byte
#define YYJSON_GCC_VER __GNUC__
#define yyjson_gcc_available(major, minor, patch) ((((__GNUC__ * 10000) + (__GNUC_MINOR__ * 100)) + __GNUC_PATCHLEVEL__) >= (((major * 10000) + (minor * 100)) + patch))
const YYJSON_IS_REAL_GCC = 0
#define YYJSON_STDC_VER __STDC_VERSION__
const YYJSON_CPP_VER = 0
#define yyjson_has_builtin(x) 0
#define yyjson_has_attribute(x) 0
#define yyjson_has_feature(x) __has_feature(x)
#define yyjson_has_include(x) 0

#define yyjson_likely(expr) __builtin_expect(-(((expr) = 0) = 0), 1)
#define yyjson_unlikely(expr) __builtin_expect(-(((expr) = 0) = 0), 0)
const YYJSON_HAS_CONSTANT_P = 1
#define yyjson_constant_p(value) __builtin_constant_p(value)

#ifdef __FB_WIN32__
   #define yyjson_api
#endif


const YYJSON_U64_TO_F64_NO_IMPL = 0
const YYJSON_VERSION_MAJOR = 0
const YYJSON_VERSION_MINOR = 11
const YYJSON_VERSION_PATCH = 1
const YYJSON_VERSION_HEX = &h000B01
#define YYJSON_VERSION_STRING "0.11.1"
declare function yyjson_version() as ulong
type yyjson_type as ubyte
const YYJSON_TYPE_NONE = cubyte(0)
const YYJSON_TYPE_RAW = cubyte(1)
const YYJSON_TYPE_NULL = cubyte(2)
const YYJSON_TYPE_BOOL = cubyte(3)
const YYJSON_TYPE_NUM = cubyte(4)
const YYJSON_TYPE_STR = cubyte(5)
const YYJSON_TYPE_ARR = cubyte(6)
const YYJSON_TYPE_OBJ = cubyte(7)
type yyjson_subtype as ubyte
const YYJSON_SUBTYPE_NONE = cubyte(0 shl 3)
const YYJSON_SUBTYPE_FALSE = cubyte(0 shl 3)
const YYJSON_SUBTYPE_TRUE = cubyte(1 shl 3)
const YYJSON_SUBTYPE_UINT = cubyte(0 shl 3)
const YYJSON_SUBTYPE_SINT = cubyte(1 shl 3)
const YYJSON_SUBTYPE_REAL = cubyte(2 shl 3)
const YYJSON_SUBTYPE_NOESC = cubyte(1 shl 3)
const YYJSON_TYPE_MASK = cubyte(&h07)
const YYJSON_TYPE_BIT = cubyte(3)
const YYJSON_SUBTYPE_MASK = cubyte(&h18)
const YYJSON_SUBTYPE_BIT = cubyte(2)
const YYJSON_RESERVED_MASK = cubyte(&hE0)
const YYJSON_RESERVED_BIT = cubyte(3)
const YYJSON_TAG_MASK = cubyte(&hFF)
const YYJSON_TAG_BIT = cubyte(8)
const YYJSON_PADDING_SIZE = 4

type yyjson_alc
   malloc as function(byval ctx as any ptr, byval size as uinteger) as any ptr
   realloc as function(byval ctx as any ptr, byval ptr_ as any ptr, byval old_size as uinteger, byval size as uinteger) as any ptr
   free as sub(byval ctx as any ptr, byval ptr_ as any ptr)
   ctx as any ptr
end type

declare function yyjson_alc_pool_init(byval alc as yyjson_alc ptr, byval buf as any ptr, byval size as uinteger) as bool
declare function yyjson_alc_dyn_new() as yyjson_alc ptr
declare sub yyjson_alc_dyn_free(byval alc as yyjson_alc ptr)
declare function yyjson_locate_pos(byval str_ as const zstring ptr, byval len_ as uinteger, byval pos_ as uinteger, byval line as uinteger ptr, byval col as uinteger ptr, byval chr as uinteger ptr) as bool
type yyjson_read_flag as ulong

dim shared YYJSON_READ_NOFLAG as const yyjson_read_flag = 0
dim shared YYJSON_READ_INSITU as const yyjson_read_flag = 1 shl 0
dim shared YYJSON_READ_STOP_WHEN_DONE as const yyjson_read_flag = 1 shl 1
dim shared YYJSON_READ_ALLOW_TRAILING_COMMAS as const yyjson_read_flag = 1 shl 2
dim shared YYJSON_READ_ALLOW_COMMENTS as const yyjson_read_flag = 1 shl 3
dim shared YYJSON_READ_ALLOW_INF_AND_NAN as const yyjson_read_flag = 1 shl 4
dim shared YYJSON_READ_NUMBER_AS_RAW as const yyjson_read_flag = 1 shl 5
dim shared YYJSON_READ_ALLOW_INVALID_UNICODE as const yyjson_read_flag = 1 shl 6
dim shared YYJSON_READ_BIGNUM_AS_RAW as const yyjson_read_flag = 1 shl 7
dim shared YYJSON_READ_ALLOW_BOM as const yyjson_read_flag = 1 shl 8
type yyjson_read_code as ulong
dim shared YYJSON_READ_SUCCESS as const yyjson_read_code = 0
dim shared YYJSON_READ_ERROR_INVALID_PARAMETER as const yyjson_read_code = 1
dim shared YYJSON_READ_ERROR_MEMORY_ALLOCATION as const yyjson_read_code = 2
dim shared YYJSON_READ_ERROR_EMPTY_CONTENT as const yyjson_read_code = 3
dim shared YYJSON_READ_ERROR_UNEXPECTED_CONTENT as const yyjson_read_code = 4
dim shared YYJSON_READ_ERROR_UNEXPECTED_END as const yyjson_read_code = 5
dim shared YYJSON_READ_ERROR_UNEXPECTED_CHARACTER as const yyjson_read_code = 6
dim shared YYJSON_READ_ERROR_JSON_STRUCTURE as const yyjson_read_code = 7
dim shared YYJSON_READ_ERROR_INVALID_COMMENT as const yyjson_read_code = 8
dim shared YYJSON_READ_ERROR_INVALID_NUMBER as const yyjson_read_code = 9
dim shared YYJSON_READ_ERROR_INVALID_STRING as const yyjson_read_code = 10
dim shared YYJSON_READ_ERROR_LITERAL as const yyjson_read_code = 11
dim shared YYJSON_READ_ERROR_FILE_OPEN as const yyjson_read_code = 12
dim shared YYJSON_READ_ERROR_FILE_READ as const yyjson_read_code = 13
dim shared YYJSON_READ_ERROR_MORE as const yyjson_read_code = 14

type yyjson_read_err
   code as yyjson_read_code
   msg as const zstring ptr
   pos_ as uinteger
end type

type yyjson_doc as yyjson_doc_
declare function yyjson_read_opts(byval dat as zstring ptr, byval len_ as uinteger, byval flg as yyjson_read_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_read_err ptr) as yyjson_doc ptr
declare function yyjson_read_file(byval path as const zstring ptr, byval flg as yyjson_read_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_read_err ptr) as yyjson_doc ptr
declare function yyjson_read_fp(byval fp as FILE ptr, byval flg as yyjson_read_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_read_err ptr) as yyjson_doc ptr

private function yyjson_read(byval dat as const zstring ptr, byval len_ as uinteger, byval flg as yyjson_read_flag) as yyjson_doc ptr
   flg and= not YYJSON_READ_INSITU
   return yyjson_read_opts(cptr(zstring ptr, cptr(any ptr, cuint(cptr(const any ptr, dat)))), len_, flg, NULL, NULL)
end function
type yyjson_incr_state as any ptr
declare function yyjson_incr_new(byval buf as zstring ptr, byval buf_len as uinteger, byval flg as yyjson_read_flag, byval alc as const yyjson_alc ptr) as yyjson_incr_state ptr
declare function yyjson_incr_read(byval state as yyjson_incr_state ptr, byval len_ as uinteger, byval err_ as yyjson_read_err ptr) as yyjson_doc ptr
declare sub yyjson_incr_free(byval state as yyjson_incr_state ptr)

private function yyjson_read_max_memory_usage(byval len_ as uinteger, byval flg as yyjson_read_flag) as uinteger
   dim mul as uinteger = cuint(12) + (-((flg and YYJSON_READ_INSITU) = 0))
   dim pad as uinteger = 256
   dim max as uinteger = cuint(not cuint(0))
   if flg and YYJSON_READ_STOP_WHEN_DONE then
      len_ = iif(len_ < 256, 256, len_)
   end if
   if len_ >= (((max - pad) - mul) / mul) then
      return 0
   end if
   return (len_ * mul) + pad
end function

type yyjson_val as yyjson_val_
declare function yyjson_read_number(byval dat as const zstring ptr, byval val_ as yyjson_val ptr, byval flg as yyjson_read_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_read_err ptr) as const zstring ptr
type yyjson_mut_val as yyjson_mut_val_
#define yyjson_mut_read_number(dat, val_, flg, alc, err_) cptr(const zstring ptr, yyjson_read_number((dat), cptr(yyjson_val ptr, (val_)), (flg), (alc), (err_)))
type yyjson_write_flag as ulong
dim shared YYJSON_WRITE_NOFLAG as const yyjson_write_flag = 0
dim shared YYJSON_WRITE_PRETTY as const yyjson_write_flag = 1 shl 0
dim shared YYJSON_WRITE_ESCAPE_UNICODE as const yyjson_write_flag = 1 shl 1
dim shared YYJSON_WRITE_ESCAPE_SLASHES as const yyjson_write_flag = 1 shl 2
dim shared YYJSON_WRITE_ALLOW_INF_AND_NAN as const yyjson_write_flag = 1 shl 3
dim shared YYJSON_WRITE_INF_AND_NAN_AS_NULL as const yyjson_write_flag = 1 shl 4
dim shared YYJSON_WRITE_ALLOW_INVALID_UNICODE as const yyjson_write_flag = 1 shl 5
dim shared YYJSON_WRITE_PRETTY_TWO_SPACES as const yyjson_write_flag = 1 shl 6
dim shared YYJSON_WRITE_NEWLINE_AT_END as const yyjson_write_flag = 1 shl 7

const YYJSON_WRITE_FP_FLAG_BITS = 8
const YYJSON_WRITE_FP_PREC_BITS = 4
#define YYJSON_WRITE_FP_TO_FIXED(prec) cast(yyjson_write_flag, culng(culng(culng(prec)) shl (32 - 4)))
const YYJSON_WRITE_FP_TO_FLOAT = cast(yyjson_write_flag, 1 shl (32 - 5))
type yyjson_write_code as ulong

dim shared YYJSON_WRITE_SUCCESS as const yyjson_write_code = 0
dim shared YYJSON_WRITE_ERROR_INVALID_PARAMETER as const yyjson_write_code = 1
dim shared YYJSON_WRITE_ERROR_MEMORY_ALLOCATION as const yyjson_write_code = 2
dim shared YYJSON_WRITE_ERROR_INVALID_VALUE_TYPE as const yyjson_write_code = 3
dim shared YYJSON_WRITE_ERROR_NAN_OR_INF as const yyjson_write_code = 4
dim shared YYJSON_WRITE_ERROR_FILE_OPEN as const yyjson_write_code = 5
dim shared YYJSON_WRITE_ERROR_FILE_WRITE as const yyjson_write_code = 6
dim shared YYJSON_WRITE_ERROR_INVALID_STRING as const yyjson_write_code = 7

type yyjson_write_err
   code as yyjson_write_code
   msg as const zstring ptr
end type

declare function yyjson_write_opts(byval doc as const yyjson_doc ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval len_ as uinteger ptr, byval err_ as yyjson_write_err ptr) as zstring ptr
declare function yyjson_write_file(byval path as const zstring ptr, byval doc as const yyjson_doc ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_write_err ptr) as bool
declare function yyjson_write_fp(byval fp as FILE ptr, byval doc as const yyjson_doc ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_write_err ptr) as bool
#define yyjson_write(doc, flg, len_) cptr(zstring ptr, yyjson_write_opts((doc), (flg), NULL, (len_), NULL))
type yyjson_mut_doc as yyjson_mut_doc_
declare function yyjson_mut_write_opts(byval doc as const yyjson_mut_doc ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval len_ as uinteger ptr, byval err_ as yyjson_write_err ptr) as zstring ptr
declare function yyjson_mut_write_file(byval path as const zstring ptr, byval doc as const yyjson_mut_doc ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_write_err ptr) as bool
declare function yyjson_mut_write_fp(byval fp as FILE ptr, byval doc as const yyjson_mut_doc ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_write_err ptr) as bool
#define yyjson_mut_write(doc, flg, len_) cptr(zstring ptr, yyjson_mut_write_opts((doc), (flg), NULL, (len_), NULL))
declare function yyjson_val_write_opts(byval val_ as const yyjson_val ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval len_ as uinteger ptr, byval err_ as yyjson_write_err ptr) as zstring ptr
declare function yyjson_val_write_file(byval path as const zstring ptr, byval val_ as const yyjson_val ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_write_err ptr) as bool
declare function yyjson_val_write_fp(byval fp as FILE ptr, byval val_ as const yyjson_val ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_write_err ptr) as bool
#define yyjson_val_write(val_, flg, len_) cptr(zstring ptr, yyjson_val_write_opts((val_), (flg), NULL, (len_), NULL))
declare function yyjson_mut_val_write_opts(byval val_ as const yyjson_mut_val ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval len_ as uinteger ptr, byval err_ as yyjson_write_err ptr) as zstring ptr
declare function yyjson_mut_val_write_file(byval path as const zstring ptr, byval val_ as const yyjson_mut_val ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_write_err ptr) as bool
declare function yyjson_mut_val_write_fp(byval fp as FILE ptr, byval val_ as const yyjson_mut_val ptr, byval flg as yyjson_write_flag, byval alc as const yyjson_alc ptr, byval err_ as yyjson_write_err ptr) as bool
#define yyjson_mut_val_write(val_, flg, len_) cptr(zstring ptr, yyjson_mut_val_write_opts((val_), (flg), NULL, (len_), NULL))
declare function yyjson_doc_get_root(byval doc as yyjson_doc ptr) as yyjson_val ptr
declare function yyjson_doc_get_read_size(byval doc as yyjson_doc ptr) as uinteger
declare function yyjson_doc_get_val_count(byval doc as yyjson_doc ptr) as uinteger
declare sub yyjson_doc_free(byval doc as yyjson_doc ptr)
declare function yyjson_is_raw(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_null(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_true(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_false(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_bool(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_uint(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_sint(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_int(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_real(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_num(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_str(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_arr(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_obj(byval val_ as yyjson_val ptr) as bool
declare function yyjson_is_ctn(byval val_ as yyjson_val ptr) as bool
declare function yyjson_get_type(byval val_ as yyjson_val ptr) as yyjson_type
declare function yyjson_get_subtype(byval val_ as yyjson_val ptr) as yyjson_subtype
declare function yyjson_get_tag(byval val_ as yyjson_val ptr) as ubyte
declare function yyjson_get_type_desc(byval val_ as yyjson_val ptr) as const zstring ptr
declare function yyjson_get_raw(byval val_ as yyjson_val ptr) as const zstring ptr
declare function yyjson_get_bool(byval val_ as yyjson_val ptr) as bool
declare function yyjson_get_uint(byval val_ as yyjson_val ptr) as ulongint
declare function yyjson_get_sint(byval val_ as yyjson_val ptr) as longint
declare function yyjson_get_int(byval val_ as yyjson_val ptr) as long
declare function yyjson_get_real(byval val_ as yyjson_val ptr) as double
declare function yyjson_get_num(byval val_ as yyjson_val ptr) as double
declare function yyjson_get_str(byval val_ as yyjson_val ptr) as const zstring ptr
declare function yyjson_get_len(byval val_ as yyjson_val ptr) as uinteger
declare function yyjson_equals_str(byval val_ as yyjson_val ptr, byval str_ as const zstring ptr) as bool
declare function yyjson_equals_strn(byval val_ as yyjson_val ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
declare function yyjson_equals(byval lhs as yyjson_val ptr, byval rhs as yyjson_val ptr) as bool
declare function yyjson_set_raw(byval val_ as yyjson_val ptr, byval raw as const zstring ptr, byval len_ as uinteger) as bool
declare function yyjson_set_null(byval val_ as yyjson_val ptr) as bool
declare function yyjson_set_bool(byval val_ as yyjson_val ptr, byval num as bool) as bool
declare function yyjson_set_uint(byval val_ as yyjson_val ptr, byval num as ulongint) as bool
declare function yyjson_set_sint(byval val_ as yyjson_val ptr, byval num as longint) as bool
declare function yyjson_set_int(byval val_ as yyjson_val ptr, byval num as long) as bool
declare function yyjson_set_float(byval val_ as yyjson_val ptr, byval num as single) as bool
declare function yyjson_set_double(byval val_ as yyjson_val ptr, byval num as double) as bool
declare function yyjson_set_real(byval val_ as yyjson_val ptr, byval num as double) as bool
declare function yyjson_set_fp_to_fixed(byval val_ as yyjson_val ptr, byval prec as long) as bool
declare function yyjson_set_fp_to_float(byval val_ as yyjson_val ptr, byval flt as bool) as bool
declare function yyjson_set_str(byval val_ as yyjson_val ptr, byval str_ as const zstring ptr) as bool
declare function yyjson_set_strn(byval val_ as yyjson_val ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
declare function yyjson_set_str_noesc(byval val_ as yyjson_val ptr, byval noesc as bool) as bool
declare function yyjson_arr_size(byval arr as yyjson_val ptr) as uinteger
declare function yyjson_arr_get(byval arr as yyjson_val ptr, byval idx as uinteger) as yyjson_val ptr
declare function yyjson_arr_get_first(byval arr as yyjson_val ptr) as yyjson_val ptr
declare function yyjson_arr_get_last(byval arr as yyjson_val ptr) as yyjson_val ptr

type yyjson_arr_iter
   idx as uinteger
   max as uinteger
   cur as yyjson_val ptr
end type

declare function yyjson_arr_iter_init(byval arr as yyjson_val ptr, byval iter as yyjson_arr_iter ptr) as bool
declare function yyjson_arr_iter_with(byval arr as yyjson_val ptr) as yyjson_arr_iter
declare function yyjson_arr_iter_has_next(byval iter as yyjson_arr_iter ptr) as bool
declare function yyjson_arr_iter_next(byval iter as yyjson_arr_iter ptr) as yyjson_val ptr
#define yyjson_arr_foreach_next wend:end scope
#macro yyjson_arr_foreach(arr, idx, max, val_) 
scope 
    (idx) = 0
    (max) = yyjson_arr_size(arr)     
   while true     
      if (idx) < (max) then 
          (val_) =iif((idx) = 0,  yyjson_arr_get_first(arr),unsafe_yyjson_get_next(val_))
         (idx) += 1
      else
         exit while
      End If  
  
#endmacro
declare function yyjson_obj_size(byval obj as yyjson_val ptr) as uinteger
declare function yyjson_obj_get(byval obj as yyjson_val ptr, byval key as const zstring ptr) as yyjson_val ptr
declare function yyjson_obj_getn(byval obj as yyjson_val ptr, byval key as const zstring ptr, byval key_len as uinteger) as yyjson_val ptr

type yyjson_obj_iter
   idx as uinteger
   max as uinteger
   cur as yyjson_val ptr
   obj as yyjson_val ptr
end type

declare function yyjson_obj_iter_init(byval obj as yyjson_val ptr, byval iter as yyjson_obj_iter ptr) as bool
declare function yyjson_obj_iter_with(byval obj as yyjson_val ptr) as yyjson_obj_iter
declare function yyjson_obj_iter_has_next(byval iter as yyjson_obj_iter ptr) as bool
declare function yyjson_obj_iter_next(byval iter as yyjson_obj_iter ptr) as yyjson_val ptr
declare function yyjson_obj_iter_get_val(byval key as yyjson_val ptr) as yyjson_val ptr
declare function yyjson_obj_iter_get(byval iter as yyjson_obj_iter ptr, byval key as const zstring ptr) as yyjson_val ptr
declare function yyjson_obj_iter_getn(byval iter as yyjson_obj_iter ptr, byval key as const zstring ptr, byval key_len as uinteger) as yyjson_val ptr
'' TODO: #define yyjson_obj_foreach(obj, idx, max, key, val) for ((idx) = 0, (max) = yyjson_obj_size(obj), (key) = (obj) ? unsafe_yyjson_get_first(obj) : NULL, (val) = (key) + 1; (idx) < (max); (idx)++, (key) = unsafe_yyjson_get_next(val), (val) = (key) + 1)
#define yyjson_obj_foreach_next wend:scope
#macro yyjson_obj_foreach(obj, idx, max, key, val_) 
scope
   (idx) = 0
   (max) = yyjson_obj_size(obj)
   while (idx) < (max)
      if (idx) = 0 then 
         (key) = iif((obj), unsafe_yyjson_get_first(obj), NULL)
         (val_) = (key) + 1
      else
         (key) = unsafe_yyjson_get_next(val_)
         (val_) = (key) + 1
       end if
     (idx)+=1
#endmacro
declare function yyjson_mut_doc_get_root(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
declare sub yyjson_mut_doc_set_root(byval doc as yyjson_mut_doc ptr, byval root as yyjson_mut_val ptr)
declare function yyjson_mut_doc_set_str_pool_size(byval doc as yyjson_mut_doc ptr, byval len_ as uinteger) as bool
declare function yyjson_mut_doc_set_val_pool_size(byval doc as yyjson_mut_doc ptr, byval count as uinteger) as bool
declare sub yyjson_mut_doc_free(byval doc as yyjson_mut_doc ptr)
declare function yyjson_mut_doc_new(byval alc as const yyjson_alc ptr) as yyjson_mut_doc ptr
declare function yyjson_doc_mut_copy(byval doc as yyjson_doc ptr, byval alc as const yyjson_alc ptr) as yyjson_mut_doc ptr
declare function yyjson_mut_doc_mut_copy(byval doc as yyjson_mut_doc ptr, byval alc as const yyjson_alc ptr) as yyjson_mut_doc ptr
declare function yyjson_val_mut_copy(byval doc as yyjson_mut_doc ptr, byval val_ as yyjson_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_val_mut_copy(byval doc as yyjson_mut_doc ptr, byval val_ as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_doc_imut_copy(byval doc as yyjson_mut_doc ptr, byval alc as const yyjson_alc ptr) as yyjson_doc ptr
declare function yyjson_mut_val_imut_copy(byval val_ as yyjson_mut_val ptr, byval alc as const yyjson_alc ptr) as yyjson_doc ptr
declare function yyjson_mut_is_raw(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_null(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_true(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_false(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_bool(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_uint(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_sint(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_int(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_real(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_num(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_str(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_arr(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_obj(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_is_ctn(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_get_type(byval val_ as yyjson_mut_val ptr) as yyjson_type
declare function yyjson_mut_get_subtype(byval val_ as yyjson_mut_val ptr) as yyjson_subtype
declare function yyjson_mut_get_tag(byval val_ as yyjson_mut_val ptr) as ubyte
declare function yyjson_mut_get_type_desc(byval val_ as yyjson_mut_val ptr) as const zstring ptr
declare function yyjson_mut_get_raw(byval val_ as yyjson_mut_val ptr) as const zstring ptr
declare function yyjson_mut_get_bool(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_get_uint(byval val_ as yyjson_mut_val ptr) as ulongint
declare function yyjson_mut_get_sint(byval val_ as yyjson_mut_val ptr) as longint
declare function yyjson_mut_get_int(byval val_ as yyjson_mut_val ptr) as long
declare function yyjson_mut_get_real(byval val_ as yyjson_mut_val ptr) as double
declare function yyjson_mut_get_num(byval val_ as yyjson_mut_val ptr) as double
declare function yyjson_mut_get_str(byval val_ as yyjson_mut_val ptr) as const zstring ptr
declare function yyjson_mut_get_len(byval val_ as yyjson_mut_val ptr) as uinteger
declare function yyjson_mut_equals_str(byval val_ as yyjson_mut_val ptr, byval str_ as const zstring ptr) as bool
declare function yyjson_mut_equals_strn(byval val_ as yyjson_mut_val ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
declare function yyjson_mut_equals(byval lhs as yyjson_mut_val ptr, byval rhs as yyjson_mut_val ptr) as bool
declare function yyjson_mut_set_raw(byval val_ as yyjson_mut_val ptr, byval raw as const zstring ptr, byval len_ as uinteger) as bool
declare function yyjson_mut_set_null(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_set_bool(byval val_ as yyjson_mut_val ptr, byval num as bool) as bool
declare function yyjson_mut_set_uint(byval val_ as yyjson_mut_val ptr, byval num as ulongint) as bool
declare function yyjson_mut_set_sint(byval val_ as yyjson_mut_val ptr, byval num as longint) as bool
declare function yyjson_mut_set_int(byval val_ as yyjson_mut_val ptr, byval num as long) as bool
declare function yyjson_mut_set_float(byval val_ as yyjson_mut_val ptr, byval num as single) as bool
declare function yyjson_mut_set_double(byval val_ as yyjson_mut_val ptr, byval num as double) as bool
declare function yyjson_mut_set_real(byval val_ as yyjson_mut_val ptr, byval num as double) as bool
declare function yyjson_mut_set_fp_to_fixed(byval val_ as yyjson_mut_val ptr, byval prec as long) as bool
declare function yyjson_mut_set_fp_to_float(byval val_ as yyjson_mut_val ptr, byval flt as bool) as bool
declare function yyjson_mut_set_str(byval val_ as yyjson_mut_val ptr, byval str_ as const zstring ptr) as bool
declare function yyjson_mut_set_strn(byval val_ as yyjson_mut_val ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
declare function yyjson_mut_set_str_noesc(byval val_ as yyjson_mut_val ptr, byval noesc as bool) as bool
declare function yyjson_mut_set_arr(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_set_obj(byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_raw(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_rawn(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_rawcpy(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_rawncpy(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_null(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
declare function yyjson_mut_true(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
declare function yyjson_mut_false(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
declare function yyjson_mut_bool(byval doc as yyjson_mut_doc ptr, byval val_ as bool) as yyjson_mut_val ptr
declare function yyjson_mut_uint(byval doc as yyjson_mut_doc ptr, byval num as ulongint) as yyjson_mut_val ptr
declare function yyjson_mut_sint(byval doc as yyjson_mut_doc ptr, byval num as longint) as yyjson_mut_val ptr
declare function yyjson_mut_int(byval doc as yyjson_mut_doc ptr, byval num as longint) as yyjson_mut_val ptr
declare function yyjson_mut_float(byval doc as yyjson_mut_doc ptr, byval num as single) as yyjson_mut_val ptr
declare function yyjson_mut_double(byval doc as yyjson_mut_doc ptr, byval num as double) as yyjson_mut_val ptr
declare function yyjson_mut_real(byval doc as yyjson_mut_doc ptr, byval num as double) as yyjson_mut_val ptr
declare function yyjson_mut_str(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_strn(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_strcpy(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_strncpy(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_size(byval arr as yyjson_mut_val ptr) as uinteger
declare function yyjson_mut_arr_get(byval arr as yyjson_mut_val ptr, byval idx as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_get_first(byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_arr_get_last(byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr

type yyjson_mut_arr_iter
   idx as uinteger
   max as uinteger
   cur as yyjson_mut_val ptr
   pre as yyjson_mut_val ptr
   arr as yyjson_mut_val ptr
end type

declare function yyjson_mut_arr_iter_init(byval arr as yyjson_mut_val ptr, byval iter as yyjson_mut_arr_iter ptr) as bool
declare function yyjson_mut_arr_iter_with(byval arr as yyjson_mut_val ptr) as yyjson_mut_arr_iter
declare function yyjson_mut_arr_iter_has_next(byval iter as yyjson_mut_arr_iter ptr) as bool
declare function yyjson_mut_arr_iter_next(byval iter as yyjson_mut_arr_iter ptr) as yyjson_mut_val ptr
declare function yyjson_mut_arr_iter_remove(byval iter as yyjson_mut_arr_iter ptr) as yyjson_mut_val ptr
'' TODO: #define yyjson_mut_arr_foreach(arr, idx, max, val) for ((idx) = 0, (max) = yyjson_mut_arr_size(arr), (val) = yyjson_mut_arr_get_first(arr); (idx) < (max); (idx)++, (val) = (val)->next)
declare function yyjson_mut_arr(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_bool(byval doc as yyjson_mut_doc ptr, byval vals as const bool ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_sint(byval doc as yyjson_mut_doc ptr, byval vals as const longint ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_uint(byval doc as yyjson_mut_doc ptr, byval vals as const ulongint ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_real(byval doc as yyjson_mut_doc ptr, byval vals as const double ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_sint8(byval doc as yyjson_mut_doc ptr, byval vals as const byte ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_sint16(byval doc as yyjson_mut_doc ptr, byval vals as const short ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_sint32(byval doc as yyjson_mut_doc ptr, byval vals as const long ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_sint64(byval doc as yyjson_mut_doc ptr, byval vals as const longint ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_uint8(byval doc as yyjson_mut_doc ptr, byval vals as const ubyte ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_uint16(byval doc as yyjson_mut_doc ptr, byval vals as const ushort ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_uint32(byval doc as yyjson_mut_doc ptr, byval vals as const ulong ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_uint64(byval doc as yyjson_mut_doc ptr, byval vals as const ulongint ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_float(byval doc as yyjson_mut_doc ptr, byval vals as const single ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_double(byval doc as yyjson_mut_doc ptr, byval vals as const double ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_str(byval doc as yyjson_mut_doc ptr, byval vals as const zstring ptr ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_strn(byval doc as yyjson_mut_doc ptr, byval vals as const zstring ptr ptr, byval lens as const uinteger ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_strcpy(byval doc as yyjson_mut_doc ptr, byval vals as const zstring ptr ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_with_strncpy(byval doc as yyjson_mut_doc ptr, byval vals as const zstring ptr ptr, byval lens as const uinteger ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_insert(byval arr as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr, byval idx as uinteger) as bool
declare function yyjson_mut_arr_append(byval arr as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_arr_prepend(byval arr as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_arr_replace(byval arr as yyjson_mut_val ptr, byval idx as uinteger, byval val_ as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_arr_remove(byval arr as yyjson_mut_val ptr, byval idx as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_arr_remove_first(byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_arr_remove_last(byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_arr_remove_range(byval arr as yyjson_mut_val ptr, byval idx as uinteger, byval len_ as uinteger) as bool
declare function yyjson_mut_arr_clear(byval arr as yyjson_mut_val ptr) as bool
declare function yyjson_mut_arr_rotate(byval arr as yyjson_mut_val ptr, byval idx as uinteger) as bool
declare function yyjson_mut_arr_add_val(byval arr as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_arr_add_null(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr) as bool
declare function yyjson_mut_arr_add_true(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr) as bool
declare function yyjson_mut_arr_add_false(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr) as bool
declare function yyjson_mut_arr_add_bool(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval val_ as bool) as bool
declare function yyjson_mut_arr_add_uint(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as ulongint) as bool
declare function yyjson_mut_arr_add_sint(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as longint) as bool
declare function yyjson_mut_arr_add_int(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as longint) as bool
declare function yyjson_mut_arr_add_float(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as single) as bool
declare function yyjson_mut_arr_add_double(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as double) as bool
declare function yyjson_mut_arr_add_real(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as double) as bool
declare function yyjson_mut_arr_add_str(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval str_ as const zstring ptr) as bool
declare function yyjson_mut_arr_add_strn(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
declare function yyjson_mut_arr_add_strcpy(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval str_ as const zstring ptr) as bool
declare function yyjson_mut_arr_add_strncpy(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
declare function yyjson_mut_arr_add_arr(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_arr_add_obj(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_size(byval obj as yyjson_mut_val ptr) as uinteger
declare function yyjson_mut_obj_get(byval obj as yyjson_mut_val ptr, byval key as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_getn(byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval key_len as uinteger) as yyjson_mut_val ptr

type yyjson_mut_obj_iter
   idx as uinteger
   max as uinteger
   cur as yyjson_mut_val ptr
   pre as yyjson_mut_val ptr
   obj as yyjson_mut_val ptr
end type

declare function yyjson_mut_obj_iter_init(byval obj as yyjson_mut_val ptr, byval iter as yyjson_mut_obj_iter ptr) as bool
declare function yyjson_mut_obj_iter_with(byval obj as yyjson_mut_val ptr) as yyjson_mut_obj_iter
declare function yyjson_mut_obj_iter_has_next(byval iter as yyjson_mut_obj_iter ptr) as bool
declare function yyjson_mut_obj_iter_next(byval iter as yyjson_mut_obj_iter ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_iter_get_val(byval key as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_iter_remove(byval iter as yyjson_mut_obj_iter ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_iter_get(byval iter as yyjson_mut_obj_iter ptr, byval key as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_iter_getn(byval iter as yyjson_mut_obj_iter ptr, byval key as const zstring ptr, byval key_len as uinteger) as yyjson_mut_val ptr
'' TODO: #define yyjson_mut_obj_foreach(obj, idx, max, key, val) for ((idx) = 0, (max) = yyjson_mut_obj_size(obj), (key) = (max) ? ((yyjson_mut_val *)(obj)->uni.ptr)->next->next : NULL, (val) = (key) ? (key)->next : NULL; (idx) < (max); (idx)++, (key) = (val)->next, (val) = (key)->next)
declare function yyjson_mut_obj(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_with_str(byval doc as yyjson_mut_doc ptr, byval keys as const zstring ptr ptr, byval vals as const zstring ptr ptr, byval count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_obj_with_kv(byval doc as yyjson_mut_doc ptr, byval kv_pairs as const zstring ptr ptr, byval pair_count as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_obj_add(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_obj_put(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_obj_insert(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr, byval idx as uinteger) as bool
declare function yyjson_mut_obj_remove(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_remove_key(byval obj as yyjson_mut_val ptr, byval key as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_remove_keyn(byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval key_len as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_obj_clear(byval obj as yyjson_mut_val ptr) as bool
declare function yyjson_mut_obj_replace(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_obj_rotate(byval obj as yyjson_mut_val ptr, byval idx as uinteger) as bool
declare function yyjson_mut_obj_add_null(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr) as bool
declare function yyjson_mut_obj_add_true(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr) as bool
declare function yyjson_mut_obj_add_false(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr) as bool
declare function yyjson_mut_obj_add_bool(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as bool) as bool
declare function yyjson_mut_obj_add_uint(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as ulongint) as bool
declare function yyjson_mut_obj_add_sint(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as longint) as bool
declare function yyjson_mut_obj_add_int(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as longint) as bool
declare function yyjson_mut_obj_add_float(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as single) as bool
declare function yyjson_mut_obj_add_double(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as double) as bool
declare function yyjson_mut_obj_add_real(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as double) as bool
declare function yyjson_mut_obj_add_str(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as const zstring ptr) as bool
declare function yyjson_mut_obj_add_strn(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as const zstring ptr, byval len_ as uinteger) as bool
declare function yyjson_mut_obj_add_strcpy(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as const zstring ptr) as bool
declare function yyjson_mut_obj_add_strncpy(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as const zstring ptr, byval len_ as uinteger) as bool
declare function yyjson_mut_obj_add_arr(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_add_obj(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_add_val(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_mut_obj_remove_str(byval obj as yyjson_mut_val ptr, byval key as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_obj_remove_strn(byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_obj_rename_key(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval new_key as const zstring ptr) as bool
declare function yyjson_mut_obj_rename_keyn(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval len_ as uinteger, byval new_key as const zstring ptr, byval new_len as uinteger) as bool
type yyjson_ptr_code as ulong

dim shared YYJSON_PTR_ERR_NONE as const yyjson_ptr_code = 0
dim shared YYJSON_PTR_ERR_PARAMETER as const yyjson_ptr_code = 1
dim shared YYJSON_PTR_ERR_SYNTAX as const yyjson_ptr_code = 2
dim shared YYJSON_PTR_ERR_RESOLVE as const yyjson_ptr_code = 3
dim shared YYJSON_PTR_ERR_NULL_ROOT as const yyjson_ptr_code = 4
dim shared YYJSON_PTR_ERR_SET_ROOT as const yyjson_ptr_code = 5
dim shared YYJSON_PTR_ERR_MEMORY_ALLOCATION as const yyjson_ptr_code = 6

type yyjson_ptr_err
   code as yyjson_ptr_code
   msg as const zstring ptr
   pos_ as uinteger
end type

type yyjson_ptr_ctx
   ctn as yyjson_mut_val ptr
   pre as yyjson_mut_val ptr
   old as yyjson_mut_val ptr
end type

declare function yyjson_doc_ptr_get(byval doc as yyjson_doc ptr, byval ptr_ as const zstring ptr) as yyjson_val ptr
declare function yyjson_doc_ptr_getn(byval doc as yyjson_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger) as yyjson_val ptr
declare function yyjson_doc_ptr_getx(byval doc as yyjson_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval err_ as yyjson_ptr_err ptr) as yyjson_val ptr
declare function yyjson_ptr_get(byval val_ as yyjson_val ptr, byval ptr_ as const zstring ptr) as yyjson_val ptr
declare function yyjson_ptr_getn(byval val_ as yyjson_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger) as yyjson_val ptr
declare function yyjson_ptr_getx(byval val_ as yyjson_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval err_ as yyjson_ptr_err ptr) as yyjson_val ptr
declare function yyjson_mut_doc_ptr_get(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_doc_ptr_getn(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_doc_ptr_getx(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
declare function yyjson_mut_ptr_get(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_ptr_getn(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_ptr_getx(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
declare function yyjson_mut_doc_ptr_add(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr) as bool
declare function yyjson_mut_doc_ptr_addn(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr) as bool
declare function yyjson_mut_doc_ptr_addx(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval create_parent as bool, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as bool
declare function yyjson_mut_ptr_add(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr, byval doc as yyjson_mut_doc ptr) as bool
declare function yyjson_mut_ptr_addn(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval doc as yyjson_mut_doc ptr) as bool
declare function yyjson_mut_ptr_addx(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval doc as yyjson_mut_doc ptr, byval create_parent as bool, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as bool
declare function yyjson_mut_doc_ptr_set(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr) as bool
declare function yyjson_mut_doc_ptr_setn(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr) as bool
declare function yyjson_mut_doc_ptr_setx(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval create_parent as bool, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as bool
declare function yyjson_mut_ptr_set(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr, byval doc as yyjson_mut_doc ptr) as bool
declare function yyjson_mut_ptr_setn(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval doc as yyjson_mut_doc ptr) as bool
declare function yyjson_mut_ptr_setx(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval doc as yyjson_mut_doc ptr, byval create_parent as bool, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as bool
declare function yyjson_mut_doc_ptr_replace(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_doc_ptr_replacen(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_doc_ptr_replacex(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
declare function yyjson_mut_ptr_replace(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_ptr_replacen(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_ptr_replacex(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
declare function yyjson_mut_doc_ptr_remove(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_doc_ptr_removen(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_doc_ptr_removex(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
declare function yyjson_mut_ptr_remove(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr) as yyjson_mut_val ptr
declare function yyjson_mut_ptr_removen(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
declare function yyjson_mut_ptr_removex(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
declare function yyjson_ptr_ctx_append(byval ctx as yyjson_ptr_ctx ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_ptr_ctx_replace(byval ctx as yyjson_ptr_ctx ptr, byval val_ as yyjson_mut_val ptr) as bool
declare function yyjson_ptr_ctx_remove(byval ctx as yyjson_ptr_ctx ptr) as bool
type yyjson_patch_code as ulong

dim shared YYJSON_PATCH_SUCCESS as const yyjson_patch_code = 0
dim shared YYJSON_PATCH_ERROR_INVALID_PARAMETER as const yyjson_patch_code = 1
dim shared YYJSON_PATCH_ERROR_MEMORY_ALLOCATION as const yyjson_patch_code = 2
dim shared YYJSON_PATCH_ERROR_INVALID_OPERATION as const yyjson_patch_code = 3
dim shared YYJSON_PATCH_ERROR_MISSING_KEY as const yyjson_patch_code = 4
dim shared YYJSON_PATCH_ERROR_INVALID_MEMBER as const yyjson_patch_code = 5
dim shared YYJSON_PATCH_ERROR_EQUAL as const yyjson_patch_code = 6
dim shared YYJSON_PATCH_ERROR_POINTER as const yyjson_patch_code = 7

type yyjson_patch_err
   code as yyjson_patch_code
   idx as uinteger
   msg as const zstring ptr
   ptr_ as yyjson_ptr_err
end type

declare function yyjson_patch(byval doc as yyjson_mut_doc ptr, byval orig as yyjson_val ptr, byval patch as yyjson_val ptr, byval err_ as yyjson_patch_err ptr) as yyjson_mut_val ptr
declare function yyjson_mut_patch(byval doc as yyjson_mut_doc ptr, byval orig as yyjson_mut_val ptr, byval patch as yyjson_mut_val ptr, byval err_ as yyjson_patch_err ptr) as yyjson_mut_val ptr
declare function yyjson_merge_patch(byval doc as yyjson_mut_doc ptr, byval orig as yyjson_val ptr, byval patch as yyjson_val ptr) as yyjson_mut_val ptr
declare function yyjson_mut_merge_patch(byval doc as yyjson_mut_doc ptr, byval orig as yyjson_mut_val ptr, byval patch as yyjson_mut_val ptr) as yyjson_mut_val ptr

union yyjson_val_uni
   u64 as ulongint
   i64 as longint
   f64 as double
   str_ as const zstring ptr
   ptr_ as any ptr
   ofs as uinteger
end union

type yyjson_val_
   tag as ulongint
   uni as yyjson_val_uni
end type

type yyjson_doc_
   root as yyjson_val ptr
   alc as yyjson_alc
   dat_read as uinteger
   val_read as uinteger
   str_pool as zstring ptr
end type
declare function __builtin_constant_p alias "__builtin_constant_p"(Byval n as uinteger) As long
private function unsafe_yyjson_is_str_noesc(byval str_ as const zstring ptr, byval len_ as uinteger) as bool
   if __builtin_constant_p(len_) andalso (len_ <= 32) then
      if 0 < len_ then
         dim c as byte = str_[0]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 1 < len_ then
         dim c as byte = str_[1]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 2 < len_ then
         dim c as byte = str_[2]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 3 < len_ then
         dim c as byte = str_[3]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 4 < len_ then
         dim c as byte = str_[4]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 5 < len_ then
         dim c as byte = str_[5]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 6 < len_ then
         dim c as byte = str_[6]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 7 < len_ then
         dim c as byte = str_[7]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 8 < len_ then
         dim c as byte = str_[8]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 9 < len_ then
         dim c as byte = str_[9]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 10 < len_ then
         dim c as byte = str_[10]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 11 < len_ then
         dim c as byte = str_[11]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 12 < len_ then
         dim c as byte = str_[12]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 13 < len_ then
         dim c as byte = str_[13]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 14 < len_ then
         dim c as byte = str_[14]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 15 < len_ then
         dim c as byte = str_[15]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 16 < len_ then
         dim c as byte = str_[16]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 17 < len_ then
         dim c as byte = str_[17]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 18 < len_ then
         dim c as byte = str_[18]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 19 < len_ then
         dim c as byte = str_[19]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 20 < len_ then
         dim c as byte = str_[20]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 21 < len_ then
         dim c as byte = str_[21]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 22 < len_ then
         dim c as byte = str_[22]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 23 < len_ then
         dim c as byte = str_[23]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 24 < len_ then
         dim c as byte = str_[24]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 25 < len_ then
         dim c as byte = str_[25]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 26 < len_ then
         dim c as byte = str_[26]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 27 < len_ then
         dim c as byte = str_[27]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 28 < len_ then
         dim c as byte = str_[28]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 29 < len_ then
         dim c as byte = str_[29]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 30 < len_ then
         dim c as byte = str_[30]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      if 31 < len_ then
         dim c as byte = str_[31]
         if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
            return false
         end if
      end if
      return true
   end if
   return false
end function

'' TODO: # define yyjson_repeat32_incr(x) x(0) x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(8) x(9) x(10) x(11) x(12) x(13) x(14) x(15) x(16) x(17) x(18) x(19) x(20) x(21) x(22) x(23) x(24) x(25) x(26) x(27) x(28) x(29) x(30) x(31)
#macro yyjson_check_char_noesc(i)
   if i < len_ then
      dim c as byte = str_[i]
      if (((c < asc(" ")) orelse (c > asc("~"))) orelse (c = asc(""""))) orelse (c = asc(!"\\")) then
         return false
      end if
   end if
#endmacro
#undef yyjson_repeat32_incr
#undef yyjson_check_char_noesc
#define unsafe_yyjson_u64_to_f64(num) cdbl(num)

private function unsafe_yyjson_get_type(byval val_ as any ptr) as yyjson_type
   dim tag as ubyte = cubyte(cptr(yyjson_val ptr, val_)->tag)
   return cast(yyjson_type, tag and cubyte(&h07))
end function

private function unsafe_yyjson_get_subtype(byval val_ as any ptr) as yyjson_subtype
   dim tag as ubyte = cubyte(cptr(yyjson_val ptr, val_)->tag)
   return cast(yyjson_subtype, tag and cubyte(&h18))
end function

private function unsafe_yyjson_get_tag(byval val_ as any ptr) as ubyte
   dim tag as ubyte = cubyte(cptr(yyjson_val ptr, val_)->tag)
   return cubyte(tag and cubyte(&hFF))
end function

#define unsafe_yyjson_is_raw(val_) cast(bool, -(unsafe_yyjson_get_type((val_)) = cubyte(1)))
#define unsafe_yyjson_is_null(val_) cast(bool, -(unsafe_yyjson_get_type((val_)) = cubyte(2)))
#define unsafe_yyjson_is_bool(val_) cast(bool, -(unsafe_yyjson_get_type((val_)) = cubyte(3)))
#define unsafe_yyjson_is_num(val_) cast(bool, -(unsafe_yyjson_get_type((val_)) = cubyte(4)))
#define unsafe_yyjson_is_str(val_) cast(bool, -(unsafe_yyjson_get_type((val_)) = cubyte(5)))
#define unsafe_yyjson_is_arr(val_) cast(bool, -(unsafe_yyjson_get_type((val_)) = cubyte(6)))
#define unsafe_yyjson_is_obj(val_) cast(bool, -(unsafe_yyjson_get_type((val_)) = cubyte(7)))

private function unsafe_yyjson_is_ctn(byval val_ as any ptr) as bool
   dim mask as ubyte = cubyte(6) and cubyte(7)
   return -((unsafe_yyjson_get_tag(val_) and mask) = mask)
end function

private function unsafe_yyjson_is_uint(byval val_ as any ptr) as bool
   dim patt as const ubyte = cubyte(4) or cubyte(0 shl 3)
   return -(unsafe_yyjson_get_tag(val_) = patt)
end function

private function unsafe_yyjson_is_sint(byval val_ as any ptr) as bool
   dim patt as const ubyte = cubyte(4) or cubyte(1 shl 3)
   return -(unsafe_yyjson_get_tag(val_) = patt)
end function

private function unsafe_yyjson_is_int(byval val_ as any ptr) as bool
   dim mask as const ubyte = cubyte(&hFF) and (not cubyte(1 shl 3))
   dim patt as const ubyte = cubyte(4) or cubyte(0 shl 3)
   return -((unsafe_yyjson_get_tag(val_) and mask) = patt)
end function

private function unsafe_yyjson_is_real(byval val_ as any ptr) as bool
   dim patt as const ubyte = cubyte(4) or cubyte(2 shl 3)
   return -(unsafe_yyjson_get_tag(val_) = patt)
end function

private function unsafe_yyjson_is_true(byval val_ as any ptr) as bool
   dim patt as const ubyte = cubyte(3) or cubyte(1 shl 3)
   return -(unsafe_yyjson_get_tag(val_) = patt)
end function

private function unsafe_yyjson_is_false(byval val_ as any ptr) as bool
   dim patt as const ubyte = cubyte(3) or cubyte(0 shl 3)
   return -(unsafe_yyjson_get_tag(val_) = patt)
end function

private function unsafe_yyjson_arr_is_flat(byval val_ as yyjson_val ptr) as bool
   dim ofs as uinteger = val_->uni.ofs
   dim len_ as uinteger = cuint(val_->tag shr cubyte(8))
   return -(((len_ * sizeof(yyjson_val)) + sizeof(yyjson_val)) = ofs)
end function

#define unsafe_yyjson_get_raw(val_) cptr(const zstring ptr, cptr(yyjson_val ptr, (val_))->uni.str_)

private function unsafe_yyjson_get_bool(byval val_ as any ptr) as bool
   dim tag as ubyte = unsafe_yyjson_get_tag(val_)
   return cbyte((tag and cubyte(&h18)) shr cubyte(3))
end function

#define unsafe_yyjson_get_uint(val_) culngint(cptr(yyjson_val ptr, (val_))->uni.u64)
#define unsafe_yyjson_get_sint(val_) clngint(cptr(yyjson_val ptr, (val_))->uni.i64)
#define unsafe_yyjson_get_int(val_) clng(cptr(yyjson_val ptr, (val_))->uni.i64)
#define unsafe_yyjson_get_real(val_) cdbl(cptr(yyjson_val ptr, (val_))->uni.f64)

private function unsafe_yyjson_get_num(byval val_ as any ptr) as double
   dim tag as ubyte = unsafe_yyjson_get_tag(val_)
   if tag = (cubyte(4) or cubyte(2 shl 3)) then
      return cptr(yyjson_val ptr, val_)->uni.f64
   elseif tag = (cubyte(4) or cubyte(1 shl 3)) then
      return cdbl(cptr(yyjson_val ptr, val_)->uni.i64)
   elseif tag = (cubyte(4) or cubyte(0 shl 3)) then
      return unsafe_yyjson_u64_to_f64(cptr(yyjson_val ptr, val_)->uni.u64)
   end if
   return 0.0
end function

#define unsafe_yyjson_get_str(val_) cptr(const zstring ptr, cptr(yyjson_val ptr, (val_))->uni.str_)
#define unsafe_yyjson_get_len(val_) cuint(cptr(yyjson_val ptr, (val_))->tag shr cubyte(8))
#define unsafe_yyjson_get_first(ctn) cptr(yyjson_val ptr, (ctn) + 1)

private function unsafe_yyjson_get_next(byval val_ as yyjson_val ptr) as yyjson_val ptr
   dim as bool is_ctn = unsafe_yyjson_is_ctn(val_)
   dim ctn_ofs as uinteger = val_->uni.ofs
   dim ofs as uinteger = iif(is_ctn, ctn_ofs, sizeof(yyjson_val))
   return cptr(yyjson_val ptr, cptr(any ptr, cptr(ubyte ptr, val_) + ofs))
end function

private function unsafe_yyjson_equals_strn(byval val_ as any ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
   return -((unsafe_yyjson_get_len(val_) = len_) andalso (memcmp(cptr(yyjson_val ptr, val_)->uni.str_, str_, len_) = 0))
end function

private function unsafe_yyjson_equals_str(byval val_ as any ptr, byval str_ as const zstring ptr) as bool
   return unsafe_yyjson_equals_strn(val_, str_, strlen(str_))
end function

private sub unsafe_yyjson_set_type(byval val_ as any ptr, byval type_ as yyjson_type, byval subtype as yyjson_subtype)
   dim tag as ubyte = type_ or subtype
   dim new_tag as ulongint = cptr(yyjson_val ptr, val_)->tag
   new_tag = (new_tag and (not culngint(cubyte(&hFF)))) or culngint(tag)
   cptr(yyjson_val ptr, val_)->tag = new_tag
end sub

private sub unsafe_yyjson_set_len(byval val_ as any ptr, byval len_ as uinteger)
   dim tag as ulongint = cptr(yyjson_val ptr, val_)->tag and cubyte(&hFF)
   tag or= culngint(len_) shl cubyte(8)
   cptr(yyjson_val ptr, val_)->tag = tag
end sub

private sub unsafe_yyjson_set_tag(byval val_ as any ptr, byval type_ as yyjson_type, byval subtype as yyjson_subtype, byval len_ as uinteger)
   dim tag as ulongint = culngint(len_) shl cubyte(8)
   tag or= type_ or subtype
   cptr(yyjson_val ptr, val_)->tag = tag
end sub

private sub unsafe_yyjson_inc_len(byval val_ as any ptr)
   dim tag as ulongint = cptr(yyjson_val ptr, val_)->tag
   tag += culngint(1 shl cubyte(8))
   cptr(yyjson_val ptr, val_)->tag = tag
end sub

private sub unsafe_yyjson_set_raw(byval val_ as any ptr, byval raw as const zstring ptr, byval len_ as uinteger)
   unsafe_yyjson_set_tag(val_, cubyte(1), cubyte(0 shl 3), len_)
   cptr(yyjson_val ptr, val_)->uni.str_ = raw
end sub

private sub unsafe_yyjson_set_null(byval val_ as any ptr)
   unsafe_yyjson_set_tag(val_, cubyte(2), cubyte(0 shl 3), 0)
end sub

private sub unsafe_yyjson_set_bool(byval val_ as any ptr, byval num as bool)
   dim subtype as yyjson_subtype = iif(num, cubyte(1 shl 3), cubyte(0 shl 3))
   unsafe_yyjson_set_tag(val_, cubyte(3), subtype, 0)
end sub

private sub unsafe_yyjson_set_uint(byval val_ as any ptr, byval num as ulongint)
   unsafe_yyjson_set_tag(val_, cubyte(4), cubyte(0 shl 3), 0)
   cptr(yyjson_val ptr, val_)->uni.u64 = num
end sub

private sub unsafe_yyjson_set_sint(byval val_ as any ptr, byval num as longint)
   unsafe_yyjson_set_tag(val_, cubyte(4), cubyte(1 shl 3), 0)
   cptr(yyjson_val ptr, val_)->uni.i64 = num
end sub

private sub unsafe_yyjson_set_fp_to_fixed(byval val_ as any ptr, byval prec as long)
   cptr(yyjson_val ptr, val_)->tag and= not (culngint(cast(yyjson_write_flag, culng(culng(culng(15)) shl (32 - 4)))) shl 32)
   cptr(yyjson_val ptr, val_)->tag or= culngint(cast(yyjson_write_flag, culng(culng(culng(prec)) shl (32 - 4)))) shl 32
end sub

private sub unsafe_yyjson_set_fp_to_float(byval val_ as any ptr, byval flt as bool)
   dim flag as ulongint = culngint(cast(yyjson_write_flag, 1 shl (32 - 5))) shl 32
   if flt then
      cptr(yyjson_val ptr, val_)->tag or= flag
   else
      cptr(yyjson_val ptr, val_)->tag and= not flag
   end if
end sub

private sub unsafe_yyjson_set_float(byval val_ as any ptr, byval num as single)
   unsafe_yyjson_set_tag(val_, cubyte(4), cubyte(2 shl 3), 0)
   cptr(yyjson_val ptr, val_)->tag or= culngint(cast(yyjson_write_flag, 1 shl (32 - 5))) shl 32
   cptr(yyjson_val ptr, val_)->uni.f64 = cdbl(num)
end sub

private sub unsafe_yyjson_set_double(byval val_ as any ptr, byval num as double)
   unsafe_yyjson_set_tag(val_, cubyte(4), cubyte(2 shl 3), 0)
   cptr(yyjson_val ptr, val_)->uni.f64 = num
end sub

private sub unsafe_yyjson_set_real(byval val_ as any ptr, byval num as double)
   unsafe_yyjson_set_tag(val_, cubyte(4), cubyte(2 shl 3), 0)
   cptr(yyjson_val ptr, val_)->uni.f64 = num
end sub

private sub unsafe_yyjson_set_str_noesc(byval val_ as any ptr, byval noesc as bool)
   cptr(yyjson_val ptr, val_)->tag and= not culngint(cubyte(&h18))
   if noesc then
      cptr(yyjson_val ptr, val_)->tag or= culngint(cubyte(1 shl 3))
   end if
end sub

private sub unsafe_yyjson_set_strn(byval val_ as any ptr, byval str_ as const zstring ptr, byval len_ as uinteger)
   unsafe_yyjson_set_tag(val_, cubyte(5), cubyte(0 shl 3), len_)
   cptr(yyjson_val ptr, val_)->uni.str_ = str_
end sub

private sub unsafe_yyjson_set_str(byval val_ as any ptr, byval str_ as const zstring ptr)
   dim len_ as uinteger = strlen(str_)
   dim as  bool noesc = unsafe_yyjson_is_str_noesc(str_, len_)
   dim subtype as yyjson_subtype = iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
   unsafe_yyjson_set_tag(val_, cubyte(5), subtype, len_)
   cptr(yyjson_val ptr, val_)->uni.str_ = str_
end sub

private sub unsafe_yyjson_set_arr(byval val_ as any ptr, byval size as uinteger)
   unsafe_yyjson_set_tag(val_, cubyte(6), cubyte(0 shl 3), size)
end sub

private sub unsafe_yyjson_set_obj(byval val_ as any ptr, byval size as uinteger)
   unsafe_yyjson_set_tag(val_, cubyte(7), cubyte(0 shl 3), size)
end sub

private function yyjson_doc_get_root(byval doc as yyjson_doc ptr) as yyjson_val ptr
   return iif(doc, doc->root, NULL)
end function

private function yyjson_doc_get_read_size(byval doc as yyjson_doc ptr) as uinteger
   return iif(doc, doc->dat_read, 0)
end function

private function yyjson_doc_get_val_count(byval doc as yyjson_doc ptr) as uinteger
   return iif(doc, doc->val_read, 0)
end function

private sub yyjson_doc_free(byval doc as yyjson_doc ptr)
   if doc then
      dim alc as yyjson_alc = doc->alc
      memset(@doc->alc, 0, sizeof(alc))
      if doc->str_pool then
         alc.free(alc.ctx, doc->str_pool)
      end if
      alc.free(alc.ctx, doc)
   end if
end sub

private function yyjson_is_raw(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_raw(val_), false)
end function

private function yyjson_is_null(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_null(val_), false)
end function

private function yyjson_is_true(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_true(val_), false)
end function

private function yyjson_is_false(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_false(val_), false)
end function

private function yyjson_is_bool(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_bool(val_), false)
end function

private function yyjson_is_uint(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_uint(val_), false)
end function

private function yyjson_is_sint(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_sint(val_), false)
end function

private function yyjson_is_int(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_int(val_), false)
end function

private function yyjson_is_real(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_real(val_), false)
end function

private function yyjson_is_num(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_num(val_), false)
end function

private function yyjson_is_str(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_str(val_), false)
end function

private function yyjson_is_arr(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_arr(val_), false)
end function

private function yyjson_is_obj(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_obj(val_), false)
end function

private function yyjson_is_ctn(byval val_ as yyjson_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_ctn(val_), false)
end function

private function yyjson_get_type(byval val_ as yyjson_val ptr) as yyjson_type
   return iif(val_, unsafe_yyjson_get_type(val_), cubyte(0))
end function

private function yyjson_get_subtype(byval val_ as yyjson_val ptr) as yyjson_subtype
   return iif(val_, unsafe_yyjson_get_subtype(val_), cubyte(0 shl 3))
end function

private function yyjson_get_tag(byval val_ as yyjson_val ptr) as ubyte
   return iif(val_, unsafe_yyjson_get_tag(val_), 0)
end function

private function yyjson_get_type_desc(byval val_ as yyjson_val ptr) as const zstring ptr
   '' TODO: switch (yyjson_get_tag(val)) { case ((uint8_t)1) | ((uint8_t)(0 << 3)): return "raw"; case ((uint8_t)2) | ((uint8_t)(0 << 3)): return "null"; case ((uint8_t)5) | ((uint8_t)(0 << 3)): return "string"; case ((uint8_t)5) | ((uint8_t)(1 << 3)): return "string"; case ((uint8_t)6) | ((uint8_t)(0 << 3)): return "array"; case ((uint8_t)7) | ((uint8_t)(0 << 3)): return "object"; case ((uint8_t)3) | ((uint8_t)(1 << 3)): return "true"; case ((uint8_t)3) | ((uint8_t)(0 << 3)): return "false"; case ((uint8_t)4) | ((uint8_t)(0 << 3)): return "uint"; case ((uint8_t)4) | ((uint8_t)(1 << 3)): return "sint"; case ((uint8_t)4) | ((uint8_t)(2 << 3)): return "real"; default: return "unknown"; }
   Select Case yyjson_get_tag(val_)
        Case CUByte(1) Or CUByte(0 Shl 3): Return @"raw"
        Case CUByte(2) Or CUByte(0 Shl 3): Return @"null"
        Case CUByte(5) Or CUByte(0 Shl 3): Return @"string"
        Case CUByte(5) Or CUByte(1 Shl 3): Return @"string"
        Case CUByte(6) Or CUByte(0 Shl 3): Return @"array"
        Case CUByte(7) Or CUByte(0 Shl 3): Return @"object"
        Case CUByte(3) Or CUByte(1 Shl 3): Return @"true"
        Case CUByte(3) Or CUByte(0 Shl 3): Return @"false"
        Case CUByte(4) Or CUByte(0 Shl 3): Return @"uint"
        Case CUByte(4) Or CUByte(1 Shl 3): Return @"sint"
        Case CUByte(4) Or CUByte(2 Shl 3): Return @"real"
        Case Else: Return @"unknown"
    End Select
   end function

private function yyjson_get_raw(byval val_ as yyjson_val ptr) as const zstring ptr
   return iif(yyjson_is_raw(val_), unsafe_yyjson_get_raw(val_), NULL)
end function

private function yyjson_get_bool(byval val_ as yyjson_val ptr) as bool
   return iif(yyjson_is_bool(val_), unsafe_yyjson_get_bool(val_), false)
end function

private function yyjson_get_uint(byval val_ as yyjson_val ptr) as ulongint
   return iif(yyjson_is_int(val_), unsafe_yyjson_get_uint(val_), 0)
end function

private function yyjson_get_sint(byval val_ as yyjson_val ptr) as longint
   return iif(yyjson_is_int(val_), unsafe_yyjson_get_sint(val_), 0)
end function

private function yyjson_get_int(byval val_ as yyjson_val ptr) as long
   return iif(yyjson_is_int(val_), unsafe_yyjson_get_int(val_), 0)
end function

private function yyjson_get_real(byval val_ as yyjson_val ptr) as double
   return iif(yyjson_is_real(val_), unsafe_yyjson_get_real(val_), 0.0)
end function

private function yyjson_get_num(byval val_ as yyjson_val ptr) as double
   return iif(val_, unsafe_yyjson_get_num(val_), 0.0)
end function

private function yyjson_get_str(byval val_ as yyjson_val ptr) as const zstring ptr
   return iif(yyjson_is_str(val_), unsafe_yyjson_get_str(val_), NULL)
end function

private function yyjson_get_len(byval val_ as yyjson_val ptr) as uinteger
   return iif(val_, unsafe_yyjson_get_len(val_), 0)
end function
declare function __builtin_expect alias "__builtin_expect"(byval expr as long,byval c as long) as long
private function yyjson_equals_str(byval val_ as yyjson_val ptr, byval str_ as const zstring ptr) as bool
   if __builtin_expect(-(((val_ andalso str_) = 0) = 0), 1) then
      return cbyte(-(unsafe_yyjson_is_str(val_) andalso unsafe_yyjson_equals_str(val_, str_)))
   end if
   return false
end function

private function yyjson_equals_strn(byval val_ as yyjson_val ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
   if __builtin_expect(-(((val_ andalso str_) = 0) = 0), 1) then
      return -(unsafe_yyjson_is_str(val_) andalso unsafe_yyjson_equals_strn(val_, str_, len_))
   end if
   return false
end function

declare function unsafe_yyjson_equals(byval lhs as yyjson_val ptr, byval rhs as yyjson_val ptr) as bool

private function yyjson_equals(byval lhs as yyjson_val ptr, byval rhs as yyjson_val ptr) as bool
   if __builtin_expect(-((((lhs = 0) orelse (rhs = 0)) = 0) = 0), 0) then
      return false
   end if
   return unsafe_yyjson_equals(lhs, rhs)
end function

private function yyjson_set_raw(byval val_ as yyjson_val ptr, byval raw as const zstring ptr, byval len_ as uinteger) as bool
   if __builtin_expect(-((((val_ = 0) orelse unsafe_yyjson_is_ctn(val_)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_raw(val_, raw, len_)
   return true
end function

private function yyjson_set_null(byval val_ as yyjson_val ptr) as bool
   if __builtin_expect(-((((val_ = 0) orelse unsafe_yyjson_is_ctn(val_)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_null(val_)
   return true
end function

private function yyjson_set_bool(byval val_ as yyjson_val ptr, byval num as bool) as bool
   if __builtin_expect(-((((val_ = 0) orelse unsafe_yyjson_is_ctn(val_)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_bool(val_, num)
   return true
end function

private function yyjson_set_uint(byval val_ as yyjson_val ptr, byval num as ulongint) as bool
   if __builtin_expect(-((((val_ = 0) orelse unsafe_yyjson_is_ctn(val_)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_uint(val_, num)
   return true
end function

private function yyjson_set_sint(byval val_ as yyjson_val ptr, byval num as longint) as bool
   if __builtin_expect(-((((val_ = 0) orelse unsafe_yyjson_is_ctn(val_)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_sint(val_, num)
   return true
end function

private function yyjson_set_int(byval val_ as yyjson_val ptr, byval num as long) as bool
   if __builtin_expect(-((((val_ = 0) orelse unsafe_yyjson_is_ctn(val_)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_sint(val_, clngint(num))
   return true
end function

private function yyjson_set_float(byval val_ as yyjson_val ptr, byval num as single) as bool
   if __builtin_expect(-((((val_ = 0) orelse unsafe_yyjson_is_ctn(val_)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_float(val_, num)
   return true
end function

private function yyjson_set_double(byval val_ as yyjson_val ptr, byval num as double) as bool
   if __builtin_expect(-((((val_ = 0) orelse unsafe_yyjson_is_ctn(val_)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_double(val_, num)
   return true
end function

private function yyjson_set_real(byval val_ as yyjson_val ptr, byval num as double) as bool
   if __builtin_expect(-((((val_ = 0) orelse unsafe_yyjson_is_ctn(val_)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_real(val_, num)
   return true
end function

private function yyjson_set_fp_to_fixed(byval val_ as yyjson_val ptr, byval prec as long) as bool
   if __builtin_expect(-(((yyjson_is_real(val_) = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_fp_to_fixed(val_, prec)
   return true
end function

private function yyjson_set_fp_to_float(byval val_ as yyjson_val ptr, byval flt as bool) as bool
   if __builtin_expect(-(((yyjson_is_real(val_) = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_fp_to_float(val_, flt)
   return true
end function

private function yyjson_set_str(byval val_ as yyjson_val ptr, byval str_ as const zstring ptr) as bool
   if __builtin_expect(-((((val_ = 0) orelse unsafe_yyjson_is_ctn(val_)) = 0) = 0), 0) then
      return false
   end if
   if __builtin_expect(-(((str_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_str(val_, str_)
   return true
end function

private function yyjson_set_strn(byval val_ as yyjson_val ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
   if __builtin_expect(-((((val_ = 0) orelse unsafe_yyjson_is_ctn(val_)) = 0) = 0), 0) then
      return false
   end if
   if __builtin_expect(-(((str_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_strn(val_, str_, len_)
   return true
end function

private function yyjson_set_str_noesc(byval val_ as yyjson_val ptr, byval noesc as bool) as bool
   if __builtin_expect(-(((yyjson_is_str(val_) = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_str_noesc(val_, noesc)
   return true
end function

private function yyjson_arr_size(byval arr as yyjson_val ptr) as uinteger
   return iif(yyjson_is_arr(arr), unsafe_yyjson_get_len(arr), 0)
end function

private function yyjson_arr_get(byval arr as yyjson_val ptr, byval idx as uinteger) as yyjson_val ptr
   if __builtin_expect(-((yyjson_is_arr(arr) = 0) = 0), 1) then
      if __builtin_expect(-(((unsafe_yyjson_get_len(arr) > idx) = 0) = 0), 1) then
         dim val_ as yyjson_val ptr = unsafe_yyjson_get_first(arr)
         if unsafe_yyjson_arr_is_flat(arr) then
            return val_ + idx
         else
            while idx > 0
               idx -= 1
               val_ = unsafe_yyjson_get_next(val_)
            Wend

            return val_
         end if
      end if
   end if
   return NULL
end function

private function yyjson_arr_get_first(byval arr as yyjson_val ptr) as yyjson_val ptr
   if __builtin_expect(-((yyjson_is_arr(arr) = 0) = 0), 1) then
      if __builtin_expect(-(((unsafe_yyjson_get_len(arr) > 0) = 0) = 0), 1) then
         return unsafe_yyjson_get_first(arr)
      end if
   end if
   return NULL
end function

private function yyjson_arr_get_last(byval arr as yyjson_val ptr) as yyjson_val ptr
   if __builtin_expect(-((yyjson_is_arr(arr) = 0) = 0), 1) then
      dim len_ as uinteger = unsafe_yyjson_get_len(arr)
      if __builtin_expect(-(((len_ > 0) = 0) = 0), 1) then
         dim val_ as yyjson_val ptr = unsafe_yyjson_get_first(arr)
         if unsafe_yyjson_arr_is_flat(arr) then
            return val_ + (len_ - 1)
         else
             while len_ > 0
               len_ -= 1
               val_ = unsafe_yyjson_get_next(val_)
            Wend
            return val_
         end if
      end if
   end if
   return NULL
end function

private function yyjson_arr_iter_init(byval arr as yyjson_val ptr, byval iter as yyjson_arr_iter ptr) as bool
   if __builtin_expect(-(((yyjson_is_arr(arr) andalso iter) = 0) = 0), 1) then
      iter->idx = 0
      iter->max = unsafe_yyjson_get_len(arr)
      iter->cur = unsafe_yyjson_get_first(arr)
      return true
   end if
   if iter then
      memset(iter, 0, sizeof(yyjson_arr_iter))
   end if
   return false
end function

private function yyjson_arr_iter_with(byval arr as yyjson_val ptr) as yyjson_arr_iter
   dim iter as yyjson_arr_iter
   yyjson_arr_iter_init(arr, @iter)
   return iter
end function

private function yyjson_arr_iter_has_next(byval iter as yyjson_arr_iter ptr) as bool
   return iif(iter, -(iter->idx < iter->max), false)
end function

private function yyjson_arr_iter_next(byval iter as yyjson_arr_iter ptr) as yyjson_val ptr
   dim val_ as yyjson_val ptr
   if iter andalso (iter->idx < iter->max) then
      val_ = iter->cur
      iter->cur = unsafe_yyjson_get_next(val_)
      (iter->idx)+=1
      return val_
   end if
   return NULL
end function

private function yyjson_obj_size(byval obj as yyjson_val ptr) as uinteger
   return iif(yyjson_is_obj(obj), unsafe_yyjson_get_len(obj), 0)
end function

private function yyjson_obj_get(byval obj as yyjson_val ptr, byval key as const zstring ptr) as yyjson_val ptr
   return yyjson_obj_getn(obj, key, iif(key, strlen(key), 0))
end function

private function yyjson_obj_getn(byval obj as yyjson_val ptr, byval _key as const zstring ptr, byval key_len as uinteger) as yyjson_val ptr
   if __builtin_expect(-(((yyjson_is_obj(obj) andalso _key) = 0) = 0), 1) then
      dim len_ as uinteger = unsafe_yyjson_get_len(obj)
      dim key as yyjson_val ptr = unsafe_yyjson_get_first(obj)
      '' TODO: while (len-- > 0) { if (unsafe_yyjson_equals_strn(key, _key, key_len)) return key + 1; key = unsafe_yyjson_get_next(key + 1); }
      while len_ > 0
         len_ -= 1
         if (unsafe_yyjson_equals_strn(key, _key, key_len)) then return key + 1
         key = unsafe_yyjson_get_next(key + 1)
      Wend

      While len_ > 0
    len_ -= 1
    If unsafe_yyjson_equals_strn(key, _key, key_len) Then
        Return key + 1
    End If
    key = unsafe_yyjson_get_next(key + 1)
Wend
   end if
   return NULL
end function

private function yyjson_obj_iter_init(byval obj as yyjson_val ptr, byval iter as yyjson_obj_iter ptr) as bool
   if __builtin_expect(-(((yyjson_is_obj(obj) andalso iter) = 0) = 0), 1) then
      iter->idx = 0
      iter->max = unsafe_yyjson_get_len(obj)
      iter->cur = unsafe_yyjson_get_first(obj)
      iter->obj = obj
      return true
   end if
   if iter then
      memset(iter, 0, sizeof(yyjson_obj_iter))
   end if
   return false
end function

private function yyjson_obj_iter_with(byval obj as yyjson_val ptr) as yyjson_obj_iter
   dim iter as yyjson_obj_iter
   yyjson_obj_iter_init(obj, @iter)
   return iter
end function

private function yyjson_obj_iter_has_next(byval iter as yyjson_obj_iter ptr) as bool
   return iif(iter, -(iter->idx < iter->max), false)
end function

private function yyjson_obj_iter_next(byval iter as yyjson_obj_iter ptr) as yyjson_val ptr
   if iter andalso (iter->idx < iter->max) then
      dim key as yyjson_val ptr = iter->cur
      (iter->idx)+=1
      iter->cur = unsafe_yyjson_get_next(key + 1)
      return key
   end if
   return NULL
end function

private function yyjson_obj_iter_get_val(byval key as yyjson_val ptr) as yyjson_val ptr
   return iif(key, key + 1, NULL)
end function

private function yyjson_obj_iter_get(byval iter as yyjson_obj_iter ptr, byval key as const zstring ptr) as yyjson_val ptr
   return yyjson_obj_iter_getn(iter, key, iif(key, strlen(key), 0))
end function

private function yyjson_obj_iter_getn(byval iter as yyjson_obj_iter ptr, byval key as const zstring ptr, byval key_len as uinteger) as yyjson_val ptr
   if iter andalso key then
      dim idx as uinteger = iter->idx
      dim max as uinteger = iter->max
      dim cur as yyjson_val ptr = iter->cur
      if __builtin_expect(-(((idx = max) = 0) = 0), 0) then
         idx = 0
         cur = unsafe_yyjson_get_first(iter->obj)
      end if
      '' TODO: while (idx++ < max) { yyjson_val *next = unsafe_yyjson_get_next(cur + 1); if (unsafe_yyjson_equals_strn(cur, key, key_len)) { iter->idx = idx; iter->cur = next; return cur + 1; } cur = next; if (idx == iter->max && iter->idx < iter->max) { idx = 0; max = iter->idx; cur = unsafe_yyjson_get_first(iter->obj); } }
   end if
   return NULL
end function

type yyjson_mut_val_
   tag as ulongint
   uni as yyjson_val_uni
   next_ as yyjson_mut_val ptr
end type

type yyjson_str_chunk
   next_ as yyjson_str_chunk ptr
   chunk_size as uinteger
end type

type yyjson_str_pool
   cur as zstring ptr
   end_ as zstring ptr
   chunk_size as uinteger
   chunk_size_max as uinteger
   chunks as yyjson_str_chunk ptr
end type

type yyjson_val_chunk
   next_ as yyjson_val_chunk ptr
   chunk_size as uinteger
end type

type yyjson_val_pool
   cur as yyjson_mut_val ptr
   end_ as yyjson_mut_val ptr
   chunk_size as uinteger
   chunk_size_max as uinteger
   chunks as yyjson_val_chunk ptr
end type

type yyjson_mut_doc_
   root as yyjson_mut_val ptr
   alc as yyjson_alc
   str_pool as yyjson_str_pool
   val_pool as yyjson_val_pool
end type

declare function unsafe_yyjson_str_pool_grow(byval pool as yyjson_str_pool ptr, byval alc as const yyjson_alc ptr, byval len_ as uinteger) as bool
declare function unsafe_yyjson_val_pool_grow(byval pool as yyjson_val_pool ptr, byval alc as const yyjson_alc ptr, byval count as uinteger) as bool

private function unsafe_yyjson_mut_str_alc(byval doc as yyjson_mut_doc ptr, byval len_ as uinteger) as zstring ptr
   dim mem as zstring ptr
   dim alc as const yyjson_alc ptr = @doc->alc
   dim pool as yyjson_str_pool ptr = @doc->str_pool
   if __builtin_expect(-(((cuint(pool->end_ - pool->cur) <= len_) = 0) = 0), 0) then
      if __builtin_expect(-(((unsafe_yyjson_str_pool_grow(pool, alc, len_ + 1) = 0) = 0) = 0), 0) then
         return NULL
      end if
   end if
   mem = pool->cur
   pool->cur = (mem + len_) + 1
   return mem
end function

private function unsafe_yyjson_mut_strncpy(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as zstring ptr
   dim mem as zstring ptr = unsafe_yyjson_mut_str_alc(doc, len_)
   if __builtin_expect(-(((mem = 0) = 0) = 0), 0) then
      return NULL
   end if
   memcpy(cptr(any ptr, mem), cptr(const any ptr, str_), len_)
   mem[len_] = asc(!"\0")
   return mem
end function

private function unsafe_yyjson_mut_val(byval doc as yyjson_mut_doc ptr, byval count as uinteger) as yyjson_mut_val ptr
   dim val_ as yyjson_mut_val ptr
   dim alc as yyjson_alc ptr = @doc->alc
   dim pool as yyjson_val_pool ptr = @doc->val_pool
   if __builtin_expect(-(((cuint(pool->end_ - pool->cur) < count) = 0) = 0), 0) then
      if __builtin_expect(-(((unsafe_yyjson_val_pool_grow(pool, alc, count) = 0) = 0) = 0), 0) then
         return NULL
      end if
   end if
   val_ = pool->cur
   pool->cur += count
   return val_
end function

private function yyjson_mut_doc_get_root(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
   return iif(doc, doc->root, NULL)
end function

private sub yyjson_mut_doc_set_root(byval doc as yyjson_mut_doc ptr, byval root as yyjson_mut_val ptr)
   if doc then
      doc->root = root
   end if
end sub

private function yyjson_mut_is_raw(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_raw(val_), false)
end function

private function yyjson_mut_is_null(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_null(val_), false)
end function

private function yyjson_mut_is_true(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_true(val_), false)
end function

private function yyjson_mut_is_false(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_false(val_), false)
end function

private function yyjson_mut_is_bool(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_bool(val_), false)
end function

private function yyjson_mut_is_uint(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_uint(val_), false)
end function

private function yyjson_mut_is_sint(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_sint(val_), false)
end function

private function yyjson_mut_is_int(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_int(val_), false)
end function

private function yyjson_mut_is_real(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_real(val_), false)
end function

private function yyjson_mut_is_num(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_num(val_), false)
end function

private function yyjson_mut_is_str(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_str(val_), false)
end function

private function yyjson_mut_is_arr(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_arr(val_), false)
end function

private function yyjson_mut_is_obj(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_obj(val_), false)
end function

private function yyjson_mut_is_ctn(byval val_ as yyjson_mut_val ptr) as bool
   return iif(val_, unsafe_yyjson_is_ctn(val_), false)
end function

'#define yyjson_mut_get_type(val_) cast(yyjson_type, yyjson_get_type(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_subtype(val_) cast(yyjson_subtype, yyjson_get_subtype(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_tag(val_) cubyte(yyjson_get_tag(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_type_desc(val_) cptr(const zstring ptr, yyjson_get_type_desc(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_raw(val_) cptr(const zstring ptr, yyjson_get_raw(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_bool(val_) cast(bool, yyjson_get_bool(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_uint(val_) culngint(yyjson_get_uint(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_sint(val_) clngint(yyjson_get_sint(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_int(val_) clng(yyjson_get_int(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_real(val_) cdbl(yyjson_get_real(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_num(val_) cdbl(yyjson_get_num(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_str(val_) cptr(const zstring ptr, yyjson_get_str(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_get_len(val_) cuint(yyjson_get_len(cptr(yyjson_val ptr, (val_))))
'#define yyjson_mut_equals_str(val_, str_) cast(bool, yyjson_equals_str(cptr(yyjson_val ptr, (val_)), (str_)))
'#define yyjson_mut_equals_strn(val_, str_, len_) cast(bool, yyjson_equals_strn(cptr(yyjson_val ptr, (val_)), (str_), (len_)))
declare function unsafe_yyjson_mut_equals(byval lhs as yyjson_mut_val ptr, byval rhs as yyjson_mut_val ptr) as bool

private function yyjson_mut_equals(byval lhs as yyjson_mut_val ptr, byval rhs as yyjson_mut_val ptr) as bool
   if __builtin_expect(-((((lhs = 0) orelse (rhs = 0)) = 0) = 0), 0) then
      return false
   end if
   return unsafe_yyjson_mut_equals(lhs, rhs)
end function

private function yyjson_mut_set_raw(byval val_ as yyjson_mut_val ptr, byval raw as const zstring ptr, byval len_ as uinteger) as bool
   if __builtin_expect(-((((val_ = 0) orelse (raw = 0)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_raw(val_, raw, len_)
   return true
end function

private function yyjson_mut_set_null(byval val_ as yyjson_mut_val ptr) as bool
   if __builtin_expect(-(((val_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_null(val_)
   return true
end function

private function yyjson_mut_set_bool(byval val_ as yyjson_mut_val ptr, byval num as bool) as bool
   if __builtin_expect(-(((val_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_bool(val_, num)
   return true
end function

private function yyjson_mut_set_uint(byval val_ as yyjson_mut_val ptr, byval num as ulongint) as bool
   if __builtin_expect(-(((val_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_uint(val_, num)
   return true
end function

private function yyjson_mut_set_sint(byval val_ as yyjson_mut_val ptr, byval num as longint) as bool
   if __builtin_expect(-(((val_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_sint(val_, num)
   return true
end function

private function yyjson_mut_set_int(byval val_ as yyjson_mut_val ptr, byval num as long) as bool
   if __builtin_expect(-(((val_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_sint(val_, clngint(num))
   return true
end function

private function yyjson_mut_set_float(byval val_ as yyjson_mut_val ptr, byval num as single) as bool
   if __builtin_expect(-(((val_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_float(val_, num)
   return true
end function

private function yyjson_mut_set_double(byval val_ as yyjson_mut_val ptr, byval num as double) as bool
   if __builtin_expect(-(((val_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_double(val_, num)
   return true
end function

private function yyjson_mut_set_real(byval val_ as yyjson_mut_val ptr, byval num as double) as bool
   if __builtin_expect(-(((val_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_real(val_, num)
   return true
end function

private function yyjson_mut_set_fp_to_fixed(byval val_ as yyjson_mut_val ptr, byval prec as long) as bool
   if __builtin_expect(-(((yyjson_mut_is_real(val_) = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_fp_to_fixed(val_, prec)
   return true
end function

private function yyjson_mut_set_fp_to_float(byval val_ as yyjson_mut_val ptr, byval flt as bool) as bool
   if __builtin_expect(-(((yyjson_mut_is_real(val_) = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_fp_to_float(val_, flt)
   return true
end function

private function yyjson_mut_set_str(byval val_ as yyjson_mut_val ptr, byval str_ as const zstring ptr) as bool
   if __builtin_expect(-((((val_ = 0) orelse (str_ = 0)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_str(val_, str_)
   return true
end function

private function yyjson_mut_set_strn(byval val_ as yyjson_mut_val ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
   if __builtin_expect(-((((val_ = 0) orelse (str_ = 0)) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_strn(val_, str_, len_)
   return true
end function

private function yyjson_mut_set_str_noesc(byval val_ as yyjson_mut_val ptr, byval noesc as bool) as bool
   if __builtin_expect(-(((yyjson_mut_is_str(val_) = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_str_noesc(val_, noesc)
   return true
end function

private function yyjson_mut_set_arr(byval val_ as yyjson_mut_val ptr) as bool
   if __builtin_expect(-(((val_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_arr(val_, 0)
   return true
end function

private function yyjson_mut_set_obj(byval val_ as yyjson_mut_val ptr) as bool
   if __builtin_expect(-(((val_ = 0) = 0) = 0), 0) then
      return false
   end if
   unsafe_yyjson_set_obj(val_, 0)
   return true
end function

'' TODO: #define yyjson_mut_val_one(func) if (yyjson_likely(doc)) { yyjson_mut_val *val = unsafe_yyjson_mut_val(doc, 1); if (yyjson_likely(val)) { func return val; } } return NULL
'' TODO: #define yyjson_mut_val_one_str(func) if (yyjson_likely(doc && str)) { yyjson_mut_val *val = unsafe_yyjson_mut_val(doc, 1); if (yyjson_likely(val)) { func return val; } } return NULL

private function yyjson_mut_raw(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso str_) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_raw(val_, str_, strlen(str_))
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_rawn(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso str_) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_raw(val_, str_, len_)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_rawcpy(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso str_) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            dim len_ as uinteger = strlen(str_)
            dim new_str as zstring ptr = unsafe_yyjson_mut_strncpy(doc, str_, len_)
            if __builtin_expect(-(((new_str = 0) = 0) = 0), 0) then
               return NULL
            end if
            unsafe_yyjson_set_raw(val_, new_str, len_)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_rawncpy(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso str_) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            dim new_str as zstring ptr = unsafe_yyjson_mut_strncpy(doc, str_, len_)
            if __builtin_expect(-(((new_str = 0) = 0) = 0), 0) then
               return NULL
            end if
            unsafe_yyjson_set_raw(val_, new_str, len_)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_null(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_null(val_)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_true(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_bool(val_, true)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_false(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_bool(val_, false)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_bool(byval doc as yyjson_mut_doc ptr, byval _val as bool) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_bool(val_, _val)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_uint(byval doc as yyjson_mut_doc ptr, byval num as ulongint) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_uint(val_, num)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_sint(byval doc as yyjson_mut_doc ptr, byval num as longint) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_sint(val_, num)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_int(byval doc as yyjson_mut_doc ptr, byval num as longint) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_sint(val_, num)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_float(byval doc as yyjson_mut_doc ptr, byval num as single) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_float(val_, num)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_double(byval doc as yyjson_mut_doc ptr, byval num as double) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_double(val_, num)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_real(byval doc as yyjson_mut_doc ptr, byval num as double) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_real(val_, num)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_str(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso str_) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_str(val_, str_)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_strn(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso str_) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            unsafe_yyjson_set_strn(val_, str_, len_)
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_strcpy(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso str_) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            dim len_ as uinteger = strlen(str_)
            dim as  bool noesc = unsafe_yyjson_is_str_noesc(str_, len_)
            dim sub_ as yyjson_subtype = iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
            dim new_str as zstring ptr = unsafe_yyjson_mut_strncpy(doc, str_, len_)
            if __builtin_expect(-(((new_str = 0) = 0) = 0), 0) then
               return NULL
            end if
            unsafe_yyjson_set_tag(val_, cubyte(5), sub_, len_)
            val_->uni.str_ = new_str
         end scope
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_strncpy(byval doc as yyjson_mut_doc ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso str_) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         scope
            dim new_str as zstring ptr = unsafe_yyjson_mut_strncpy(doc, str_, len_)
            if __builtin_expect(-(((new_str = 0) = 0) = 0), 0) then
               return NULL
            end if
            unsafe_yyjson_set_strn(val_, new_str, len_)
         end scope
         return val_
      end if
   end if
   return NULL
end function

#undef yyjson_mut_val_one
#undef yyjson_mut_val_one_str

private function yyjson_mut_arr_size(byval arr as yyjson_mut_val ptr) as uinteger
   return iif(yyjson_mut_is_arr(arr), unsafe_yyjson_get_len(arr), 0)
end function

private function yyjson_mut_arr_get(byval arr as yyjson_mut_val ptr, byval idx as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((idx < yyjson_mut_arr_size(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
      while idx > 0
         idx -= 1
           val_ = val_->next_
      Wend

      return val_->next_
   end if
   return NULL
end function

private function yyjson_mut_arr_get_first(byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr
   if __builtin_expect(-(((yyjson_mut_arr_size(arr) > 0) = 0) = 0), 1) then
      return cptr(yyjson_mut_val ptr, arr->uni.ptr_)->next_
   end if
   return NULL
end function

private function yyjson_mut_arr_get_last(byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr
   if __builtin_expect(-(((yyjson_mut_arr_size(arr) > 0) = 0) = 0), 1) then
      return cptr(yyjson_mut_val ptr, arr->uni.ptr_)
   end if
   return NULL
end function

private function yyjson_mut_arr_iter_init(byval arr as yyjson_mut_val ptr, byval iter as yyjson_mut_arr_iter ptr) as bool
   if __builtin_expect(-(((yyjson_mut_is_arr(arr) andalso iter) = 0) = 0), 1) then
      iter->idx = 0
      iter->max = unsafe_yyjson_get_len(arr)
      iter->cur = iif(iter->max, cptr(yyjson_mut_val ptr, arr->uni.ptr_), NULL)
      iter->pre = NULL
      iter->arr = arr
      return true
   end if
   if iter then
      memset(iter, 0, sizeof(yyjson_mut_arr_iter))
   end if
   return false
end function

private function yyjson_mut_arr_iter_with(byval arr as yyjson_mut_val ptr) as yyjson_mut_arr_iter
   dim iter as yyjson_mut_arr_iter
   yyjson_mut_arr_iter_init(arr, @iter)
   return iter
end function

private function yyjson_mut_arr_iter_has_next(byval iter as yyjson_mut_arr_iter ptr) as bool
   return iif(iter, -(iter->idx < iter->max), false)
end function

private function yyjson_mut_arr_iter_next(byval iter as yyjson_mut_arr_iter ptr) as yyjson_mut_val ptr
   if iter andalso (iter->idx < iter->max) then
      dim val_ as yyjson_mut_val ptr = iter->cur
      iter->pre = val_
      iter->cur = val_->next_
      iter->idx+=1
      return iter->cur
   end if
   return NULL
end function

private function yyjson_mut_arr_iter_remove(byval iter as yyjson_mut_arr_iter ptr) as yyjson_mut_val ptr
   if __builtin_expect(-((((iter andalso (0 < iter->idx)) andalso (iter->idx <= iter->max)) = 0) = 0), 1) then
      dim prev as yyjson_mut_val ptr = iter->pre
      dim cur as yyjson_mut_val ptr = iter->cur
      dim next_ as yyjson_mut_val ptr = cur->next_
      if __builtin_expect(-(((iter->idx = iter->max) = 0) = 0), 0) then
         iter->arr->uni.ptr_ = prev
      end if
      iter->idx-=1
       iter->max -=1
      unsafe_yyjson_set_len(iter->arr, iter->max)
      prev->next_ = next_
      iter->cur = prev
      return cur
   end if
   return NULL
end function

private function yyjson_mut_arr(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         val_->tag = cubyte(6) or cubyte(0 shl 3)
         return val_
      end if
   end if
   return NULL
end function

'' TODO: #define yyjson_mut_arr_with_func(func) if (yyjson_likely(doc && ((0 < count && count < (~(size_t)0) / sizeof(yyjson_mut_val) && vals) || count == 0))) { yyjson_mut_val *arr = unsafe_yyjson_mut_val(doc, 1 + count); if (yyjson_likely(arr)) { arr->tag = ((uint64_t)count << YYJSON_TAG_BIT) | YYJSON_TYPE_ARR; if (count > 0) { size_t i; for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; func val->next = val + 1; } arr[count].next = arr + 1; arr->uni.ptr = arr + count; } return arr; } } return NULL

private function yyjson_mut_arr_with_bool(byval doc as yyjson_mut_doc ptr, byval vals as const bool ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_bool(val, vals[i]); } val->next = val + 1; }
            for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                  unsafe_yyjson_set_bool(val_, vals[i])
               end scope
               val_->next_ = val_ + 1
            Next

            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

'#define yyjson_mut_arr_with_sint(doc, vals, count) cptr(yyjson_mut_val ptr, yyjson_mut_arr_with_sint64((doc), (vals), (count)))
'#define yyjson_mut_arr_with_uint(doc, vals, count) cptr(yyjson_mut_val ptr, yyjson_mut_arr_with_uint64((doc), (vals), (count)))

private function yyjson_mut_arr_with_real(byval doc as yyjson_mut_doc ptr, byval vals as const double ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
            for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                  unsafe_yyjson_set_real(val_, vals[i])
                 end scope
                val_->next_ = val_ + 1
            Next

            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_real(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_sint8(byval doc as yyjson_mut_doc ptr, byval vals as const byte ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
             for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                  unsafe_yyjson_set_sint(val_, vals[i])
                 end scope
                val_->next_ = val_ + 1
            Next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_sint(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_sint16(byval doc as yyjson_mut_doc ptr, byval vals as const short ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
             for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                  unsafe_yyjson_set_sint(val_, vals[i])
                 end scope
                val_->next_ = val_ + 1
            Next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_sint(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_sint32(byval doc as yyjson_mut_doc ptr, byval vals as const long ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
             for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                  unsafe_yyjson_set_sint(val_, vals[i])
                 end scope
                val_->next_ = val_ + 1
            Next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_sint(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_sint64(byval doc as yyjson_mut_doc ptr, byval vals as const longint ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
            for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                  unsafe_yyjson_set_sint(val_, vals[i])
               end scope
               val_->next_=val_+1
            Next

            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_sint(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_uint8(byval doc as yyjson_mut_doc ptr, byval vals as const ubyte ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
                   for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                 unsafe_yyjson_set_uint(val_, vals[i])
               end scope
               val_->next_=val_+1
            Next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_uint(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_uint16(byval doc as yyjson_mut_doc ptr, byval vals as const ushort ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
            for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                 unsafe_yyjson_set_uint(val_, vals[i])
               end scope
               val_->next_=val_+1
            Next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_uint(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_uint32(byval doc as yyjson_mut_doc ptr, byval vals as const ulong ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
            for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                 unsafe_yyjson_set_uint(val_, vals[i])
               end scope
               val_->next_=val_+1
            Next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_uint(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_uint64(byval doc as yyjson_mut_doc ptr, byval vals as const ulongint ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
            for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                 unsafe_yyjson_set_uint(val_, vals[i])
               end scope
               val_->next_=val_+1
            Next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_uint(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_float(byval doc as yyjson_mut_doc ptr, byval vals as const single ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
            for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                  unsafe_yyjson_set_float(val_, vals[i])
               end scope
               val_->next_=val_+1
            Next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_float(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_double(byval doc as yyjson_mut_doc ptr, byval vals as const double ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
               for i = 0 to count -1
               dim as yyjson_mut_val ptr val_ = arr + i + 1
               scope
                  unsafe_yyjson_set_double(val_, vals[i])
               end scope
               val_->next_=val_+1
            Next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { unsafe_yyjson_set_double(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_str(byval doc as yyjson_mut_doc ptr, byval vals as const zstring ptr ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
            For i  = 0 To count - 1
               Dim val_ As yyjson_mut_val Ptr = arr + i + 1
               scope
               If vals[i] = NULL Then Return NULL
               unsafe_yyjson_set_str(val_, vals[i])
               end scope
            val_->next_ = val_ + 1
Next i

            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { if (__builtin_expect(!!(!vals[i]), 0)) return NULL; unsafe_yyjson_set_str(val, vals[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_strn(byval doc as yyjson_mut_doc ptr, byval vals as const zstring ptr ptr, byval lens as const uinteger ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-((((count > 0) andalso (lens = 0)) = 0) = 0), 0) then
      return NULL
   end if
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
             For i = 0 To count - 1
               Dim val_ As yyjson_mut_val Ptr = arr + i + 1
               scope
               If vals[i] = NULL Then Return NULL
               unsafe_yyjson_set_strn(val_, vals[i],lens[i])
               end scope
               val_->next_ = val_ + 1
              next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { if (__builtin_expect(!!(!vals[i]), 0)) return NULL; unsafe_yyjson_set_strn(val, vals[i], lens[i]); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_strcpy(byval doc as yyjson_mut_doc ptr, byval vals as const zstring ptr ptr, byval count as uinteger) as yyjson_mut_val ptr
   dim len_ as uinteger
   dim str_ as const zstring ptr
   dim new_str as const zstring ptr
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
             For i  = 0 To count - 1
               Dim val_ As yyjson_mut_val Ptr = arr + i + 1
               scope
                  str_ = vals[i]
                  If str_ = NULL Then Return NULL
                  len_ = strlen(str_) 
                  new_str = unsafe_yyjson_mut_strncpy(doc, str_, len_)
                  If new_str = NULL Then Return NULL
                  unsafe_yyjson_set_strn(val_, new_str, len_)
               end scope
               val_->next_ = val_ + 1
              next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { str = vals[i]; if (__builtin_expect(!!(!str), 0)) return NULL; len = strlen(str); new_str = unsafe_yyjson_mut_strncpy(doc, str, len); if (__builtin_expect(!!(!new_str), 0)) return NULL; unsafe_yyjson_set_strn(val, new_str, len); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_with_strncpy(byval doc as yyjson_mut_doc ptr, byval vals as const zstring ptr ptr, byval lens as const uinteger ptr, byval count as uinteger) as yyjson_mut_val ptr
   dim len_ as uinteger
   dim str_ as const zstring ptr
   dim new_str as const zstring ptr
   if __builtin_expect(-((((count > 0) andalso (lens = 0)) = 0) = 0), 0) then
      return NULL
   end if
   if __builtin_expect(-(((doc andalso ((((0 < count) andalso (count < ((not cuint(0)) / sizeof(yyjson_mut_val)))) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim arr as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + count)
      if __builtin_expect(-((arr = 0) = 0), 1) then
         arr->tag = (culngint(count) shl cubyte(8)) or cubyte(6)
         if count > 0 then
            dim i as uinteger
             For i  = 0 To count - 1
               Dim val_ As yyjson_mut_val Ptr = arr + i + 1
               scope
                  str_ = vals[i]
                  If str_ = NULL Then Return NULL
                  len_ = lens[i]
                  new_str = unsafe_yyjson_mut_strncpy(doc, str_, len_)
                  If new_str = NULL Then Return NULL
                  unsafe_yyjson_set_strn(val_, new_str, len_)
               end scope
               val_->next_ = val_ + 1
              next
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *val = arr + i + 1; { str = vals[i]; if (__builtin_expect(!!(!str), 0)) return NULL; len = lens[i]; new_str = unsafe_yyjson_mut_strncpy(doc, str, len); if (__builtin_expect(!!(!new_str), 0)) return NULL; unsafe_yyjson_set_strn(val, new_str, len); } val->next = val + 1; }
            arr[count].next_ = arr + 1
            arr->uni.ptr_ = arr + count
         end if
         return arr
      end if
   end if
   return NULL
end function

#undef yyjson_mut_arr_with_func

private function yyjson_mut_arr_insert(byval arr as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr, byval idx as uinteger) as bool
   if __builtin_expect(-(((yyjson_mut_is_arr(arr) andalso val_) = 0) = 0), 1) then
      dim len_ as uinteger = unsafe_yyjson_get_len(arr)
      if __builtin_expect(-(((idx <= len_) = 0) = 0), 1) then
         unsafe_yyjson_set_len(arr, len_ + 1)
         if len_ = 0 then
            val_->next_ = val_
            arr->uni.ptr_ = val_
         else
            dim prev as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
            dim next_ as yyjson_mut_val ptr = prev->next_
            if idx = len_ then
               prev->next_ = val_
               val_->next_ = next_
               arr->uni.ptr_ = val_
            else
                while idx > 0
               idx -= 1
               prev = next_
               next_=next_->next_  
            Wend
               '' TODO: while (idx-- > 0) { prev = next; next = next->next; }
               prev->next_ = val_
               val_->next_ = next_
            end if
         end if
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_arr_append(byval arr as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
   if __builtin_expect(-(((yyjson_mut_is_arr(arr) andalso val_) = 0) = 0), 1) then
      dim len_ as uinteger = unsafe_yyjson_get_len(arr)
      unsafe_yyjson_set_len(arr, len_ + 1)
      if len_ = 0 then
         val_->next_ = val_
      else
         dim prev as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
         dim next_ as yyjson_mut_val ptr = prev->next_
         prev->next_ = val_
         val_->next_ = next_
      end if
      arr->uni.ptr_ = val_
      return true
   end if
   return false
end function

private function yyjson_mut_arr_prepend(byval arr as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
   if __builtin_expect(-(((yyjson_mut_is_arr(arr) andalso val_) = 0) = 0), 1) then
      dim len_ as uinteger = unsafe_yyjson_get_len(arr)
      unsafe_yyjson_set_len(arr, len_ + 1)
      if len_ = 0 then
         val_->next_ = val_
         arr->uni.ptr_ = val_
      else
         dim prev as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
         dim next_ as yyjson_mut_val ptr = prev->next_
         prev->next_ = val_
         val_->next_ = next_
      end if
      return true
   end if
   return false
end function

private function yyjson_mut_arr_replace(byval arr as yyjson_mut_val ptr, byval idx as uinteger, byval val_ as yyjson_mut_val ptr) as yyjson_mut_val ptr
   if __builtin_expect(-(((yyjson_mut_is_arr(arr) andalso val_) = 0) = 0), 1) then
      dim len_ as uinteger = unsafe_yyjson_get_len(arr)
      if __builtin_expect(-(((idx < len_) = 0) = 0), 1) then
         if __builtin_expect(-(((len_ > 1) = 0) = 0), 1) then
            dim prev as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
            dim next_ as yyjson_mut_val ptr = prev->next_
            '' TODO: while (idx-- > 0) { prev = next; next = next->next; }
             while idx > 0
               idx -= 1
               prev = next_
               next_=next_->next_  
            Wend
            prev->next_ = val_
            val_->next_ = next_->next_
            if cptr(any ptr, next_) = arr->uni.ptr_ then
               arr->uni.ptr_ = val_
            end if
            return next_
         else
            dim prev as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
            val_->next_ = val_
            arr->uni.ptr_ = val_
            return prev
         end if
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_remove(byval arr as yyjson_mut_val ptr, byval idx as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-((yyjson_mut_is_arr(arr) = 0) = 0), 1) then
      dim len_ as uinteger = unsafe_yyjson_get_len(arr)
      if __builtin_expect(-(((idx < len_) = 0) = 0), 1) then
         unsafe_yyjson_set_len(arr, len_ - 1)
         if __builtin_expect(-(((len_ > 1) = 0) = 0), 1) then
            dim prev as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
            dim next_ as yyjson_mut_val ptr = prev->next_
            '' TODO: while (idx-- > 0) { prev = next; next = next->next; }
            while idx > 0
               idx -= 1
               prev = next_
               next_=next_->next_  
            Wend

            prev->next_ = next_->next_
            if cptr(any ptr, next_) = arr->uni.ptr_ then
               arr->uni.ptr_ = prev
            end if
            return next_
         else
            return cptr(yyjson_mut_val ptr, arr->uni.ptr_)
         end if
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_remove_first(byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr
   if __builtin_expect(-((yyjson_mut_is_arr(arr) = 0) = 0), 1) then
      dim len_ as uinteger = unsafe_yyjson_get_len(arr)
      if len_ > 1 then
         dim prev as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
         dim next_ as yyjson_mut_val ptr = prev->next_
         prev->next_ = next_->next_
         unsafe_yyjson_set_len(arr, len_ - 1)
         return next_
      elseif len_ = 1 then
         dim prev as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
         unsafe_yyjson_set_len(arr, 0)
         return prev
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_remove_last(byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr
   if __builtin_expect(-((yyjson_mut_is_arr(arr) = 0) = 0), 1) then
      dim len_ as uinteger = unsafe_yyjson_get_len(arr)
      if __builtin_expect(-(((len_ > 1) = 0) = 0), 1) then
         dim prev as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
         dim next_ as yyjson_mut_val ptr = prev->next_
         unsafe_yyjson_set_len(arr, len_ - 1)
         '' TODO: while (--len > 0) prev = prev->next;
         len_ -=1
         while len_ > 0
            prev = prev->next_
            len_ -=1  
         Wend

         prev->next_ = next_
         next_ = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
         arr->uni.ptr_ = prev
         return next_
      elseif len_ = 1 then
         dim prev as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
         unsafe_yyjson_set_len(arr, 0)
         return prev
      end if
   end if
   return NULL
end function

private function yyjson_mut_arr_remove_range(byval arr as yyjson_mut_val ptr, byval _idx as uinteger, byval _len as uinteger) as bool
   if __builtin_expect(-((yyjson_mut_is_arr(arr) = 0) = 0), 1) then
      dim prev as yyjson_mut_val ptr
      dim next_ as yyjson_mut_val ptr
      dim as bool tail_removed
      dim len_ as uinteger = unsafe_yyjson_get_len(arr)
      if __builtin_expect(-((((_idx + _len) > len_) = 0) = 0), 0) then
         return false
      end if
      if __builtin_expect(-(((_len = 0) = 0) = 0), 0) then
         return true
      end if
      unsafe_yyjson_set_len(arr, len_ - _len)
      if __builtin_expect(-(((len_ = _len) = 0) = 0), 0) then
         return true
      end if
      tail_removed = -((_idx + _len) = len_)
      prev = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
      '' TODO: while (_idx-- > 0) prev = prev->next;
       while _idx > 0
               _idx -= 1
               prev =prev->next_  
            Wend
      next_ = prev->next_
      '' TODO: while (_len-- > 0) next = next->next;
       while _len > 0
              _len -= 1
               next_=next_->next_  
            Wend
      prev->next_ = next_
      if __builtin_expect(-((tail_removed = 0) = 0), 0) then
         arr->uni.ptr_ = prev
      end if
      return true
   end if
   return false
end function

private function yyjson_mut_arr_clear(byval arr as yyjson_mut_val ptr) as bool
   if __builtin_expect(-((yyjson_mut_is_arr(arr) = 0) = 0), 1) then
      unsafe_yyjson_set_len(arr, 0)
      return true
   end if
   return false
end function

private function yyjson_mut_arr_rotate(byval arr as yyjson_mut_val ptr, byval idx as uinteger) as bool
   if __builtin_expect(-(((yyjson_mut_is_arr(arr) andalso (unsafe_yyjson_get_len(arr) > idx)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, arr->uni.ptr_)
      '' TODO: while (idx-- > 0) val = val->next;
      while idx > 0
               idx -= 1
              val_ =val_->next_  
            Wend
      arr->uni.ptr_ = cptr(any ptr, val_)
      return true
   end if
   return false
end function

'#define yyjson_mut_arr_add_val(arr, val_) cast(bool, yyjson_mut_arr_append((arr), (val_)))

private function yyjson_mut_arr_add_null(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_null(doc)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_true(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_true(doc)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_false(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_false(doc)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_bool(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval _val as bool) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_bool(doc, _val)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_uint(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as ulongint) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_uint(doc, num)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_sint(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as longint) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_sint(doc, num)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_int(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as longint) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_sint(doc, num)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_float(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as single) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_float(doc, num)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_double(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as double) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_double(doc, num)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_real(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval num as double) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_real(doc, num)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_str(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval str_ as const zstring ptr) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_str(doc, str_)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_strn(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_strn(doc, str_, len_)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_strcpy(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval str_ as const zstring ptr) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_strcpy(doc, str_)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_strncpy(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr, byval str_ as const zstring ptr, byval len_ as uinteger) as bool
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_strncpy(doc, str_, len_)
      return yyjson_mut_arr_append(arr, val_)
   end if
   return false
end function

private function yyjson_mut_arr_add_arr(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_arr(doc)
      return iif(yyjson_mut_arr_append(arr, val_), val_, NULL)
   end if
   return NULL
end function

private function yyjson_mut_arr_add_obj(byval doc as yyjson_mut_doc ptr, byval arr as yyjson_mut_val ptr) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso yyjson_mut_is_arr(arr)) = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = yyjson_mut_obj(doc)
      return iif(yyjson_mut_arr_append(arr, val_), val_, NULL)
   end if
   return NULL
end function

private function yyjson_mut_obj_size(byval obj as yyjson_mut_val ptr) as uinteger
   return iif(yyjson_mut_is_obj(obj), unsafe_yyjson_get_len(obj), 0)
end function

private function yyjson_mut_obj_get(byval obj as yyjson_mut_val ptr, byval key as const zstring ptr) as yyjson_mut_val ptr
   return yyjson_mut_obj_getn(obj, key, iif(key, strlen(key), 0))
end function

private function yyjson_mut_obj_getn(byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval key_len as uinteger) as yyjson_mut_val ptr
   dim len_ as uinteger = yyjson_mut_obj_size(obj)
   if __builtin_expect(-(((len_ andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, obj->uni.ptr_)->next_->next_
      '' TODO: while (len-- > 0) { if (unsafe_yyjson_equals_strn(key, _key, key_len)) return key->next; key = key->next->next; }
   end if
   return NULL
end function

private function yyjson_mut_obj_iter_init(byval obj as yyjson_mut_val ptr, byval iter as yyjson_mut_obj_iter ptr) as bool
   if __builtin_expect(-(((yyjson_mut_is_obj(obj) andalso iter) = 0) = 0), 1) then
      iter->idx = 0
      iter->max = unsafe_yyjson_get_len(obj)
      iter->cur = iif(iter->max, cptr(yyjson_mut_val ptr, obj->uni.ptr_), NULL)
      iter->pre = NULL
      iter->obj = obj
      return true
   end if
   if iter then
      memset(iter, 0, sizeof(yyjson_mut_obj_iter))
   end if
   return false
end function

private function yyjson_mut_obj_iter_with(byval obj as yyjson_mut_val ptr) as yyjson_mut_obj_iter
   dim iter as yyjson_mut_obj_iter
   yyjson_mut_obj_iter_init(obj, @iter)
   return iter
end function

private function yyjson_mut_obj_iter_has_next(byval iter as yyjson_mut_obj_iter ptr) as bool
   return iif(iter, -(iter->idx < iter->max), false)
end function

private function yyjson_mut_obj_iter_next(byval iter as yyjson_mut_obj_iter ptr) as yyjson_mut_val ptr
   if iter andalso (iter->idx < iter->max) then
      dim key as yyjson_mut_val ptr = iter->cur
      iter->pre = key
      iter->cur = key->next_->next_
      (iter->idx)+=1
      return iter->cur
   end if
   return NULL
end function

private function yyjson_mut_obj_iter_get_val(byval key as yyjson_mut_val ptr) as yyjson_mut_val ptr
   return iif(key, key->next_, NULL)
end function

private function yyjson_mut_obj_iter_remove(byval iter as yyjson_mut_obj_iter ptr) as yyjson_mut_val ptr
   if __builtin_expect(-((((iter andalso (0 < iter->idx)) andalso (iter->idx <= iter->max)) = 0) = 0), 1) then
      dim prev as yyjson_mut_val ptr = iter->pre
      dim cur as yyjson_mut_val ptr = iter->cur
      dim next_ as yyjson_mut_val ptr = cur->next_->next_
      if __builtin_expect(-(((iter->idx = iter->max) = 0) = 0), 0) then
         iter->obj->uni.ptr_ = prev
      end if
      '' TODO: iter->idx--;
      (iter->idx)-=1
      '' TODO: iter->max--;
      (iter->max)-=1
      unsafe_yyjson_set_len(iter->obj, iter->max)
      prev->next_->next_ = next_
      iter->cur = prev
      return cur->next_
   end if
   return NULL
end function

private function yyjson_mut_obj_iter_get(byval iter as yyjson_mut_obj_iter ptr, byval key as const zstring ptr) as yyjson_mut_val ptr
   return yyjson_mut_obj_iter_getn(iter, key, iif(key, strlen(key), 0))
end function

private function yyjson_mut_obj_iter_getn(byval iter as yyjson_mut_obj_iter ptr, byval key as const zstring ptr, byval key_len as uinteger) as yyjson_mut_val ptr
   if iter andalso key then
      dim idx as uinteger = 0
      dim max as uinteger = iter->max
      dim pre as yyjson_mut_val ptr
      dim cur as yyjson_mut_val ptr = iter->cur
      '' TODO: while (idx++ < max) { pre = cur; cur = cur->next->next; if (unsafe_yyjson_equals_strn(cur, key, key_len)) { iter->idx += idx; if (iter->idx > max) iter->idx -= max + 1; iter->pre = pre; iter->cur = cur; return cur->next; } }
      while idx < max
         idx += 1
         pre = cur
         cur = cur->next_
         if (unsafe_yyjson_equals_strn(cur, key, key_len)) then
            iter->idx += idx
            If iter->idx > max Then
               iter->idx -= max + 1
            End If 
            iter->pre = pre
            iter->cur = cur
             return cur->next_
          end if
      Wend

      end if
   return NULL
end function

private function yyjson_mut_obj(byval doc as yyjson_mut_doc ptr) as yyjson_mut_val ptr
   if __builtin_expect(-((doc = 0) = 0), 1) then
      dim val_ as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1)
      if __builtin_expect(-((val_ = 0) = 0), 1) then
         val_->tag = cubyte(7) or cubyte(0 shl 3)
         return val_
      end if
   end if
   return NULL
end function

private function yyjson_mut_obj_with_str(byval doc as yyjson_mut_doc ptr, byval keys as const zstring ptr ptr, byval vals as const zstring ptr ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso ((((count > 0) andalso keys) andalso vals) orelse (count = 0))) = 0) = 0), 1) then
      dim obj as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + (count * 2))
      if __builtin_expect(-((obj = 0) = 0), 1) then
         obj->tag = (culngint(count) shl cubyte(8)) or cubyte(7)
         if count > 0 then
            dim i as uinteger
            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *key = obj + (i * 2 + 1); yyjson_mut_val *val = obj + (i * 2 + 2); uint64_t key_len = (uint64_t)strlen(keys[i]); uint64_t val_len = (uint64_t)strlen(vals[i]); key->tag = (key_len << ((uint8_t)8)) | ((uint8_t)5); val->tag = (val_len << ((uint8_t)8)) | ((uint8_t)5); key->uni.str = keys[i]; val->uni.str = vals[i]; key->next = val; val->next = val + 1; }
            for i = 0 to count -1
                Dim As yyjson_mut_val Ptr key = obj + (i * 2 + 1)
                 Dim As yyjson_mut_val Ptr val_ = obj + (i * 2 + 2)
    ' 获取字符串长度
               Dim As UInteger key_len = strlen(keys[i])
               Dim As UInteger val_len = strlen(vals[i])
    ' 构建tag标记 (长度左移8位 | 类型标记5)
            key->tag = (key_len Shl 8) Or 5
            val_->tag = (val_len Shl 8) Or 5
            key->uni.str_ = keys[i]
            val_->uni.str_ = vals[i]
    ' 构建链表关系
            key->next_ = val_
            val_->next_ = val_ + 1  ' 指向下一个内存位置
         Next

            obj[(count * 2)].next_ = obj + 1
            obj->uni.ptr_ = obj + ((count * 2) - 1)
         end if
         return obj
      end if
   end if
   return NULL
end function

private function yyjson_mut_obj_with_kv(byval doc as yyjson_mut_doc ptr, byval pairs as const zstring ptr ptr, byval count as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((doc andalso (((count > 0) andalso pairs) orelse (count = 0))) = 0) = 0), 1) then
      dim obj as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 1 + (count * 2))
      if __builtin_expect(-((obj = 0) = 0), 1) then
         obj->tag = (culngint(count) shl cubyte(8)) or cubyte(7)
         if count > 0 then
            dim i as uinteger      
   For i  = 0 To count - 1
  
    Dim As yyjson_mut_val Ptr key = obj + (i * 2 + 1)
    Dim As yyjson_mut_val Ptr val_ = obj + (i * 2 + 2)

    Dim As const ZString Ptr key_str = pairs[i * 2 + 0]
    Dim As const ZString Ptr val_str = pairs[i * 2 + 1]

    Dim As UInteger key_len = strlen(key_str)
    Dim As UInteger val_len = strlen(val_str)
    
    key->tag = (key_len Shl 8) Or 5
    val_->tag = (val_len Shl 8) Or 5
   
    key->uni.str_ = key_str
    val_->uni.str_ = val_str
 
    key->next_ = val_
    val_->next_ = val_ + 1  
Next

            '' TODO: for (i = 0; i < count; i++) { yyjson_mut_val *key = obj + (i * 2 + 1); yyjson_mut_val *val = obj + (i * 2 + 2); const char *key_str = pairs[i * 2 + 0]; const char *val_str = pairs[i * 2 + 1]; uint64_t key_len = (uint64_t)strlen(key_str); uint64_t val_len = (uint64_t)strlen(val_str); key->tag = (key_len << ((uint8_t)8)) | ((uint8_t)5); val->tag = (val_len << ((uint8_t)8)) | ((uint8_t)5); key->uni.str = key_str; val->uni.str = val_str; key->next = val; val->next = val + 1; }
            obj[(count * 2)].next_ = obj + 1
            obj->uni.ptr_ = obj + ((count * 2) - 1)
         end if
         return obj
      end if
   end if
   return NULL
end function

private sub unsafe_yyjson_mut_obj_add(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr, byval len_ as uinteger)
   if __builtin_expect(-((len_ = 0) = 0), 1) then
      dim prev_val as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, obj->uni.ptr_)->next_
      dim next_key as yyjson_mut_val ptr = prev_val->next_
      prev_val->next_ = key
      val_->next_ = next_key
   else
      val_->next_ = key
   end if
   key->next_ = val_
   obj->uni.ptr_ = cptr(any ptr, key)
   unsafe_yyjson_set_len(obj, len_ + 1)
end sub

private function unsafe_yyjson_mut_obj_remove(byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval key_len as uinteger) as yyjson_mut_val ptr
   dim obj_len as uinteger = unsafe_yyjson_get_len(obj)
   if obj_len then
      dim pre_key as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, obj->uni.ptr_)
      dim cur_key as yyjson_mut_val ptr = pre_key->next_->next_
      dim removed_item as yyjson_mut_val ptr = NULL
      dim i as uinteger
      For i = 0 To obj_len - 1
    If unsafe_yyjson_equals_strn(cur_key, key, key_len) Then
        ' 记录被移除项
        If removed_item = 0 Then
            removed_item = cur_key->next_
        End If
        
        ' 双指针跳跃删除节点
        cur_key = cur_key->next_->next_
        pre_key->next_->next_ = cur_key
        
        ' 更新尾节点指针
        If i + 1 = obj_len Then
            obj->uni.ptr_ = pre_key
        End If
        
        ' 调整循环计数器
        i -= 1
        obj_len -= 1
    Else
        ' 常规指针推进
        pre_key = cur_key
        cur_key = cur_key->next_->next_
    End If
Next

      '' TODO: for (i = 0; i < obj_len; i++) { if (unsafe_yyjson_equals_strn(cur_key, key, key_len)) { if (!removed_item) removed_item = cur_key->next; cur_key = cur_key->next->next; pre_key->next->next = cur_key; if (i + 1 == obj_len) obj->uni.ptr = pre_key; i--; obj_len--; } else { pre_key = cur_key; cur_key = cur_key->next->next; } }
      unsafe_yyjson_set_len(obj, obj_len)
      return removed_item
   else
      return NULL
   end if
end function

private function unsafe_yyjson_mut_obj_replace(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
   dim key_len as uinteger = unsafe_yyjson_get_len(key)
   dim obj_len as uinteger = unsafe_yyjson_get_len(obj)
   if obj_len then
      dim pre_key as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, obj->uni.ptr_)
      dim cur_key as yyjson_mut_val ptr = pre_key->next_->next_
      dim i as uinteger
      For i = 0 To obj_len - 1
    If unsafe_yyjson_equals_strn(cur_key, key->uni.str_, key_len) Then
        ' 找到匹配键时更新对应值节点
        cur_key->next_->tag = val_->tag
        cur_key->next_->uni.u64 = val_->uni.u64
        Return True
    Else
        ' 未匹配时跳转到下个键节点
        cur_key = cur_key->next_->next_
    End If
Next

      '' TODO: for (i = 0; i < obj_len; i++) { if (unsafe_yyjson_equals_strn(cur_key, key->uni.str, key_len)) { cur_key->next->tag = val->tag; cur_key->next->uni.u64 = val->uni.u64; return true; } else { cur_key = cur_key->next->next; } }
   end if
   return false
end function

private sub unsafe_yyjson_mut_obj_rotate(byval obj as yyjson_mut_val ptr, byval idx as uinteger)
dim key as yyjson_mut_val ptr = cptr(yyjson_mut_val ptr, obj->uni.ptr_)
while idx > 0
   idx -= 1
     key=key->next_->next_
Wend

   '' TODO: while (idx-- > 0) key = key->next->next;
   obj->uni.ptr_ = cptr(any ptr, key)
end sub

private function yyjson_mut_obj_add(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
   if __builtin_expect(-((((yyjson_mut_is_obj(obj) andalso yyjson_mut_is_str(key)) andalso val_) = 0) = 0), 1) then
      unsafe_yyjson_mut_obj_add(obj, key, val_, unsafe_yyjson_get_len(obj))
      return true
   end if
   return false
end function

private function yyjson_mut_obj_put(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
   dim  as bool replaced = false
   dim key_len as uinteger
   dim iter as yyjson_mut_obj_iter
   dim cur_key as yyjson_mut_val ptr
   if __builtin_expect(-((((yyjson_mut_is_obj(obj) = 0) orelse (yyjson_mut_is_str(key) = 0)) = 0) = 0), 0) then
      return false
   end if
   key_len = unsafe_yyjson_get_len(key)
   yyjson_mut_obj_iter_init(obj, @iter)
   While (cur_key = yyjson_mut_obj_iter_next(@iter)) <> NULL
    If unsafe_yyjson_equals_strn(cur_key, key->uni.str_, key_len) Then
        If (Not replaced) AndAlso (val_ <> NULL) Then
            replaced = True
            val_->next_ = cur_key->next_->next_
            cur_key->next_ = val_
        Else
            yyjson_mut_obj_iter_remove(@iter)
        End If
    End If
Wend
   
   '' TODO: while ((cur_key = yyjson_mut_obj_iter_next(&iter)) != 0) { if (unsafe_yyjson_equals_strn(cur_key, key->uni.str, key_len)) { if (!replaced && val) { replaced = true; val->next = cur_key->next->next; cur_key->next = val; } else { yyjson_mut_obj_iter_remove(&iter); } } }
   if (replaced = 0) andalso val_ then
      unsafe_yyjson_mut_obj_add(obj, key, val_, iter.max)
   end if
   return true
end function

private function yyjson_mut_obj_insert(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr, byval idx as uinteger) as bool
   if __builtin_expect(-((((yyjson_mut_is_obj(obj) andalso yyjson_mut_is_str(key)) andalso val_) = 0) = 0), 1) then
      dim len_ as uinteger = unsafe_yyjson_get_len(obj)
      if __builtin_expect(-(((len_ >= idx) = 0) = 0), 1) then
         if len_ > idx then
            dim ptr_ as any ptr = obj->uni.ptr_
            unsafe_yyjson_mut_obj_rotate(obj, idx)
            unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
            obj->uni.ptr_ = ptr_
         else
            unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         end if
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_remove(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr) as yyjson_mut_val ptr
   if __builtin_expect(-(((yyjson_mut_is_obj(obj) andalso yyjson_mut_is_str(key)) = 0) = 0), 1) then
      return unsafe_yyjson_mut_obj_remove(obj, key->uni.str_, unsafe_yyjson_get_len(key))
   end if
   return NULL
end function

private function yyjson_mut_obj_remove_key(byval obj as yyjson_mut_val ptr, byval key as const zstring ptr) as yyjson_mut_val ptr
   if __builtin_expect(-(((yyjson_mut_is_obj(obj) andalso key) = 0) = 0), 1) then
      dim key_len as uinteger = strlen(key)
      return unsafe_yyjson_mut_obj_remove(obj, key, key_len)
   end if
   return NULL
end function

private function yyjson_mut_obj_remove_keyn(byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval key_len as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((yyjson_mut_is_obj(obj) andalso key) = 0) = 0), 1) then
      return unsafe_yyjson_mut_obj_remove(obj, key, key_len)
   end if
   return NULL
end function

private function yyjson_mut_obj_clear(byval obj as yyjson_mut_val ptr) as bool
   if __builtin_expect(-((yyjson_mut_is_obj(obj) = 0) = 0), 1) then
      unsafe_yyjson_set_len(obj, 0)
      return true
   end if
   return false
end function

private function yyjson_mut_obj_replace(byval obj as yyjson_mut_val ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
   if __builtin_expect(-((((yyjson_mut_is_obj(obj) andalso yyjson_mut_is_str(key)) andalso val_) = 0) = 0), 1) then
      return unsafe_yyjson_mut_obj_replace(obj, key, val_)
   end if
   return false
end function

private function yyjson_mut_obj_rotate(byval obj as yyjson_mut_val ptr, byval idx as uinteger) as bool
   if __builtin_expect(-(((yyjson_mut_is_obj(obj) andalso (unsafe_yyjson_get_len(obj) > idx)) = 0) = 0), 1) then
      unsafe_yyjson_mut_obj_rotate(obj, idx)
      return true
   end if
   return false
end function

'' TODO: #define yyjson_mut_obj_add_func(func) if (yyjson_likely(doc && yyjson_mut_is_obj(obj) && _key)) { yyjson_mut_val *key = unsafe_yyjson_mut_val(doc, 2); if (yyjson_likely(key)) { size_t len = unsafe_yyjson_get_len(obj); yyjson_mut_val *val = key + 1; size_t key_len = strlen(_key); bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len); key->tag = YYJSON_TYPE_STR; key->tag |= noesc ? YYJSON_SUBTYPE_NOESC : YYJSON_SUBTYPE_NONE; key->tag |= (uint64_t)strlen(_key) << YYJSON_TAG_BIT; key->uni.str = _key; func unsafe_yyjson_mut_obj_add(obj, key, val, len); return true; } } return false

private function yyjson_mut_obj_add_null(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr) as bool
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
        dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            unsafe_yyjson_set_null(val_)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_true(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr) as bool
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            unsafe_yyjson_set_bool(val_, true)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_false(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr) as bool
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            unsafe_yyjson_set_bool(val_, false)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_bool(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as bool) as bool
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            unsafe_yyjson_set_bool(val_, _val)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_uint(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as ulongint) as bool
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            unsafe_yyjson_set_uint(val_, _val)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_sint(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as longint) as bool
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            unsafe_yyjson_set_sint(val_, _val)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_int(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as longint) as bool
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            unsafe_yyjson_set_sint(val_, _val)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_float(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as single) as bool
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            unsafe_yyjson_set_float(val_, _val)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_double(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as double) as bool
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            unsafe_yyjson_set_double(val_, _val)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_real(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as double) as bool
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            unsafe_yyjson_set_real(val_, _val)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_str(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as const zstring ptr) as bool
   if __builtin_expect(-(((_val = 0) = 0) = 0), 0) then
      return false
   end if
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            dim val_len as uinteger = strlen(_val)
            dim as  bool val_noesc = unsafe_yyjson_is_str_noesc(_val, val_len)
            val_->tag = (culngint(strlen(_val)) shl cubyte(8)) or cubyte(5)
            val_->tag or= iif(val_noesc, cubyte(1 shl 3), cubyte(0 shl 3))
            val_->uni.str_ = _val
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_strn(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as const zstring ptr, byval _len as uinteger) as bool
   if __builtin_expect(-(((_val = 0) = 0) = 0), 0) then
      return false
   end if
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            val_->tag = (culngint(_len) shl cubyte(8)) or cubyte(5)
            val_->uni.str_ = _val
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_strcpy(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as const zstring ptr) as bool
   if __builtin_expect(-(((_val = 0) = 0) = 0), 0) then
      return false
   end if
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            dim _len as uinteger = strlen(_val)
            val_->uni.str_ = unsafe_yyjson_mut_strncpy(doc, _val, _len)
            if __builtin_expect(-(((val_->uni.str_ = 0) = 0) = 0), 0) then
               return false
            end if
            val_->tag = (culngint(_len) shl cubyte(8)) or cubyte(5)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_strncpy(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as const zstring ptr, byval _len as uinteger) as bool
   if __builtin_expect(-(((_val = 0) = 0) = 0), 0) then
      return false
   end if
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            val_->uni.str_ = unsafe_yyjson_mut_strncpy(doc, _val, _len)
            if __builtin_expect(-(((val_->uni.str_ = 0) = 0) = 0), 0) then
               return false
            end if
            val_->tag = (culngint(_len) shl cubyte(8)) or cubyte(5)
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_add_arr(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr) as yyjson_mut_val ptr
   dim key as yyjson_mut_val ptr = yyjson_mut_str(doc, _key)
   dim val_ as yyjson_mut_val ptr = yyjson_mut_arr(doc)
   return iif(yyjson_mut_obj_add(obj, key, val_), val_, NULL)
end function

private function yyjson_mut_obj_add_obj(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr) as yyjson_mut_val ptr
   dim key as yyjson_mut_val ptr = yyjson_mut_str(doc, _key)
   dim val_ as yyjson_mut_val ptr = yyjson_mut_obj(doc)
   return iif(yyjson_mut_obj_add(obj, key, val_), val_, NULL)
end function

private function yyjson_mut_obj_add_val(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _val as yyjson_mut_val ptr) as bool
   if __builtin_expect(-(((_val = 0) = 0) = 0), 0) then
      return false
   end if
   if __builtin_expect(-((((doc andalso yyjson_mut_is_obj(obj)) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr = unsafe_yyjson_mut_val(doc, 2)
      if __builtin_expect(-((key = 0) = 0), 1) then
         dim len_ as uinteger = unsafe_yyjson_get_len(obj)
         dim val_ as yyjson_mut_val ptr = key + 1
         dim key_len as uinteger = strlen(_key)
         dim as bool noesc = unsafe_yyjson_is_str_noesc(_key, key_len)
         key->tag = cubyte(5)
         key->tag or= iif(noesc, cubyte(1 shl 3), cubyte(0 shl 3))
         key->tag or= culngint(strlen(_key)) shl cubyte(8)
         key->uni.str_ = _key
         scope
            val_ = _val
         end scope
         unsafe_yyjson_mut_obj_add(obj, key, val_, len_)
         return true
      end if
   end if
   return false
end function

private function yyjson_mut_obj_remove_str(byval obj as yyjson_mut_val ptr, byval key as const zstring ptr) as yyjson_mut_val ptr
   return yyjson_mut_obj_remove_strn(obj, key, iif(key, strlen(key), 0))
end function

private function yyjson_mut_obj_remove_strn(byval obj as yyjson_mut_val ptr, byval _key as const zstring ptr, byval _len as uinteger) as yyjson_mut_val ptr
   if __builtin_expect(-(((yyjson_mut_is_obj(obj) andalso _key) = 0) = 0), 1) then
      dim key as yyjson_mut_val ptr
      dim iter as yyjson_mut_obj_iter
      dim val_removed as yyjson_mut_val ptr = NULL
      yyjson_mut_obj_iter_init(obj, @iter)
      '' TODO: while ((key = yyjson_mut_obj_iter_next(&iter)) != NULL) { if (unsafe_yyjson_equals_strn(key, _key, _len)) { if (!val_removed) val_removed = key->next; yyjson_mut_obj_iter_remove(&iter); } }
      return val_removed
   end if
   return NULL
end function

private function yyjson_mut_obj_rename_key(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval new_key as const zstring ptr) as bool
   if (key = 0) orelse (new_key = 0) then
      return false
   end if
   return yyjson_mut_obj_rename_keyn(doc, obj, key, strlen(key), new_key, strlen(new_key))
end function

private function yyjson_mut_obj_rename_keyn(byval doc as yyjson_mut_doc ptr, byval obj as yyjson_mut_val ptr, byval key as const zstring ptr, byval len_ as uinteger, byval new_key as const zstring ptr, byval new_len as uinteger) as bool
   dim cpy_key as zstring ptr = NULL
   dim old_key as yyjson_mut_val ptr
   dim iter as yyjson_mut_obj_iter
   if (((doc = 0) orelse (obj = 0)) orelse (key = 0)) orelse (new_key = 0) then
      return false
   end if
   yyjson_mut_obj_iter_init(obj, @iter)
   '' TODO: while ((old_key = yyjson_mut_obj_iter_next(&iter))) { if (unsafe_yyjson_equals_strn((void *)old_key, key, len)) { if (!cpy_key) { cpy_key = unsafe_yyjson_mut_strncpy(doc, new_key, new_len); if (!cpy_key) return false; } yyjson_mut_set_strn(old_key, cpy_key, new_len); } }
   return -(cpy_key <> NULL)
end function

#macro yyjson_ptr_set_err(_code, _msg)
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_##_code
         err_->msg = _msg
         err_->pos_ = 0
      end if
   loop while false
#endmacro
declare function unsafe_yyjson_ptr_getx(byval val_ as yyjson_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval err_ as yyjson_ptr_err ptr) as yyjson_val ptr
declare function unsafe_yyjson_mut_ptr_getx(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
declare function unsafe_yyjson_mut_ptr_putx(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval doc as yyjson_mut_doc ptr, byval create_parent as bool, byval insert_new as bool, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as bool
declare function unsafe_yyjson_mut_ptr_replacex(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
declare function unsafe_yyjson_mut_ptr_removex(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr

private function yyjson_doc_ptr_get(byval doc as yyjson_doc ptr, byval ptr_ as const zstring ptr) as yyjson_val ptr
   if __builtin_expect(-(((ptr_ = 0) = 0) = 0), 0) then
      return NULL
   end if
   return yyjson_doc_ptr_getn(doc, ptr_, strlen(ptr_))
end function

'#define yyjson_doc_ptr_getn(doc, ptr_, len_) cptr(yyjson_val ptr, yyjson_doc_ptr_getx((doc), (ptr_), (len_), NULL))

private function yyjson_doc_ptr_getx(byval doc as yyjson_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval err_ as yyjson_ptr_err ptr) as yyjson_val ptr
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if __builtin_expect(-((((doc = 0) orelse (ptr_ = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-(((doc->root = 0) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_NULL_ROOT
            err_->msg = @"document's root is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      return doc->root
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   return unsafe_yyjson_ptr_getx(doc->root, ptr_, len_, err_)
end function

private function yyjson_ptr_get(byval val_ as yyjson_val ptr, byval ptr_ as const zstring ptr) as yyjson_val ptr
   if __builtin_expect(-(((ptr_ = 0) = 0) = 0), 0) then
      return NULL
   end if
   return yyjson_ptr_getn(val_, ptr_, strlen(ptr_))
end function

'#define yyjson_ptr_getn(val_, ptr_, len_) cptr(yyjson_val ptr, yyjson_ptr_getx((val_), (ptr_), (len_), NULL))

private function yyjson_ptr_getx(byval val_ as yyjson_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval err_ as yyjson_ptr_err ptr) as yyjson_val ptr
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if __builtin_expect(-((((val_ = 0) orelse (ptr_ = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      return val_
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   return unsafe_yyjson_ptr_getx(val_, ptr_, len_, err_)
end function

private function yyjson_mut_doc_ptr_get(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr) as yyjson_mut_val ptr
   if ptr_ = 0 then
      return NULL
   end if
   return yyjson_mut_doc_ptr_getn(doc, ptr_, strlen(ptr_))
end function

'#define yyjson_mut_doc_ptr_getn(doc, ptr_, len_) cptr(yyjson_mut_val ptr, yyjson_mut_doc_ptr_getx((doc), (ptr_), (len_), NULL, NULL))

private function yyjson_mut_doc_ptr_getx(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if ctx then
      memset(ctx, 0, sizeof(*ctx))
   end if
   if __builtin_expect(-((((doc = 0) orelse (ptr_ = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-(((doc->root = 0) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_NULL_ROOT
            err_->msg = @"document's root is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      return doc->root
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   return unsafe_yyjson_mut_ptr_getx(doc->root, ptr_, len_, ctx, err_)
end function

private function yyjson_mut_ptr_get(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr) as yyjson_mut_val ptr
   if ptr_ = 0 then
      return NULL
   end if
   return yyjson_mut_ptr_getn(val_, ptr_, strlen(ptr_))
end function

'#define yyjson_mut_ptr_getn(val_, ptr_, len_) cptr(yyjson_mut_val ptr, yyjson_mut_ptr_getx((val_), (ptr_), (len_), NULL, NULL))

private function yyjson_mut_ptr_getx(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if ctx then
      memset(ctx, 0, sizeof(*ctx))
   end if
   if __builtin_expect(-((((val_ = 0) orelse (ptr_ = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      return val_
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   return unsafe_yyjson_mut_ptr_getx(val_, ptr_, len_, ctx, err_)
end function

private function yyjson_mut_doc_ptr_add(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr) as bool
   if __builtin_expect(-(((ptr_ = 0) = 0) = 0), 0) then
      return false
   end if
   return yyjson_mut_doc_ptr_addn(doc, ptr_, strlen(ptr_), new_val)
end function

'#define yyjson_mut_doc_ptr_addn(doc, ptr_, len_, new_val) cast(bool, yyjson_mut_doc_ptr_addx((doc), (ptr_), (len_), (new_val), true, NULL, NULL))

private function yyjson_mut_doc_ptr_addx(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval create_parent as bool, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as bool
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if ctx then
      memset(ctx, 0, sizeof(*ctx))
   end if
   if __builtin_expect(-(((((doc = 0) orelse (ptr_ = 0)) orelse (new_val = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      if doc->root then
         do
            if err_ then
               err_->code = YYJSON_PTR_ERR_SET_ROOT
               err_->msg = @"cannot set document's root"
               err_->pos_ = 0
            end if
         loop while false
         return false
      else
         doc->root = new_val
         return true
      end if
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   if __builtin_expect(-((((doc->root = 0) andalso (create_parent = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_NULL_ROOT
            err_->msg = @"document's root is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   if __builtin_expect(-(((doc->root = 0) = 0) = 0), 0) then
      dim root as yyjson_mut_val ptr = yyjson_mut_obj(doc)
      if __builtin_expect(-(((root = 0) = 0) = 0), 0) then
         do
            if err_ then
               err_->code = YYJSON_PTR_ERR_MEMORY_ALLOCATION
               err_->msg = @"failed to create value"
               err_->pos_ = 0
            end if
         loop while false
         return false
      end if
      if unsafe_yyjson_mut_ptr_putx(root, ptr_, len_, new_val, doc, create_parent, true, ctx, err_) then
         doc->root = root
         return true
      end if
      return false
   end if
   return unsafe_yyjson_mut_ptr_putx(doc->root, ptr_, len_, new_val, doc, create_parent, true, ctx, err_)
end function

private function yyjson_mut_ptr_add(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr, byval doc as yyjson_mut_doc ptr) as bool
   if __builtin_expect(-(((ptr_ = 0) = 0) = 0), 0) then
      return false
   end if
   return yyjson_mut_ptr_addn(val_, ptr_, strlen(ptr_), new_val, doc)
end function

'#define yyjson_mut_ptr_addn(val_, ptr_, len_, new_val, doc) cast(bool, yyjson_mut_ptr_addx((val_), (ptr_), (len_), (new_val), (doc), true, NULL, NULL))

private function yyjson_mut_ptr_addx(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval doc as yyjson_mut_doc ptr, byval create_parent as bool, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as bool
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if ctx then
      memset(ctx, 0, sizeof(*ctx))
   end if
   if __builtin_expect(-((((((val_ = 0) orelse (ptr_ = 0)) orelse (new_val = 0)) orelse (doc = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SET_ROOT
            err_->msg = @"cannot set root"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   return unsafe_yyjson_mut_ptr_putx(val_, ptr_, len_, new_val, doc, create_parent, true, ctx, err_)
end function

private function yyjson_mut_doc_ptr_set(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr) as bool
   if __builtin_expect(-(((ptr_ = 0) = 0) = 0), 0) then
      return false
   end if
   return yyjson_mut_doc_ptr_setn(doc, ptr_, strlen(ptr_), new_val)
end function

'#define yyjson_mut_doc_ptr_setn(doc, ptr_, len_, new_val) cast(bool, yyjson_mut_doc_ptr_setx((doc), (ptr_), (len_), (new_val), true, NULL, NULL))

private function yyjson_mut_doc_ptr_setx(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval create_parent as bool, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as bool
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if ctx then
      memset(ctx, 0, sizeof(*ctx))
   end if
   if __builtin_expect(-((((doc = 0) orelse (ptr_ = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      if ctx then
         ctx->old = doc->root
      end if
      doc->root = new_val
      return true
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   if new_val = 0 then
      if doc->root = 0 then
         do
            if err_ then
               err_->code = YYJSON_PTR_ERR_RESOLVE
               err_->msg = @"JSON pointer cannot be resolved"
               err_->pos_ = 0
            end if
         loop while false
         return false
      end if
      return -((unsafe_yyjson_mut_ptr_removex(doc->root, ptr_, len_, ctx, err_) = 0) = 0)
   end if
   if __builtin_expect(-((((doc->root = 0) andalso (create_parent = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_NULL_ROOT
            err_->msg = @"document's root is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   if __builtin_expect(-(((doc->root = 0) = 0) = 0), 0) then
      dim root as yyjson_mut_val ptr = yyjson_mut_obj(doc)
      if __builtin_expect(-(((root = 0) = 0) = 0), 0) then
         do
            if err_ then
               err_->code = YYJSON_PTR_ERR_MEMORY_ALLOCATION
               err_->msg = @"failed to create value"
               err_->pos_ = 0
            end if
         loop while false
         return false
      end if
      if unsafe_yyjson_mut_ptr_putx(root, ptr_, len_, new_val, doc, create_parent, false, ctx, err_) then
         doc->root = root
         return true
      end if
      return false
   end if
   return unsafe_yyjson_mut_ptr_putx(doc->root, ptr_, len_, new_val, doc, create_parent, false, ctx, err_)
end function

private function yyjson_mut_ptr_set(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr, byval doc as yyjson_mut_doc ptr) as bool
   if __builtin_expect(-(((ptr_ = 0) = 0) = 0), 0) then
      return false
   end if
   return yyjson_mut_ptr_setn(val_, ptr_, strlen(ptr_), new_val, doc)
end function

'#define yyjson_mut_ptr_setn(val_, ptr_, len_, new_val, doc) cast(bool, yyjson_mut_ptr_setx((val_), (ptr_), (len_), (new_val), (doc), true, NULL, NULL))

private function yyjson_mut_ptr_setx(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval doc as yyjson_mut_doc ptr, byval create_parent as bool, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as bool
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if ctx then
      memset(ctx, 0, sizeof(*ctx))
   end if
   if __builtin_expect(-(((((val_ = 0) orelse (ptr_ = 0)) orelse (doc = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SET_ROOT
            err_->msg = @"cannot set root"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return false
   end if
   if new_val = 0 then
      return -((unsafe_yyjson_mut_ptr_removex(val_, ptr_, len_, ctx, err_) = 0) = 0)
   end if
   return unsafe_yyjson_mut_ptr_putx(val_, ptr_, len_, new_val, doc, create_parent, false, ctx, err_)
end function

private function yyjson_mut_doc_ptr_replace(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr) as yyjson_mut_val ptr
   if ptr_ = 0 then
      return NULL
   end if
   return yyjson_mut_doc_ptr_replacen(doc, ptr_, strlen(ptr_), new_val)
end function

'#define yyjson_mut_doc_ptr_replacen(doc, ptr_, len_, new_val) cptr(yyjson_mut_val ptr, yyjson_mut_doc_ptr_replacex((doc), (ptr_), (len_), (new_val), NULL, NULL))

private function yyjson_mut_doc_ptr_replacex(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if ctx then
      memset(ctx, 0, sizeof(*ctx))
   end if
   if __builtin_expect(-(((((doc = 0) orelse (ptr_ = 0)) orelse (new_val = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      dim root as yyjson_mut_val ptr = doc->root
      if __builtin_expect(-(((root = 0) = 0) = 0), 0) then
         do
            if err_ then
               err_->code = YYJSON_PTR_ERR_RESOLVE
               err_->msg = @"JSON pointer cannot be resolved"
               err_->pos_ = 0
            end if
         loop while false
         return NULL
      end if
      if ctx then
         ctx->old = root
      end if
      doc->root = new_val
      return root
   end if
   if __builtin_expect(-(((doc->root = 0) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_NULL_ROOT
            err_->msg = @"document's root is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   return unsafe_yyjson_mut_ptr_replacex(doc->root, ptr_, len_, new_val, ctx, err_)
end function

private function yyjson_mut_ptr_replace(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval new_val as yyjson_mut_val ptr) as yyjson_mut_val ptr
   if ptr_ = 0 then
      return NULL
   end if
   return yyjson_mut_ptr_replacen(val_, ptr_, strlen(ptr_), new_val)
end function

''#define yyjson_mut_ptr_replacen(val_, ptr_, len_, new_val) cptr(yyjson_mut_val ptr, yyjson_mut_ptr_replacex((val_), (ptr_), (len_), (new_val), NULL, NULL))

private function yyjson_mut_ptr_replacex(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval new_val as yyjson_mut_val ptr, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if ctx then
      memset(ctx, 0, sizeof(*ctx))
   end if
   if __builtin_expect(-(((((val_ = 0) orelse (ptr_ = 0)) orelse (new_val = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SET_ROOT
            err_->msg = @"cannot set root"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   return unsafe_yyjson_mut_ptr_replacex(val_, ptr_, len_, new_val, ctx, err_)
end function

private function yyjson_mut_doc_ptr_remove(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr) as yyjson_mut_val ptr
   if ptr_ = 0 then
      return NULL
   end if
   return yyjson_mut_doc_ptr_removen(doc, ptr_, strlen(ptr_))
end function

'#define yyjson_mut_doc_ptr_removen(doc, ptr_, len_) cptr(yyjson_mut_val ptr, yyjson_mut_doc_ptr_removex((doc), (ptr_), (len_), NULL, NULL))

private function yyjson_mut_doc_ptr_removex(byval doc as yyjson_mut_doc ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if ctx then
      memset(ctx, 0, sizeof(*ctx))
   end if
   if __builtin_expect(-((((doc = 0) orelse (ptr_ = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-(((doc->root = 0) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_NULL_ROOT
            err_->msg = @"document's root is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      dim root as yyjson_mut_val ptr = doc->root
      if ctx then
         ctx->old = root
      end if
      doc->root = NULL
      return root
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   return unsafe_yyjson_mut_ptr_removex(doc->root, ptr_, len_, ctx, err_)
end function

private function yyjson_mut_ptr_remove(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr) as yyjson_mut_val ptr
   if ptr_ = 0 then
      return NULL
   end if
   return yyjson_mut_ptr_removen(val_, ptr_, strlen(ptr_))
end function

'#define yyjson_mut_ptr_removen(val_, ptr_, len_) cptr(yyjson_mut_val ptr, yyjson_mut_ptr_removex((val_), (ptr_), (len_), NULL, NULL))

private function yyjson_mut_ptr_removex(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger, byval ctx as yyjson_ptr_ctx ptr, byval err_ as yyjson_ptr_err ptr) as yyjson_mut_val ptr
   do
      if err_ then
         err_->code = YYJSON_PTR_ERR_NONE
         err_->msg = NULL
         err_->pos_ = 0
      end if
   loop while false
   if ctx then
      memset(ctx, 0, sizeof(*ctx))
   end if
   if __builtin_expect(-((((val_ = 0) orelse (ptr_ = 0)) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_PARAMETER
            err_->msg = @"input parameter is NULL"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-(((len_ = 0) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SET_ROOT
            err_->msg = @"cannot set root"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   if __builtin_expect(-((((*ptr_) <> asc("/")) = 0) = 0), 0) then
      do
         if err_ then
            err_->code = YYJSON_PTR_ERR_SYNTAX
            err_->msg = @"no prefix '/'"
            err_->pos_ = 0
         end if
      loop while false
      return NULL
   end if
   return unsafe_yyjson_mut_ptr_removex(val_, ptr_, len_, ctx, err_)
end function

private function yyjson_ptr_ctx_append(byval ctx as yyjson_ptr_ctx ptr, byval key as yyjson_mut_val ptr, byval val_ as yyjson_mut_val ptr) as bool
   dim ctn as yyjson_mut_val ptr
   dim pre_key as yyjson_mut_val ptr
   dim pre_val as yyjson_mut_val ptr
   dim cur_key as yyjson_mut_val ptr
   dim cur_val as yyjson_mut_val ptr
   if ((ctx = 0) orelse (ctx->ctn = 0)) orelse (val_ = 0) then
      return false
   end if
   ctn = ctx->ctn
   if yyjson_mut_is_obj(ctn) then
      if key = 0 then
         return false
      end if
      key->next_ = val_
      pre_key = ctx->pre
      if unsafe_yyjson_get_len(ctn) = 0 then
         val_->next_ = key
         ctn->uni.ptr_ = key
         ctx->pre = key
      elseif pre_key = 0 then
         pre_key = cptr(yyjson_mut_val ptr, ctn->uni.ptr_)
         pre_val = pre_key->next_
         val_->next_ = pre_val->next_
         pre_val->next_ = key
         ctn->uni.ptr_ = key
         ctx->pre = pre_key
      else
         cur_key = pre_key->next_->next_
         cur_val = cur_key->next_
         val_->next_ = cur_val->next_
         cur_val->next_ = key
         if ctn->uni.ptr_ = cur_key then
            ctn->uni.ptr_ = key
         end if
         ctx->pre = cur_key
      end if
   else
      pre_val = ctx->pre
      if unsafe_yyjson_get_len(ctn) = 0 then
         val_->next_ = val_
         ctn->uni.ptr_ = val_
         ctx->pre = val_
      elseif pre_val = 0 then
         pre_val = cptr(yyjson_mut_val ptr, ctn->uni.ptr_)
         val_->next_ = pre_val->next_
         pre_val->next_ = val_
         ctn->uni.ptr_ = val_
         ctx->pre = pre_val
      else
         cur_val = pre_val->next_
         val_->next_ = cur_val->next_
         cur_val->next_ = val_
         if ctn->uni.ptr_ = cur_val then
            ctn->uni.ptr_ = val_
         end if
         ctx->pre = cur_val
      end if
   end if
   unsafe_yyjson_inc_len(ctn)
   return true
end function

private function yyjson_ptr_ctx_replace(byval ctx as yyjson_ptr_ctx ptr, byval val_ as yyjson_mut_val ptr) as bool
   dim ctn as yyjson_mut_val ptr
   dim pre_key as yyjson_mut_val ptr
   dim cur_key as yyjson_mut_val ptr
   dim pre_val as yyjson_mut_val ptr
   dim cur_val as yyjson_mut_val ptr
   if (((ctx = 0) orelse (ctx->ctn = 0)) orelse (ctx->pre = 0)) orelse (val_ = 0) then
      return false
   end if
   ctn = ctx->ctn
   if yyjson_mut_is_obj(ctn) then
      pre_key = ctx->pre
      pre_val = pre_key->next_
      cur_key = pre_val->next_
      cur_val = cur_key->next_
      cur_key->next_ = val_
      val_->next_ = cur_val->next_
      ctx->old = cur_val
   else
      pre_val = ctx->pre
      cur_val = pre_val->next_
      if pre_val <> cur_val then
         val_->next_ = cur_val->next_
         pre_val->next_ = val_
         if ctn->uni.ptr_ = cur_val then
            ctn->uni.ptr_ = val_
         end if
      else
         val_->next_ = val_
         ctn->uni.ptr_ = val_
         ctx->pre = val_
      end if
      ctx->old = cur_val
   end if
   return true
end function

private function yyjson_ptr_ctx_remove(byval ctx as yyjson_ptr_ctx ptr) as bool
   dim ctn as yyjson_mut_val ptr
   dim pre_key as yyjson_mut_val ptr
   dim pre_val as yyjson_mut_val ptr
   dim cur_key as yyjson_mut_val ptr
   dim cur_val as yyjson_mut_val ptr
   dim len_ as uinteger
   if ((ctx = 0) orelse (ctx->ctn = 0)) orelse (ctx->pre = 0) then
      return false
   end if
   ctn = ctx->ctn
   if yyjson_mut_is_obj(ctn) then
      pre_key = ctx->pre
      pre_val = pre_key->next_
      cur_key = pre_val->next_
      cur_val = cur_key->next_
      pre_val->next_ = cur_val->next_
      if ctn->uni.ptr_ = cur_key then
         ctn->uni.ptr_ = pre_key
      end if
      ctx->pre = NULL
      ctx->old = cur_val
   else
      pre_val = ctx->pre
      cur_val = pre_val->next_
      pre_val->next_ = cur_val->next_
      if ctn->uni.ptr_ = cur_val then
         ctn->uni.ptr_ = pre_val
      end if
      ctx->pre = NULL
      ctx->old = cur_val
   end if
   len_ = unsafe_yyjson_get_len(ctn) - 1
   if len_ = 0 then
      ctn->uni.ptr_ = NULL
   end if
   unsafe_yyjson_set_len(ctn, len_)
   return true
end function

#undef yyjson_ptr_set_err

private function yyjson_ptr_get_bool(byval root as yyjson_val ptr, byval ptr_ as const zstring ptr, byval value as bool ptr) as bool
   dim val_ as yyjson_val ptr = yyjson_ptr_get(root, ptr_)
   if value andalso yyjson_is_bool(val_) then
      (*value) = unsafe_yyjson_get_bool(val_)
      return true
   else
      return false
   end if
end function

private function yyjson_ptr_get_uint(byval root as yyjson_val ptr, byval ptr_ as const zstring ptr, byval value as ulongint ptr) as bool
   dim val_ as yyjson_val ptr = yyjson_ptr_get(root, ptr_)
   if value andalso val_ then
      dim ret as ulongint = val_->uni.u64
      if unsafe_yyjson_is_uint(val_) orelse (unsafe_yyjson_is_sint(val_) andalso ((ret shr 63) = 0)) then
         (*value) = ret
         return true
      end if
   end if
   return false
end function

private function yyjson_ptr_get_sint(byval root as yyjson_val ptr, byval ptr_ as const zstring ptr, byval value as longint ptr) as bool
   dim val_ as yyjson_val ptr = yyjson_ptr_get(root, ptr_)
   if value andalso val_ then
      dim ret as longint = val_->uni.i64
      if unsafe_yyjson_is_sint(val_) orelse (unsafe_yyjson_is_uint(val_) andalso (ret >= 0)) then
         (*value) = ret
         return true
      end if
   end if
   return false
end function

private function yyjson_ptr_get_real(byval root as yyjson_val ptr, byval ptr_ as const zstring ptr, byval value as double ptr) as bool
   dim val_ as yyjson_val ptr = yyjson_ptr_get(root, ptr_)
   if value andalso yyjson_is_real(val_) then
      (*value) = unsafe_yyjson_get_real(val_)
      return true
   else
      return false
   end if
end function

private function yyjson_ptr_get_num(byval root as yyjson_val ptr, byval ptr_ as const zstring ptr, byval value as double ptr) as bool
   dim val_ as yyjson_val ptr = yyjson_ptr_get(root, ptr_)
   if value andalso yyjson_is_num(val_) then
      (*value) = unsafe_yyjson_get_num(val_)
      return true
   else
      return false
   end if
end function

private function yyjson_ptr_get_str(byval root as yyjson_val ptr, byval ptr_ as const zstring ptr, byval value as const zstring ptr ptr) as bool
   dim val_ as yyjson_val ptr = yyjson_ptr_get(root, ptr_)
   if value andalso yyjson_is_str(val_) then
      (*value) = unsafe_yyjson_get_str(val_)
      return true
   else
      return false
   end if
end function

#define yyjson_doc_get_pointer(doc, ptr_) cptr(yyjson_val ptr, yyjson_doc_ptr_get((doc), (ptr_)))
#define yyjson_doc_get_pointern(doc, ptr_, len_) cptr(yyjson_val ptr, yyjson_doc_ptr_getn((doc), (ptr_), (len_)))
#define yyjson_mut_doc_get_pointer(doc, ptr_) cptr(yyjson_mut_val ptr, yyjson_mut_doc_ptr_get((doc), (ptr_)))
#define yyjson_mut_doc_get_pointern(doc, ptr_, len_) cptr(yyjson_mut_val ptr, yyjson_mut_doc_ptr_getn((doc), (ptr_), (len_)))
#define yyjson_get_pointer(val_, ptr_) cptr(yyjson_val ptr, yyjson_ptr_get((val_), (ptr_)))
#define yyjson_get_pointern(val_, ptr_, len_) cptr(yyjson_val ptr, yyjson_ptr_getn((val_), (ptr_), (len_)))
#define yyjson_mut_get_pointer(val_, ptr_) cptr(yyjson_mut_val ptr, yyjson_mut_ptr_get((val_), (ptr_)))
#define yyjson_mut_get_pointern(val_, ptr_, len_) cptr(yyjson_mut_val ptr, yyjson_mut_ptr_getn((val_), (ptr_), (len_)))

private function unsafe_yyjson_get_pointer(byval val_ as yyjson_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger) as yyjson_val ptr
   dim err_ as yyjson_ptr_err
   return unsafe_yyjson_ptr_getx(val_, ptr_, len_, @err_)
end function

private function unsafe_yyjson_mut_get_pointer(byval val_ as yyjson_mut_val ptr, byval ptr_ as const zstring ptr, byval len_ as uinteger) as yyjson_mut_val ptr
   dim err_ as yyjson_ptr_err
   return unsafe_yyjson_mut_ptr_getx(val_, ptr_, len_, NULL, @err_)
end function

end extern
