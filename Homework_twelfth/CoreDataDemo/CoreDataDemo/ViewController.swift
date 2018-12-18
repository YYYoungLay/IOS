//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by student on 2018/12/14.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfStuNo: UITextField!
    
    //从应用代理获得代理转成自己的代理类型
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //获得上下文
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(NSHomeDirectory())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action
    //取消
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //增加
    @IBAction func addBtn(_ sender: Any) {
        //已经封装了对象，CoreData将数据库中的数据封装成了一个Person对象
        let person = Person(context: context)
        person.name = tfName.text
        person.no = tfStuNo.text
//        appDelegate.saveContext()
        dismiss(animated: true, completion: nil)
        
    }
    //更新
    @IBAction func updateBtn(_ sender: Any) {
        //请求
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言，根据tfName.text中的name来查询
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        //数据库的查询可能会出错，需要用try
        let  persons = try? context.fetch(fetch)
        if let currentPerson = persons?.first {
            currentPerson.no = tfStuNo.text
//            //保存更新后的数据
//            appDelegate.saveContext()
        }
    }
    //删除
    @IBAction func delBtn(_ sender: Any) {
        //请求
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        //数据库的查询可能会出错
        let  persons = try? context.fetch(fetch)
        if let currentPerson = persons?.first {
            currentPerson.no = tfStuNo.text
//            //保存更新后的数据
//            appDelegate.saveContext()
        }
    }
    //查询
    @IBAction func queryBtn(_ sender: Any) {
        //请求
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        //数据库的查询可能会出错
        let  persons = try? context.fetch(fetch)
        if let currentPerson = persons?.first {
            tfStuNo.text = currentPerson.no
        }
    }
}

