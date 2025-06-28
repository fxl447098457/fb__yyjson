#include once "yyjson.bi"
#ifndef __fb_64bit__
#libpath "win32"
#else
#libpath "win64"
#endif
dim  doc as yyjson_mut_doc ptr = yyjson_mut_doc_new(NULL)
dim root as yyjson_mut_val ptr = yyjson_mut_obj(doc)
 yyjson_mut_doc_set_root(doc, root)
yyjson_mut_obj_add_str(doc, root, "name", "Mash")
yyjson_mut_obj_add_int(doc, root, "star", 4)
dim hits_arr(0 to ...) as long = {2, 2, 1, 3}
dim  hits as yyjson_mut_val ptr = yyjson_mut_arr_with_sint32(doc, @hits_arr(0), 4)
 yyjson_mut_obj_add_val(doc, root, "hits", hits)
dim  json as const zstring ptr = yyjson_mut_write(doc, 0, NULL)
if json then
   printf(!"json: %s\n", json)
   free(cptr(any ptr, json))
end if
yyjson_mut_doc_free(doc)
sleep
