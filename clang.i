%module clang

%{
#include "clang-c/Index.h"
#include "clang-c/CXString.h"
#include "clang-c/CXCompilationDatabase.h"
%}

// allow a Tcl list to be passed to certain functions that expect
// an array of char* pointers
//    * clang_createTranslationUnitFromSourceFile()
//    * clang_parseTranslationUnit()
//    * clang_getRemappingsFromFileList()
//    * clang_indexSourceFile()
%typemap(in) char ** clang_command_line_args {
    Tcl_Obj **listobj;
    int nitems;
    int i;
    if (Tcl_ListObjGetElements(interp, $input, &nitems, &listobj) == TCL_ERROR)
        return TCL_ERROR;
    $1 = (char **)malloc((nitems+1)*sizeof(char *));
    for (i = 0; i < nitems; i++)
        $1[i] = Tcl_GetStringFromObj(listobj[i], NULL);
    $1[i] = NULL;
}
%typemap(freearg) char ** clang_command_line_args {
    if ($1)
        free($1);
}
%apply char ** clang_command_line_args {char ** command_line_args, char ** filePaths};

%include "../clang3.3_march2013/include/clang-c/Platform.h"
%include "../clang3.3_march2013/include/clang-c/CXString.h"
%include "../clang3.3_march2013/include/clang-c/Index.h"
%include "../clang3.3_march2013/include/clang-c/CXCompilationDatabase.h"
