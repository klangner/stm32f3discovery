# Example Rust program for SMT32F3Discovery board

This project is based on the great book from:
https://github.com/japaric/discovery


## Prepare rust environment 

```sh
rustup default nightly
rustup component add rust-src
rustup toolchain install nightly
cargo install xargo
```

## Compile

```sh
xargo build --target thumbv7em-none-eabihf
```


## Some commands

```bash
# Open debugger
openocd -f interface/stlink-v2-1.cfg -f target/stm32f3x.cfg

# Check ELF header
 arm-none-eabi-readelf -h target/thumbv7em-none-eabihf/debug/stm32f3discovery

# Dump executable
arm-none-eabi-objdump -Cd target/thumbv7em-none-eabihf/debug/stm32f3discovery

# connect to the debugger
arm-none-eabi-gdb -q target/thumbv7em-none-eabihf/debug/stm32f3discovery 
```


## Working with the debugger

```
(gdb) target remote :3333
(gdb) load
(gdb) break main
(gdb) layout src
```