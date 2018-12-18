//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//创建美剧类型Gender（性别）
enum Gender:Int {
    case male=1,female
}
//创建类Person
class Person{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{return lastName + firstName}
    init(firstName:String,lastName:String,age:Int,gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(lastName:String){
        self.init(firstName: "",lastName:lastName,age:18,gender:Gender.female)
    }
    func description() ->String {
        return "name:\(fullName),age:\(age),gender:\(gender)"
    }
    //Person增加run方法(方法里面直接print输出Person XXX is running;
    func run() ->(){
        print("Person \(fullName) is running!")
    }
}
//新建协议SchoolProtocol
enum Department{
    case student,teacher
}
protocol SchoolProtocol{
    var department:Department{get set}
    func lendBook()
}
//创建Person类的继承类Teacher
class Teacher:Person,SchoolProtocol{
    var department: Department
    var title:String
    init(firstName:String,lastName:String,age:Int,gender:Gender,title:String){
        self.title = title
        self.department = Department.teacher
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override func description() -> String {
        return "name:\(fullName),age:\(age),gender:\(gender),title:\(title)"
    }
    //Teacher重载(重写？)run方法(
    override func run() ->(){
        print("Teacher \(fullName) is running!")
    }
    func lendBook() {
        print("Teacher \(fullName) can lend 20 books for a time.")
    }
}
//创建Person类的继承类Student,修改
class Student:Person,SchoolProtocol{
    var department: Department
    var stuNo:String
    init(firstName:String,lastName:String,age:Int,gender:Gender,stuNo:String){
        self.stuNo = stuNo
        self.department = Department.student
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override func description() -> String {
        return super.description() + " stuNo:\(stuNo) "
    }
    //Student重载run方法(
    override func run() ->(){
        print("Student \(fullName) is running!")
    }
    func lendBook() {
        print("Student \(fullName) can lend 5 books for a time.")
    }
}
//重载运算符==
func == (left:Person,right:Person) ->Bool {
    if left.fullName == right.fullName && left.age == right.age{
        return true
    }
    else {
        return false
    }
}
//重载运算符！=
func != (left:Person,right:Person) ->Bool {
    if left.fullName == right.fullName && left.age == right.age{
        return false
    }
    else{
        return true
    }
}
//创建对象person1、person2、person3
var person1 = Person(firstName:"Jessi",lastName:"Jung",age:22,gender:Gender.male)
var person2 = Person(lastName:"Kim")
var person3 = person1
//判断是我否为同一个人
if person1 == person3{
    print("same!")
}else{
    print("different!")
}
if person1 != person2{
    print("different!")
}else{
    print("same!")
}
//输出person1、person2、person3的信息
print(person1)
print(person1.description())
print(person2.description())
print(person3.description())
//创建对象teacher1和teacher2
var teacher1 = Teacher(firstName:"Roly",lastName:"Rice",age:16,gender:Gender.female,title:"Dance")
var teacher2 = Teacher(firstName:"Kaycee",lastName:"China",age:21,gender:Gender.female,title:"Chinese")
//打印输出teacher1、teacher2的信息
print(teacher1.description())
print(teacher2.description())
//创建对象student1、student2
var student1 = Student(firstName:"Sean",lastName:"Lew",age:18,gender:Gender.male,stuNo:"2017110345")
var student2 = Student(firstName:"Taylor",lastName:"Young",age:16,
                       gender:Gender.female,stuNo:"2016110249")
//打印输出对象student1、student2的信息
print(student1.description())
print(student2.description())


var array=[person1,person2,teacher1,teacher2,student1,student2]
print("输出的数组为：\(array)")
var numOfPerson = 0     //计算Person类的个数
var numOfTeacher = 0    //计算Teacher类的个数
var numOfStudent = 0    //计算Student类的
for i in array{
    //判断array数组中的数据的类型
    let classType = type(of:i)
    if (classType is Person.Type){
        numOfPerson = numOfPerson + 1
    }
    if(classType is Student.Type){
        numOfStudent = numOfStudent + 1
    }
    if(classType is Teacher.Type){
        numOfTeacher = numOfTeacher + 1
    }
}
//定义一个空的字典
//var dictionary=[String:Int]()
var dictionary: [String:Int] = ["person":numOfPerson,"teacher":numOfTeacher,"student":numOfStudent]
print("输出字典为：\(dictionary)")
//age排序
print("按照age排序")
array.sort{$0.age > $1.age}
for p in array{
    print(p.description())
}
//fullname排序
print("按照fullName排序")
array.sort{$0.fullName > $1.fullName}
for p in array{
    print(p.description())
}
print("按照gender+age排序")
array.sort{$0.age > $1.age && $0.gender.rawValue > $1.gender.rawValue}
for p in array{
    print(p.description())
}

//run
for i in array{
    i.run()
    //判断array数组中的数据的类型
    let classType = type(of:i)
    if(classType is Student.Type){
        //强制转换i的类型为Student
        (i as! Student).lendBook()
        //错误：Value of type 'Person' has no member 'lendBook'
        //i.lendBook()
    }
    if(classType is Teacher.Type){
        //强制转化i的类型为Teacher
        (i as! Teacher).lendBook()
    }
}
//student2.lendBook()


