#!/usr/bin/env sh

exec ${WASI_SDK_PATH}/bin/clang++ -D_WASI_EMULATED_PTHREAD --target=wasm32-wasi --sysroot=${WASI_SYSROOT} "$@"
