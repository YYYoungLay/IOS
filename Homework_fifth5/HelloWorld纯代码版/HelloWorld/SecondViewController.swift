//
//  SecondViewController.swift
//  HelloWorld
//
//  Created by 509 on 2018/10/18.
//  Copyright © 2018年 2016110346. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.brown
        let imageView = UIImageView(frame:CGRect(x:7,y:150,width:400,height:400))
        imageView.image = UIImage(named: "虎太郎")
        imageView.center = view.center
        view.addSubview(imageView)
        
        let button = UIButton(frame:CGRect(x:100,y:170,width:200,height:20))
        button.setTitle("I am A cool 👦", for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        self.title = "Second"
    }
    @objc func btnClicked(){
        //控制器消失
        presentingViewController?.dismiss(animated: true, completion: nil)
        //
        //navigationController?.pushViewController(SecondViewController(), animated: true)
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
