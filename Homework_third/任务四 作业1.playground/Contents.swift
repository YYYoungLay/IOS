//: Playground - noun: a place where people can play

import UIKit
//处理时间:显示当前准确的中文时间，包括北京、东京、纽约、伦敦，格式为（2016年9月28日星期三 上午10:25）
import Foundation


let currentDate = Date()
var dateFormatter = DateFormatter()

dateFormatter.dateFormat = "yyyy年M月dd日E a HH:mm"
dateFormatter.locale = Locale(identifier: "zh_CN")
//dateFormatter.timeZone = TimeZone(abbreviation:"UTC+8:00")
let timeBeiJing = dateFormatter.string(from:currentDate)
print("北京时间："+timeBeiJing)

dateFormatter.timeZone = TimeZone(abbreviation:"UTC+9:00")
let timeTokyo = dateFormatter.string(from: currentDate)
print("东京时间："+timeTokyo)

dateFormatter.timeZone = TimeZone(secondsFromGMT:-4*3600)
let timeNY = dateFormatter.string(from: currentDate)
print("纽约时间："+timeNY)

dateFormatter.timeZone = TimeZone(secondsFromGMT:1*3600)
let timeLondon = dateFormatter.string(from: currentDate)
print("伦敦时间："+timeLondon)


//处理字符串
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."

//let str1 = [str.index(str.startIndex,offsetBy:3)..<str.index(str.startIndex,offsetBy:20)]
let index1 = str.index(str.startIndex, offsetBy: 3)
let index2 = str.index(str.startIndex, offsetBy: 20)
let str1 = str[index1..<index2]
print("返回字符串从第6个字符到第20个字符的子串:"+str1)
let str2 = str.replacingOccurrences(of: "OS", with: "")
print("删除其中所有的OS字符:"+str2)

//3.    将1、2题的时间和字符串存入一个字典中，并存入沙盒中的Document某文件中；
var dictionary = ["北京时间":timeBeiJing,"东京时间":timeTokyo,"纽约时间":timeNY,"伦敦时间":timeLondon,"字符串":str] as AnyObject
let fileManager = FileManager.default
var url = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!
url.appendPathComponent("test.txt")
print(url)
try? dictionary.write(to: url, atomically: true)

//4.    从网上下载一张照片并保存到本地沙盒的Document的某文件中；
let imageUrl = URL(string:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537354872212&di=15367ff9186a4215c590ff9a91b1da27&imgtype=0&src=http%3A%2F%2Fwx2.sinaimg.cn%2Fthumb150%2F69707d7dgy1fkt61go8lqj20xc0irwg1.jpg")!
let imageData = try? Data(contentsOf:imageUrl)
var url1 = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!
url1.appendPathComponent("虎太郎.jpg")
print(url1)
try?  imageData?.write(to:url1)
let image = UIImage(data:imageData!)

//5.    从网上查找访问一个JSon接口文件，并采用JSONSerialization和字典对其进行简单解析；
//http://www.bejson.com/knownjson/webInterface/
enum MyError:Error {
    case Zero
    case NotURL
}
guard let postUrl = URL(string:"http://www.kuaidi100.com/query?type=yuantong&postid=11111111111" )else{
    throw MyError.NotURL
}
let jsondata = try! Data(contentsOf: postUrl)
let json = try!JSONSerialization.jsonObject(with: jsondata, options:.allowFragments )
guard let dic = json as? [String:Any] else{
    throw MyError.NotURL
}
print(dic)
guard let messageInfo = dic["message"] as? [String:String] else {
    throw MyError.NotURL
}
print(messageInfo)

