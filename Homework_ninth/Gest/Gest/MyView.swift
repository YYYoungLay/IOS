//
//  MyView.swift
//  Gest
//
//  Created by student on 2018/11/13.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit

@IBDesignable//设计可视
class MyView: UIView {

    //增加属性，自定制控制键
    @IBInspectable var color: UIColor?
    
    func setup(){
        //设置矩形区域圆角
        self.layer.cornerRadius = 10
        //设置阴影
        self.layer.shadowColor = UIColor.blue.cgColor
        self.layer.shadowOffset = CGSize(width: 7, height: 8)
        self.layer.shadowOpacity = 0.1
        //设置视图的内容模式为重绘
        self.contentMode = .redraw

        //移动
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)
        
        //缩放
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchRecognizer)
        //删除
        let tapRecognzier = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecognzier)
        tapRecognzier.numberOfTapsRequired = 2
        //旋转
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotation(recognizer:)))
        self.addGestureRecognizer(rotationRecognizer)
        //颜色改变
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(recognizer:)))
        longPressRecognizer.minimumPressDuration = 2//设置最小按压时间的属性
        //longPressRecognizer.numberOfTapsRequired = 1//设置点击次数的属性
        self.addGestureRecognizer(longPressRecognizer)
        //轻扫实现删除,z\在实现的时候会出现与pan操作重复的问题
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipe(recognizer:)))
        swipeRecognizer.direction = .up//设置轻扫方向的属性
        swipeRecognizer.numberOfTouchesRequired = 1//设置触摸数量的属性
        self.addGestureRecognizer(swipeRecognizer)
    }
    
    //平移(拖动)
    @objc func pan(recognizer: UIPanGestureRecognizer){
//        if recognizer.state == .changed || recognizer.state == .ended {
//            //获得view平移的x，y的值（x2-x1，y2-y1）
//            let translation = recognizer.translation(in: self)
//            self.center.x += translation.x
//            self.center.y += translation.y
//            //坐标置零？？
//            recognizer.setTranslation(.zero, in: self)
//        }
        //直接重绘视图
        self.center = recognizer.location(in: superview)
    }
    //当使用者将两只手指向对方移动时，通常的意思是放大
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
      //  scale屏幕坐标中相对于两个触摸点的比例因子。
        bounds = CGRect(x: 0, y: 0, width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
//        let scale = recognizer.scale
//        self.transform = self.transform.scaledBy(x: scale, y: scale)
        recognizer.scale = 1//否则每一次的scale会叠乘
        print("pinch pinch")
    }
    //双击
    
    @objc func tap(recognizer:UITapGestureRecognizer){
        if recognizer.state == .recognized {
            //解除子视图与视图的链接
            self.removeFromSuperview()
            print("tap tap")
        }
    }
    //当用户以圆周运动将手指相对移动时，底层视图应该以相应的方向和速度旋转。
    @objc func rotation(recognizer:UIRotationGestureRecognizer){
        let rotation = recognizer.rotation
        self.transform = self.transform.rotated(by: rotation)
        recognizer.rotation = 0
        print("rotation rotation")
    }
    //长按以实现颜色改变
    @objc func longPress(recognizer:UILongPressGestureRecognizer){
        if recognizer.state ==  .began {
            self.color = UIColor.black
            //self.removeFrom
        }
        print("Long Long")
    }
    //轻扫以实现删除
    @objc func swipe(recognizer: UISwipeGestureRecognizer) {
        self.removeFromSuperview()
        print("swipe swipe")
    }
    //重写初始化函数,因为存在自定义需要实现的方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(rect:rect)
        //设置随机颜色
        let redColor = CGFloat(Float(arc4random() % 255) / 255)
        let greenColor = CGFloat(Float(arc4random() % 255) / 255)
        let blueColor = CGFloat(Float(arc4random() % 255) / 255)
        UIColor(red:redColor,green:greenColor,blue:blueColor,alpha:1.0).set()
        path.fill()
        path.stroke()
    }
}
