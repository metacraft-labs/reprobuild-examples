cmake_minimum_required(VERSION 3.15)
project(python_pep517_scikit_build_core_example LANGUAGES C)

# scikit-build-core provides the Python finding + extension
# infrastructure. ``Python_add_library`` builds a Python C extension
# module with the right naming/linker settings for the target platform.
find_package(Python COMPONENTS Interpreter Development.Module REQUIRED)

Python_add_library(python_pep517_scikit_build_core_example MODULE
  src/module.c
  WITH_SOABI)

install(TARGETS python_pep517_scikit_build_core_example
  DESTINATION python_pep517_scikit_build_core_example)
