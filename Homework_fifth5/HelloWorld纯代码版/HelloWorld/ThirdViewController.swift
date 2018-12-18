//
//  ThirdViewController.swift
//  HelloWorld
//
//  Created by 509 on 2018/10/18.
//  Copyright © 2018年 2016110346. All rights reserved.
//

import UIKit

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
class ThirdViewController: UIViewController {
    var triangle : MySquare?//将UIViewController的子类中的变量全部进行拆包处理，就是在变量声明的时候加一个？号,否则出现错误class ThirdViewController has no initializers
    var oval : MyOval?
    var pic : MyPic?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //创建lable
        let lable = UILabel(frame:CGRect(x:200,y:200,width:400,height:150))
        lable.text = "Hi Third!"
        lable.backgroundColor = UIColor.white
        lable.textAlignment = .center
        lable.center = view.center
        //添加lable到视图中去，否则在视图中看不见
        view.addSubview(lable)
        
        let triangle = MySquare(frame:CGRect(x:100,y:400,width:100,height:100))
        view.addSubview(triangle)
        let oval = MyOval(frame:CGRect(x:200,y:400,width:100,height:100))
        view.addSubview(oval)
        let pic = MyPic(frame:CGRect(x:0,y:0,width:330,height:270))
        view.addSubview(pic)
        
        self.title = "third"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
