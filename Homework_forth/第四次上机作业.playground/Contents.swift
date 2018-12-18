//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//1.    文件缓存处理
let fileManager = FileManager.default
if var docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
    docPath.appendPathComponent("YngF1")
    print(docPath)
    if !fileManager.fileExists(atPath: docPath.path){
        try fileManager.createDirectory(at: docPath, withIntermediateDirectories: true, attributes: nil)
    }
}
//判断图片是否存在
//存在图片
let path = NSHomeDirectory()+"/Documents/🐯太郎.png"
if fileManager.fileExists(atPath: path) {
    var imagePath = fileManager.urls(for: .documentDirectory, in: .userDomainMask) .first!
    imagePath.appendPathComponent("🐯太郎.png")
    let imageData = try? Data(contentsOf:imagePath)
    try?imageData?.write(to: imagePath)
    let image = UIImage(data:imageData!)
    print("存在图片！")
}else{//不存在图片的情况
    let imageUrl = URL(string:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540182894828&di=4b751a509697eb929f475b23edbe0261&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn%2Fw640h360%2F20180212%2F5146-fyrpeie0656154.jpg")!
    let imageData = try?Data(contentsOf:imageUrl)
    var imagePath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    imagePath.appendPathComponent("🐯太郎.png")
    try?imageData?.write(to:imagePath)
    let image = UIImage(data:imageData!)
    print("不存在图片！")
}
//2.    自定制视图：
class MySquare: UIView {
    override func draw(_ rect: CGRect) {
        //矩形
        let rectPath = UIBezierPath(rect:rect)
        UIColor.brown.setStroke()//为线条设置为brown
        rectPath.stroke();//添加线条
        UIColor.green.setFill()//设置填充为绿色
        rectPath.fill()//添加填充色
    }
}
class MyOval:UIView{
    override func draw(_ rect: CGRect) {
        //椭圆
        let ovalPath = UIBezierPath(ovalIn:rect)
        UIColor.black.setStroke()
        ovalPath.stroke()
        UIColor.blue.setFill()
        ovalPath.fill()
    }
}
class MyPic: UIView{
    override func draw(_ rect: CGRect) {
        //创建一个UIBerzierPath变量，可创建基于矢量的路径，常用来绘图
        let path = UIBezierPath()
        //绘制随意四边形
        path.move(to: CGPoint(x:300,y:100))
        path.addLine(to: CGPoint(x:300,y:100))//绘制线条
        path.addLine(to: CGPoint(x:260,y:200))
        path.addLine(to: CGPoint(x:100,y:200))
        path.addLine(to: CGPoint(x:100,y:70))
        path.close()//关闭
        UIColor.red.setStroke()
        path.stroke()
        UIColor.orange.setFill()
        path.fill()
    }
}
var triangle = MySquare(frame:CGRect(x:100,y:400,width:100,height:100))
var oval = MyOval(frame:CGRect(x:200,y:400,width:100,height:100))
var pic = MyPic(frame:CGRect(x:0,y:0,width:330,height:270))

