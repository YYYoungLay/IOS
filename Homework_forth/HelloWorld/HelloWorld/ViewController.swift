//
//  ViewController.swift
//  HelloWorld
//
//  Created by 509 on 2018/10/17.
//  Copyright © 2018年 2016110346. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.orange
        
        //创建lable
        let lable = UILabel(frame:CGRect(x:200,y:200,width:400,height:150))
        lable.text = "Hi There!"
        lable.backgroundColor = UIColor.white
        lable.textAlignment = .center
        lable.center = view.center
        //添加lable到视图中去，否则在视图中看不见
        view.addSubview(lable)
        
        //添加button
        let button = UIButton(frame:CGRect(x:70,y:200,width:300,height:100))
        button.setTitle("Cool Boys Never Sleep!!!", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        //添加button到视图中去
        view.addSubview(button)
        //为button添加发射功能，参数1（发射对象），参数2（方法的封装），参数3（事件）
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        self.title = "First"
    }
    //实现button click的相应
    @objc func btnClicked(){
        //subviews指view的继承，在这里的lable和button。.first即是lable，强转为UILable之后在赋值
        if let lable = view.subviews.first as?UILabel{
            lable.text = "OK,I am Going To SLEEP NOW...."
        }
//        //切换到SecondViewController控制器
//         present(SecondViewController(), animated: true, completion: nil)
        //daohan
        self.navigationController?.present(SecondViewController(), animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

