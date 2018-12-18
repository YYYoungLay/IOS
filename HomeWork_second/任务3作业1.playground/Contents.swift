//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//给定一个Dictionary，Dictionary包含key值name和age，用map函数返回age字符串数组
let dictionary = [["name":"Young","age":18],["name":"Blue","age":17],["name":"Orange","age":21]]
let arrayName = dictionary.map{$0["name"]!}
let dictionary2 = [["name":"Black","age":"14"],["name":"Green","age":"18"],["name":"","age":""]]
let arrayName2 = dictionary2.map{$0["name"] ?? ""}.filter{$0 != ""}
print(arrayName)
print(arrayName2)


var arrayString:[String]=["12","Young","12.3","13.44","WE","I am A","34","56","234"]
print("arrayString:\(arrayString)")
let arrayIntMap = arrayString.map{Int ($0)}
print("arrayIntMap:\(arrayIntMap)")
let arrayIntflatMap = arrayString.flatMap{Int ($0)}
print("arrayIntflatMap:\(arrayIntflatMap)")
//给定一个String数组，用filter函数选出能被转成Int的字符串
let result = arrayIntMap.filter{ $0 != nil}
print("filter函数选出能被转成Int的字符串:\(result)")
//用reduce函数把String数组中元素连接成一个字符串，以逗号分隔
let reduceString = arrayString.reduce("",{"\($0)\($1),"})
print("String数组中元素连接成一个字符串，以逗号分隔:\(reduceString)")
//用 reduce 方法一次求出整数数组的最大值、最小值、总数和
var statisArray = [10,2,4,5,17]
let temp = statisArray.reduce((max:Int.min,min:Int.max,sum:0)){
    (temp,i) in return (max(temp.max,i),min(temp.min,i),temp.sum+i)
}
print("最大值：\(temp.max)")
print("最小值：\(temp.min)")
print("总和：\(temp.sum)")
//新建一个函数数组，函数数组里面保存了不同函数类型的函数，要求从数组里找出参数为一个整数，返回值为一个整数的所有函数；
var arrFunc = [Any]()
func f1(x1: String) -> String {
    return x1
}
func f2(x2: Int) -> Int {
    return x2
}
func f3(x3: Double, x4:Double) -> Int{
    return 4
}
func f4(x5: Int) -> Int{
    return x5
}
arrFunc.append(f1)
arrFunc.append(f2)
arrFunc.append(f3)
arrFunc.append(f4)
var j = 1
for i in arrFunc{
    if i is ((Int)->Int){
        print("the func f\(j) is a type:(Int) -> Int")
    }
    j = j + 1
}
//扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证；
extension Int{
    func sqrt(num:Int)->Double{
        return Darwin.sqrt(Double(num))
    }
}
print(sqrt(16))
//实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值，分别传入整数值、浮点数值、字符串进行验证。
//T遵守Comarable协议表示T是可比较的变量，否则会发生错误：Binary operator '<' cannot be applied to two 'T' operands
func findMaxAndMin<T:Comparable>(data:[T])->(max:T,min:T){
    var max = data[0]
    var min = data[0]
    for i in data{
        if max < i{
            max = i
        }else if min > i{
            min = i
        }
    }
    return(max,min)
}
let tempInt = findMaxAndMin(data: [12,34,56,2])
print("整数值，最大值：\(tempInt.max)，最小值：\(tempInt.min)")
let tempFloat = findMaxAndMin(data: [12.3,14.5,16.7,5.0])
print("浮点数，最大值：\(tempFloat.max)，最小值:\(tempFloat.min)")
let tempString = findMaxAndMin(data: ["X","A","E"])
print("字符串，最大值：\(tempString.max)，最小值:\(tempString.min)")

