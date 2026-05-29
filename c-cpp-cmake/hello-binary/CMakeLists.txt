cmake_minimum_required(VERSION 3.20)
project(hello LANGUAGES C)

# Force the produced binary to land at the build dir root (so the M38
# convention's predicted output path
# ``.repro/build/cmake/hello[.exe]`` matches reality regardless of how
# CMake configures CMAKE_RUNTIME_OUTPUT_DIRECTORY).
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")

add_executable(hello src/main.c)
