//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var primes = [Int]()
for i in 2...10000 {
    var isPrime = true
    for j in 2..<i {
        if i % j == 0 {
            isPrime = false
        }
    }
    if isPrime {
        primes.append(i)
    }
}
//1 method 正序
func compare(x:Int,y:Int) -> Bool{
    return x < y
}
let p = primes.sorted()
primes.sort(by: compare)
//2.method 正序
primes.sort(by:{(x,y) in x < y })
//3.method 倒序
primes.sort(by:{$0 > $1})
//4. 倒序
primes.sort{$0 > $1}
//5正序
primes.sort(by: < )
print(primes)
