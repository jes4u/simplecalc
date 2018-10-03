//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var total = 0;

        //Reg vs special equation check
        if args[args.count - 1] == "count" || args[args.count - 1] == "avg" || args[args.count - 1] == "fact" {
            if args.count == 1 {
                total = 0;
            } else {
                var numbers = args
                let opp = numbers.removeLast();
                switch opp {
                    case "count":
                        total = count(numbers);
                    case "avg":
                        total = avg(numbers);
                    default: //Last case
                        total = fact(numbers);
                }
            }
            
        } else {
            let opp = args[args.count - 2];
            switch opp {
            case "+":
                total = Int(args[0])! + Int(args[args.count - 1])!
            case "-":
                total = Int(args[0])! - Int(args[args.count - 1])!
            case "*":
                total = Int(args[0])! * Int(args[args.count - 1])!
            case "/":
                total = Int(args[0])! / Int(args[args.count - 1])!
            default: //last possible case is modulo
                total = Int(args[0])! % Int(args[args.count - 1])!
            
            }
        }
        return total;
    }
    
    private func count(_ arg: [String]) -> Int {
        return arg.count;
        
    }
    private func avg(_ arg: [String]) -> Int {
        var total = 0
        for number in arg {
            total += Int(number)!;
        }
        total /= arg.count;
        return total;
    }
    private func fact(_ arg: [String]) -> Int {
        var total = 1;
        if arg[0] == "0" || arg[0] == "1" {
            total = 1;
        } else {
            for index in 1...Int(arg[0])! {
                total *= index;
            }
        }
        
        return total
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

