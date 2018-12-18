//
//  DetailViewController.swift
//  CoreDataDemo
//
//  Created by student on 2018/12/14.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK:Outlet
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbNo: UILabel!
    
    //传过来的值，传过来的Model
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbName.text = person?.name
        lbNo.text = person?.no
        
        // Do any additional setup after loading the view.
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
    }
    */
}


