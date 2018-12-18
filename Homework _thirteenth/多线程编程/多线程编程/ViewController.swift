//
//  ViewController.swift
//  多线程编程
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            self.timerLabel.text = "\(self.count)"
            //打印出多线程
            print("timer thread:\(Thread.current)")
        }.fire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: Any) {
        var sum = 0
//        //多个线程执行
//        for _ in 0...100 {
            //多线程,将代码放入，会自动被找多线程执行
            //封装一个闭包代码段，放入另一个并行的线程执行
            DispatchQueue.global().async {
                print("Run thread:\(Thread.current )")
                for i in 1...9999999 {
                    sum += i
                }
                DispatchQueue.main.async {
                    //UI的操作必须在主线程中进行
                    self.resultLabel.text = "sum:\(sum)"
                }
//            }
        }
    }
}

