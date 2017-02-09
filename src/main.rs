#![no_std]
#![no_main]

extern crate pg;


#[inline(never)]
#[no_mangle]
pub fn main() -> ! {
    let y;
    let x = 42;
    y = x;

    loop {}
}