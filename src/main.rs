use std::fs;

use avr_sim::parse_asm;

fn main() {
    let registers: [u16; 32] = [
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    ];

    let contents = fs::read_to_string("./src/asm/testing.asm")
        .expect("file doesn't exist");

    let commands = parse_asm(contents);

    println!("{contents}");
}

