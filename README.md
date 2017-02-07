# Example Rust program for SMT32F3Discovery board

This project is based on the great book from:
https://github.com/japaric/discovery

## Usage

Prepare project 

```sh
rustup default nightly
rustup component add rust-src
rustup toolchain install nightly
cargo install xargo
```

```sh
xargo build --target thumbv7em-none-eabihf
```