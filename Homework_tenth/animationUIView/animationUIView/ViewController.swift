//
//  ViewController.swift
//  animationUIView
//
//  Created by student on 2018/11/27.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    var yourView: UIView!
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (mytimer) in
//            self.myView.center.x += 10
//        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    //改变视图位置
    @IBAction func LocationClicked(_ sender: Any) {
        //每次移动5
        let x = 10
        UIView.animate(withDuration: 2, delay: 0, options: .autoreverse, animations: {
            self.myView.frame = CGRect(x: CGFloat(x + 5), y: CGFloat(x + 5), width: self.myView.bounds.width, height: self.myView.bounds.height)})
    }
    @IBAction func sizeClicked(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0, options: .autoreverse, animations: {
            self.myView.frame = CGRect(x: self.myView.bounds.maxX, y: self.myView.bounds.maxY, width: self.myView.bounds.width+5, height: self.myView.bounds.height+5)})
    }
    // 改变视图transform
    @IBAction func transformClicked(_ sender: Any) {
        timer?.invalidate()
        UIView.animate(withDuration: 2, delay: 0, options: .autoreverse, animations: {
            //旋转180
            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            //旋转回去
            self.myView.transform = CGAffineTransform.identity
        })
    }
    @IBAction func changeColorClicked(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0, options: .autoreverse, animations: {
            self.myView.backgroundColor = UIColor.black
        })
    }
    @IBAction func changeViewClicked(_ sender: Any) {
        self.yourView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.yourView.backgroundColor = UIColor.green
        self.view.addSubview(yourView)
        UIView.transition(from: myView, to: yourView, duration: 2, options: [.transitionCurlUp], completion: nil)
    }
    var animator: UIDynamicAnimator!
    
    var gravity = UIGravityBehavior()
    var collsion = UICollisionBehavior()

    @IBAction func addClicked(_ sender: Any) {
        //重力参考界限
            animator = UIDynamicAnimator(referenceView: self.view)
        //添加物理行为
        animator.addBehavior(gravity)
        animator.addBehavior(collsion)
        collsion.translatesReferenceBoundsIntoBoundary = true
        let x = CGFloat(arc4random() % (UInt32(self.view.frame.width) - 50))
        let pic = UIView(frame: CGRect(x: x, y: 20, width: 50, height: 50))
        pic.backgroundColor = UIColor.red
        self.view.addSubview(pic)

        self.gravity.addItem(pic)
        self.collsion.addItem(pic)
    }
}

