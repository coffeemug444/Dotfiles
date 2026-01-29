cmake_minimum_required(VERSION 3.10)

project(main)

set (CMAKE_CXX_STANDARD 23)
set (CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(FetchContent)

FetchContent_Declare(
    fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG        12.1.0
    GIT_SHALLOW ON
    EXCLUDE_FROM_ALL
)

FetchContent_Declare(
    range-v3
    GIT_REPOSITORY https://github.com/ericniebler/range-v3.git
    GIT_TAG        0.12.0
    GIT_SHALLOW ON
    EXCLUDE_FROM_ALL
)

FetchContent_MakeAvailable(fmt range-v3)

add_executable(main src/main.cpp)

target_include_directories(main
    SYSTEM PRIVATE
    ${range-v3_SOURCE_DIR}/include
    ${fmt_SOURCE_DIR}/include
)
target_link_libraries(main PRIVATE fmt::fmt range-v3)

add_compile_options(-Wall -Wextra -Wpedantic -fsanitize=undefined -pg) # not using -Werror for hacking around stuff
add_link_options(-fsanitize=undefined)  # Add sanitizers to the linker stage

