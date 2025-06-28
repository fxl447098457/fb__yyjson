#include once "yyjson.bi"
#ifndef __fb_64bit__
#libpath "win32"
#else
#libpath "win64"
#endif
dim json as zstring ptr = @!"{\"name\":\"Mash\",\"star\":4,\"hits\":[2,2,1,3]}"
dim doc as yyjson_doc ptr = yyjson_read(json, strlen(json), 0)
dim root as yyjson_val ptr = yyjson_doc_get_root(doc)

dim name_ as yyjson_val ptr = yyjson_obj_get(root, "name")
 printf(!"name: %s\n", yyjson_get_str(name_))
 printf(!"name length:%d\n", yyjson_get_len(name_))
dim star as yyjson_val ptr = yyjson_obj_get(root, "star")
printf(!"star: %d\n", yyjson_get_int(star))
dim  hits as yyjson_val ptr = yyjson_obj_get(root, "hits")
dim as uinteger  idx, max
dim  hit as yyjson_val ptr
yyjson_arr_foreach (hits, idx, max, hit)
printf(!"hit%d: %d\n", idx, yyjson_get_int(hit))
yyjson_arr_foreach_next
yyjson_doc_free(doc)
sleep