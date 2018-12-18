//
//  PersonsTableViewController.swift
//  CoreDataDemo
//
//  Created by student on 2018/12/14.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit
import CoreData
class PersonsTableViewController: UITableViewController {

    //MARK: Outlet
    //从应用代理获得代理转成自己的代理类型
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //获得上下文
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //学生列表
    var persons:[Person]?
    
    //MARK:Action
    //
    fileprivate func reloadData() {
        //找到所有的记录
        let  fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //按照姓名升序排序
        fetch.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        persons = try? context.fetch(fetch)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //??若为空，则给默认值0
        return persons?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        if let currentPerson = persons?[indexPath.row] {
            cell.textLabel?.text = currentPerson.name
            print("currentName:\(String(describing: currentPerson.name))")
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //若storyBoard segue是 showDetail，那么面板就可以确定是Detail information面板
        if segue.identifier == "showDetail" {
            let showDetailVC = segue.destination as! DetailViewController
            //sender 若传的是表格中的数据，那么就是cell，可以让tableView告诉你到底是第几个cell
            //利用sender知道到底选的是哪一个对象
            //sender肯定是一个UITableViewCell，所以可以用as 强转,得到indexPath：那一种cell
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) ,let person = persons?[indexPath.row]{
                print("indexPath:\(indexPath)")
                showDetailVC.person = person
            }
        }
    }
}
