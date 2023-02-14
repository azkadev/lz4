cmake_minimum_required(VERSION 3.10)

project(lz4_library C)
message(STATUS "CMake version: " ${CMAKE_VERSION})
message(STATUS "CMake system name: " ${CMAKE_SYSTEM_NAME})
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -Wall -Werror")

# Set the download directory to a subdirectory of the build directory
# set(DEPENDENCIES_SOURCES ${CMAKE_CURRENT_BINARY_DIR}/dependencies)

# # Create the download directory if it does not exist
# file(MAKE_DIRECTORY ${DEPENDENCIES_SOURCES})
 
if (CMAKE_SIZEOF_VOID_P MATCHES 8)
set(ES_BITS 64)
if (${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    set(ES_64BIT TRUE CACHE BOOL "Build 64-bit binaries")
else ()
    set(ES_64BIT TRUE INTERNAL)
endif ()
else ()
set(ES_BITS 32)
endif ()


# include(FetchContent)

# FetchContent_Declare(
#   lz4_source
#   GIT_REPOSITORY https://github.com/lz4/lz4.git
#   GIT_TAG dev
# )

# FetchContent_MakeAvailable(lz4_source)

set(LZ4_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/lz4)

add_library(lz4_library SHARED 
    ${LZ4_SOURCES}/lib/lz4.h
    ${LZ4_SOURCES}/lib/lz4.c
    ${LZ4_SOURCES}/lib/lz4hc.h
    ${LZ4_SOURCES}/lib/lz4hc.c
    ${LZ4_SOURCES}/lib/lz4frame.h
    ${LZ4_SOURCES}/lib/lz4frame.c
    ${LZ4_SOURCES}/lib/xxhash.h
    ${LZ4_SOURCES}/lib/xxhash.c)

set_target_properties(lz4_library PROPERTIES PREFIX "lib")


set_target_properties(lz4_library PROPERTIES OUTPUT_NAME "lz4-${CMAKE_SYSTEM_NAME}-x${ES_BITS}")