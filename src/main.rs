use std::fs;

fn main() {
    let contents = fs::read_to_string("./example.asm")
        .expect("file doesn't exist");

    println!("{contents}");
}
