#![no_std]
#![no_main]

extern crate f3;

use core::iter;
use f3::delay;
use f3::led::{LEDS};


// Initialize delay and led module
#[inline(never)]
#[export_name = "_init"]
pub unsafe fn init() {
    f3::delay::init();
    f3::led::init();
}


// Main function
#[inline(never)]
#[no_mangle]
pub fn main() -> ! {
    loop {
        for (current, next) in LEDS.iter()
            .zip(LEDS.iter().skip(1).chain(iter::once(&LEDS[0]))) {
            next.on();
            delay::ms(50);
            current.off();
            delay::ms(50);
        }
    }
}