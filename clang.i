%module clang

%{
#include "clang-c/Index.h"
#include "clang-c/CXString.h"
#include "clang-c/CXCompilationDatabase.h"
%}

%include "../clang3.3_march2013/include/clang-c/Platform.h"
%include "../clang3.3_march2013/include/clang-c/CXString.h"
%include "../clang3.3_march2013/include/clang-c/Index.h"
%include "../clang3.3_march2013/include/clang-c/CXCompilationDatabase.h"
