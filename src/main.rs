#![deny(unsafe_code)]
#![no_main]
#![no_std]

extern crate pg;

#[inline(never)]
#[no_mangle]
pub fn main() -> ! {
    loop {}
}