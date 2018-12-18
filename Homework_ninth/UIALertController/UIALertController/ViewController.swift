//
//  ViewController.swift
//  UIALertController
//
//  Created by student on 2018/11/12.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionSheet(_ sender: Any) {
        //定义一个actionsheet
        let alertConntroller = UIAlertController(title: "Action Sheet", message: "This is an action sheet", preferredStyle: .actionSheet)
        //添加button，handle为触发的事件
        alertConntroller.addAction(UIAlertAction(title: "Red", style: .default, handler: {
            action in
            print("This is for background red")
            self.view.backgroundColor = UIColor.red
        }))
        alertConntroller.addAction(UIAlertAction(title: "Yellow", style: .default, handler: { action in
            print("This is for background yellow")
            self.view.backgroundColor = UIColor.yellow
            }))
        alertConntroller.addAction(UIAlertAction(title: "Green", style: .destructive, handler: {
            action in
            print("This is for backgound green")
            self.view.backgroundColor = UIColor.green
        }))
        alertConntroller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
            print("Turn background back to white")
            self.view.backgroundColor = UIColor.white
        }))
        //在界面上呈现action sheet
        self.present(alertConntroller, animated: true, completion: nil)
    }
    
    @IBAction func loginAlert(_ sender: Any) {
        //定义一个alert,preferredStyle是指选择弹出消息时的样式，是Alert还是ActionSheet
        let alertController = UIAlertController(title: "Login", message: "Please input the message below.", preferredStyle: .alert)
        //添加输入框
        alertController.addTextField {(textField) in
            //提示信息
            textField.placeholder = "UserName"
        }
        alertController.addTextField {(textField) in
            textField.placeholder = "Password"
        }
        //定义ok和cancel button
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {action in
            print("UserName:\(alertController.textFields![0].text!),Password:\(alertController.textFields![1].text!)")
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
//            print("UserName:\(alertController.textFields![0].text!),Password:\(alertController.textFields![1].text!)")
//        }))
        //添加button
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        //呈现
        self.present(alertController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

