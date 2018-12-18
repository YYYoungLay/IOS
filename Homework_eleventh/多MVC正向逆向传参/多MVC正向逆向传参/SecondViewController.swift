//
//  SecondViewController.swift
//  多MVC正向逆向传参
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var stu: Student!
//    var name = ""
//    var no = " "
    
//    var delegate: StudentProtocol?
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tfName.text = stu.name
        tfNo.text = stu.no
        // Do any additional setup after loading the view.
    }

    @IBAction func Close(_ sender: Any) {
        
        stu.no = tfNo.text!
        stu.name = tfName.text!

//        delegate?.change(name: name, no: no)
//        //依赖于FirstViewController不能重用
//        for vc in self.navigationController!.viewControllers {
//            if let firstVC = vc as? FirstViewController {
//                firstVC.no = no
//                firstVC.name = name
//            }
//        }
        
//        dismiss(animated: true, completion: nil)
        //push与pop相对
        navigationController?.popViewController(animated: true)
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
