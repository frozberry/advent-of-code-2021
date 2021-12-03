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
    let len = lines[0].len();

    let mut foo = vec![];

    for i in 0..len {
        let mut bar = vec![];

        for line in lines.clone() {
            bar.push(line.chars().nth(i).unwrap())
        }
        foo.push(bar)
    }

    let most_common: Vec<u32> = foo
        .iter()
        .map(|e| {
            let ones: Vec<char> = e.iter().cloned().filter(|c| *c == '1').collect();
            let zeros: Vec<char> = e.iter().cloned().filter(|c| *c == '0').collect();

            if zeros.len() > ones.len() {
                '0'
            } else {
                '1'
            }
        })
        .map(|c| c.to_digit(10).unwrap())
        .collect();

    let least_common: Vec<u32> = most_common
        .iter()
        .cloned()
        .map(|i| if i == 0 { 1 } else { 0 })
        .collect();

    let gamma = bits_to_u32(most_common);
    let epsilon = bits_to_u32(least_common);

    let solution = gamma * epsilon;

    println!("Part 1: {}", solution);
}

fn part2(lines: Vec<String>) {
    let len = lines[0].len();
    let mut oxygen_entries = lines.clone();
    let mut carbon_entries = lines;

    for i in 0..len {
        let relevant_char: Vec<char> = oxygen_entries
            .iter()
            .map(|l| l.chars().nth(i).unwrap())
            .collect();

        let ones: Vec<char> = relevant_char
            .iter()
            .cloned()
            .filter(|c| *c == '1')
            .collect();

        let zeros: Vec<char> = relevant_char
            .iter()
            .cloned()
            .filter(|c| *c == '0')
            .collect();

        let relevant_char = if ones.len() >= zeros.len() { '1' } else { '0' };

        oxygen_entries = oxygen_entries
            .iter()
            .cloned()
            .filter(|e| e.chars().nth(i).unwrap() == relevant_char)
            .collect();

        if oxygen_entries.len() == 1 {
            break;
        }
    }

    // Why did I repeat this instead of puttin it in a function? Because I'm lazy.
    for i in 0..len {
        let relevant_char: Vec<char> = carbon_entries
            .iter()
            .map(|l| l.chars().nth(i).unwrap())
            .collect();

        let ones: Vec<char> = relevant_char
            .iter()
            .cloned()
            .filter(|c| *c == '1')
            .collect();

        let zeros: Vec<char> = relevant_char
            .iter()
            .cloned()
            .filter(|c| *c == '0')
            .collect();

        let relevant_char = if zeros.len() <= ones.len() { '0' } else { '1' };

        carbon_entries = carbon_entries
            .iter()
            .cloned()
            .filter(|e| e.chars().nth(i).unwrap() == relevant_char)
            .collect();

        if carbon_entries.len() == 1 {
            break;
        }
    }

    let o_bits: Vec<u32> = oxygen_entries[0]
        .chars()
        .map(|c| c.to_digit(10).unwrap())
        .collect();

    let oxygen = bits_to_u32(o_bits);

    let c_bits: Vec<u32> = carbon_entries[0]
        .chars()
        .map(|c| c.to_digit(10).unwrap())
        .collect();

    let carbon = bits_to_u32(c_bits);

    let solution = oxygen * carbon;

    println!("Part 2: {}", solution);
}

fn bits_to_u32(bits: Vec<u32>) -> u32 {
    let mut num = 0;

    for (i, b) in bits.iter().rev().enumerate() {
        num += u32::pow(2, i as u32) * b
    }
    num
}

fn lines_from_file(filename: &str) -> Vec<String> {
    let file = File::open(filename).expect("no such file");
    let buf = BufReader::new(file);
    buf.lines()
        .map(|l| l.expect("Could not parse line"))
        .collect()
}
