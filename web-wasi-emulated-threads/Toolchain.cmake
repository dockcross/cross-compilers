set(WASI_SDK_PREFIX $ENV{WASI_SDK_PATH})
include($ENV{WASI_SDK_PATH}/share/cmake/wasi-sdk.cmake)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_WASI_EMULATED_PTHREAD")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_WASI_EMULATED_PTHREAD")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -lwasi-emulated-pthread")

set(CMAKE_FIND_ROOT_PATH $ENV{CROSS_ROOT})
set(CMAKE_SYSROOT $ENV{WASI_SYSROOT})

set(CMAKE_C_COMPILER /usr/local/bin/clang-wasi-sysroot.sh)
set(CMAKE_CXX_COMPILER /usr/local/bin/clang++-wasi-sysroot.sh)

set(CMAKE_CROSSCOMPILING_EMULATOR /wasi-runtimes/wasmtime/bin/wasmtime-pwd.sh)
