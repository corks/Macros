set(scratch_directory ${CMAKE_CURRENT_BINARY_DIR}${CMAKE_FILES_DIRECTORY})
message(STATUS "Checking for inline keyword")
foreach(KEYWORD "inline" "__inline__" "__inline")
    if(NOT DEFINED C_INLINE)
        TRY_COMPILE(C_HAS_${KEYWORD} "${scratch_directory}" "${CMAKE_SOURCE_DIR}/cmake/test_inline.c"
            COMPILE_DEFINITIONS "-Dinline=${KEYWORD}")
        if(C_HAS_${KEYWORD})
            set(C_INLINE TRUE)
            ADD_DEFINITIONS("-Dinline=${KEYWORD}")
        ENDIF(C_HAS_${KEYWORD})
    ENDIF(NOT DEFINED C_INLINE)
ENDFOREACH(KEYWORD)
IF(NOT DEFINED C_INLINE)
    ADD_DEFINITIONS("-Dinline=")
ENDIF(NOT DEFINED C_INLINE)
