
include_directories(
  ${PROJECT_SOURCE_DIR}/runtime/src
  ${PROJECT_SOURCE_DIR}/runtime/src/atn
  ${PROJECT_SOURCE_DIR}/runtime/src/dfa
  ${PROJECT_SOURCE_DIR}/runtime/src/misc
  ${PROJECT_SOURCE_DIR}/runtime/src/support
  ${PROJECT_SOURCE_DIR}/runtime/src/support/utf8
  ${PROJECT_SOURCE_DIR}/runtime/src/tree
  ${PROJECT_SOURCE_DIR}/runtime/src/tree/pattern
  ${PROJECT_SOURCE_DIR}/runtime/src/tree/xpath
)


file(GLOB libantlrcpp_SRC
  "${PROJECT_SOURCE_DIR}/runtime/src/*.cpp"
  "${PROJECT_SOURCE_DIR}/runtime/src/atn/*.cpp"
  "${PROJECT_SOURCE_DIR}/runtime/src/dfa/*.cpp"
  "${PROJECT_SOURCE_DIR}/runtime/src/misc/*.cpp"
  "${PROJECT_SOURCE_DIR}/runtime/src/support/*.cpp"
  "${PROJECT_SOURCE_DIR}/runtime/src/tree/*.cpp"
  "${PROJECT_SOURCE_DIR}/runtime/src/tree/pattern/*.cpp"
  "${PROJECT_SOURCE_DIR}/runtime/src/tree/xpath/*.cpp"
)

# add_library(antlr4_shared SHARED ${libantlrcpp_SRC})
add_library(antlr4_static STATIC ${libantlrcpp_SRC})

# This are needed for transitive include dirs. Ideally all include dirs should be specified
# like this. For now, luckily, this folder provides all the 'public' headers needed when linking to this libs.
target_include_directories(antlr4_static PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)
target_include_directories(antlr4_static PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)

# target_include_directories(antlr4_shared PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)
# target_include_directories(antlr4_shared PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)

# Anything that links to the static lib should use the ANTLR4CPP_STATIC define as well.
target_compile_definitions(antlr4_static PUBLIC ANTLR4CPP_STATIC)

if(CMAKE_SYSTEM_NAME MATCHES "Linux")
  # target_link_libraries(antlr4_shared ${UUID_LIBRARIES})
  target_link_libraries(antlr4_static ${UUID_LIBRARIES})
elseif(APPLE)
  # target_link_libraries(antlr4_shared ${COREFOUNDATION_LIBRARY})
  target_link_libraries(antlr4_static ${COREFOUNDATION_LIBRARY})
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  set(disabled_compile_warnings "/wd4251")
else()
  set(disabled_compile_warnings "-Wno-overloaded-virtual")
endif()


if("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
  set(disabled_compile_warnings "${disabled_compile_warnings} -Wno-dollar-in-identifier-extension -Wno-four-char-constants")
elseif("${CMAKE_CXX_COMPILER_ID}" MATCHES "GNU" OR "${CMAKE_CXX_COMPILER_ID}" MATCHES "Intel")
  set(disabled_compile_warnings "${disabled_compile_warnings} -Wno-multichar")
endif()

set(extra_share_compile_flags "")
set(extra_static_compile_flags "")
if(WIN32)
  set(extra_share_compile_flags "-DANTLR4CPP_EXPORTS")
  set(extra_static_compile_flags "-DANTLR4CPP_STATIC")
endif(WIN32)
if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  if(WITH_STATIC_CRT)
    # target_compile_options(antlr4_shared PRIVATE "/MT$<$<CONFIG:Debug>:d>")
    target_compile_options(antlr4_static PRIVATE "/MT$<$<CONFIG:Debug>:d>")
  else()
    # target_compile_options(antlr4_shared PRIVATE "/MD$<$<CONFIG:Debug>:d>")
    target_compile_options(antlr4_static PRIVATE "/MD$<$<CONFIG:Debug>:d>")
  endif()
endif()

set(static_lib_suffix "")
if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  set(static_lib_suffix "-static")
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  set(extra_share_compile_flags "-DANTLR4CPP_EXPORTS -MP /wd4251")
  set(extra_static_compile_flags "-DANTLR4CPP_STATIC -MP")
endif()

# set_target_properties(antlr4_shared
#                       PROPERTIES VERSION   ${ANTLR_VERSION}
#                                  SOVERSION ${ANTLR_VERSION}
#                                  OUTPUT_NAME antlr4-runtime
#                                  COMPILE_FLAGS "${disabled_compile_warnings} ${extra_share_compile_flags}")

set_target_properties(antlr4_static
                      PROPERTIES OUTPUT_NAME "antlr4-runtime${static_lib_suffix}"
                                 COMPILE_FLAGS "${disabled_compile_warnings} ${extra_static_compile_flags}")

# install(TARGETS antlr4_static
#         EXPORT antlr4-targets
#           RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
#           LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#           ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
#         )


# install(DIRECTORY "${PROJECT_SOURCE_DIR}/runtime/src/"
#         DESTINATION "include/antlr4-runtime"
#         COMPONENT dev
#         FILES_MATCHING
#           PATTERN "*.h"
#           PATTERN "UTF8_LICENSE"
#         )



