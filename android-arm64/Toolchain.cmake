set(CMAKE_SYSTEM_NAME Android)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_ANDROID_ARCH_ABI arm64-v8a)

set(cross_triple aarch64-linux-android)
set(CMAKE_ANDROID_STANDALONE_TOOLCHAIN $ENV{CROSS_ROOT})
set(CMAKE_ANDROID_ARM_MODE ON)
set(CMAKE_ANDROID_ARM_NEON ON)

set(CMAKE_C_COMPILER $ENV{CC})
set(CMAKE_CXX_COMPILER $ENV{CXX})
set(CMAKE_Fortran_COMPILER $ENV{FC})
set(CMAKE_EXE_LINKER_FLAGS "-llog")
set(CMAKE_SHARED_LINKER_FLAGS "-llog")

set(CMAKE_FIND_ROOT_PATH $ENV{CROSS_ROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)
set(CMAKE_SYSROOT $ENV{CROSS_ROOT}/sysroot)

set(CMAKE_CROSSCOMPILING_EMULATOR /usr/bin/qemu-arm)
