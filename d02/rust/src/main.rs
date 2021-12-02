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
    let mut hor = 0;
    let mut depth = 0;

    for line in lines {
        let cmd: Vec<&str> = line.split_whitespace().collect();
        let instruction = cmd[0];
        let num: i32 = str::parse(cmd[1]).unwrap();

        match instruction {
            "forward" => hor += num,
            "down" => depth += num,
            "up" => depth -= num,
            _ => panic!("bad instruction"),
        }
    }

    println!("Part 1: {}", hor * depth);
}

fn part2(lines: Vec<String>) {
    let mut hor = 0;
    let mut depth = 0;
    let mut aim = 0;

    for line in lines {
        let cmd: Vec<&str> = line.split_whitespace().collect();
        let instruction = cmd[0];
        let num: i32 = str::parse(cmd[1]).unwrap();

        match instruction {
            "forward" => {
                hor += num;
                depth += aim * num;
            }
            "down" => aim += num,
            "up" => aim -= num,
            _ => panic!("bad instruction"),
        }
    }

    println!("Part 2: {}", hor * depth);
}

fn lines_from_file(filename: &str) -> Vec<String> {
    let file = File::open(filename).expect("no such file");
    let buf = BufReader::new(file);
    buf.lines()
        .map(|l| l.expect("Could not parse line"))
        .collect()
}
