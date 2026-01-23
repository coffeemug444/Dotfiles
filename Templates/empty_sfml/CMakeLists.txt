cmake_minimum_required(VERSION 3.10)

project(main)

set (CMAKE_CXX_STANDARD 23)

include(FetchContent)
FetchContent_Declare(
    SFML
    GIT_REPOSITORY https://github.com/SFML/SFML.git
    GIT_TAG 3.0.0
    GIT_SHALLOW ON
    EXCLUDE_FROM_ALL
    SYSTEM
)

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

FetchContent_MakeAvailable(SFML fmt range-v3)

add_compile_options(-Werror -Wall -Wextra -Wpedantic -pg)

add_executable(main src/main.cpp)

target_link_libraries(main PRIVATE SFML::Graphics SFML::Window SFML::System SFML::Audio fmt::fmt range-v3)
target_include_directories(main PRIVATE ${CMAKE_SOURCE_DIR}/src)

file(COPY ${CMAKE_SOURCE_DIR}/resources
     DESTINATION ${CMAKE_BINARY_DIR})
