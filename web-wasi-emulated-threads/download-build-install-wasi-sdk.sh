#!/usr/bin/env bash

set -eox pipefail

mkdir /tmp/dl
cd /tmp/dl

wasi_sdk_dir=/opt/wasi-sdk
mkdir -p $wasi_sdk_dir

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
export PATH=$HOME/.cargo/bin:$PATH

git clone --recurse-submodules -b enable-libcxx-threads https://github.com/thewtex/wasi-sdk
cd wasi-sdk
git fetch origin --tags
git remote add upstream https://github.com/WebAssembly/wasi-sdk
git fetch upstream wasi-sdk-${WASI_VERSION}

./ci/build.sh
cd build/dist
tar xzf wasi-toolchain-*.tar.gz --strip-components=1 -C /opt/wasi-sdk
mkdir -p /opt/wasi-sdk/share/wasi-sysroot
tar xzf wasi-sysroot-*.tar.gz --strip-components=1 -C /opt/wasi-sdk/share/wasi-sysroot
for wasi_toolchain in wasi wasip1 wasip2; do
  libclang_rt_out_dir=/opt/wasi-sdk/lib/clang/${LLVM_VERSION}/${wasi_toolchain}
  mkdir -p $libclang_rt_out_dir
  tar xzf ./libclang_rt.builtins-*.tar.gz --strip-components=1 -C $libclang_rt_out_dir
done
mkdir -p /opt/wasi-sdk/lib/clang/${LLVM_VERSION}/lib/wasm32-unknown-wasi
cp ${libclang_rt_out_dir}/libclang_rt.builtins-wasm32.a /opt/wasi-sdk/lib/clang/${LLVM_VERSION}/lib/wasm32-unknown-wasi/libclang_rt.builtins.a

cd /tmp/
rm -rf /tmp/dl
rm -rf $HOME/.cargo

