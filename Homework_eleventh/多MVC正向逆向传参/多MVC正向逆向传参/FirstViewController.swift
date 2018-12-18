//
//  ViewController.swift
//  多MVC正向逆向传参
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit

////依赖于协议
//protocol StudentProtocol {
//    func change(name: String,no: String)
//}

class FirstViewController: UIViewController {
//    func change(name: String, no: String) {
//        self.name = name
//        self.no = no
//    }
//    var name = ""
//    var no = ""
    
    var stu = Student()
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    //只会调用一次
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        tfNo.text! = stu.no
        tfName.text! = stu.name
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showSecondVC(_ sender: Any) {
        stu.no = tfNo.text!
        stu.name = tfName.text!
        
        //从storybord中去恢复文件，而不是在代码中构造
//        let secondVC = SecondViewController()
//        present(secondVC, animated: true, completion: nil)
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC")as!SecondViewController //强转成
//        present(secondVC, animated: true, completion: nil)
        
        //正向传参
//        //在界面显示之前不存在值，并且破坏MVC性质，FirstViewContrller试图控制SecondViewController
//        secondVC.tfNo.text = tfNo.text
//        secondVC.tfName.text = tfName.text
        //no 和 name 是属性
//        secondVC.no = stu.no
//        secondVC.name = stu.name
//        secondVC.delegate = self
        //指向同一个对象，类传引用，FirstViewController与SecondViewControlller用同一个modul
         secondVC.stu = stu
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    @IBAction func showThirdVC(_ sender: Any) {
        //从storybord中去恢复文件，而不是在代码中构造
        //        let secondVC = SecondViewController()
        //        present(secondVC, animated: true, completion: nil)
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "thirdVC")
        present(secondVC, animated: true, completion: nil)
    }
}

