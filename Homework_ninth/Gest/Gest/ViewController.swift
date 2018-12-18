//
//  ViewController.swift
//  Gest
//
//  Created by student on 2018/11/12.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func addSquare(_ sender: Any) {
        //?设置随机的x,y坐标点
        let x = CGFloat(arc4random()%UInt32(self.view.bounds.width))
        let y = CGFloat(arc4random() % UInt32(self.view.bounds.height-40)) + 40

        //中心点和大小
        let point = CGPoint(x:x,y:y)
        let size = CGSize(width: 15, height: 15)

        let view = MyView(frame:CGRect(origin: point, size: size))
        self.view.addSubview(view)
        
    }
    @IBAction func moveSquare(_ sender: Any) {
        for view in self.view.subviews {
            if view is MyView {
                //?设置随机的x,y坐标点
                let x = CGFloat(arc4random()%UInt32(self.view.bounds.width))
                let y = CGFloat(arc4random() % UInt32(self.view.bounds.height-40)) + 40
                    
                let point = CGPoint(x:x,y:y)
                UIView.animate(withDuration: 3, animations: {view.center = point})
            }
        }
    }
    @IBAction func clearSquare(_ sender: Any) {
        for view in self.view.subviews {
            if view is MyView{
             //切断subview和view之间的链接
             view.removeFromSuperview()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("finished")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

