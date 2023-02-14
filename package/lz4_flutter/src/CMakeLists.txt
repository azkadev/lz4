# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.



cmake_minimum_required(VERSION 3.10)

project(lz4_flutter_library VERSION 0.0.1 LANGUAGES C)

message(STATUS "CMake version: " ${CMAKE_VERSION})
message(STATUS "CMake system name: " ${CMAKE_SYSTEM_NAME})
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -Wall -Werror")


include(FetchContent)

FetchContent_Declare(
  lz4_source
  GIT_REPOSITORY https://github.com/lz4/lz4.git
  GIT_TAG dev
)

FetchContent_MakeAvailable(lz4_source)

set(LZ4_SOURCES ${lz4_source_SOURCE_DIR})

add_library(lz4_flutter SHARED 
    ${LZ4_SOURCES}/lib/lz4.h
    ${LZ4_SOURCES}/lib/lz4.c
    ${LZ4_SOURCES}/lib/lz4hc.h
    ${LZ4_SOURCES}/lib/lz4hc.c
    ${LZ4_SOURCES}/lib/lz4frame.h
    ${LZ4_SOURCES}/lib/lz4frame.c
    ${LZ4_SOURCES}/lib/xxhash.h
    ${LZ4_SOURCES}/lib/xxhash.c)

# set_target_properties(lz4_flutter PROPERTIES PREFIX "lib")

set_target_properties(lz4_flutter PROPERTIES OUTPUT_NAME "lz4")

target_compile_definitions(lz4_flutter PUBLIC DART_SHARED_LIB)