#![no_std]
#![no_main]

extern crate pg;

#[no_mangle]
pub fn main() -> ! {
    let y;
    let x = 42;
    y = x;

    loop {}
}