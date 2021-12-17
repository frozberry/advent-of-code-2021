fn main() {
    println!("Hello, world!");
}
use std::fs::File;
use std::io::{BufRead, BufReader};

fn main() {
    let test_lines = lines_from_file("../test.txt");
    let input_lines = lines_from_file("../input.txt");

    part1(test_lines.clone());
    part1(input_lines.clone());

    part2(test_lines);
    part2(input_lines);
}

fn part1(lines: Vec<String>) {
    println!("Part 1: ");
}

fn part2(lines: Vec<String>) {
    println!("Part 2: ");
}

fn lines_from_file(filename: &str) -> Vec<String> {
    let file = File::open(filename).expect("no such file");
    let buf = BufReader::new(file);
    buf.lines()
        .map(|l| l.expect("Could not parse line"))
        .collect()
}
