//
//  ToDTableViewController.swift
//  kwkfinalproject
//
//  Created by Phoebe Lai on 7/21/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import UIKit


class ToDTableViewController: UITableViewController {
    var toDos : [ToDoCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getToDos()

    }
    override func viewWillAppear(_ animated:Bool){
        getToDos()
    }
    
    func getToDos(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
        
                    toDos = coreDataToDos
                    tableView.reloadData()
        
            }
        }
    }

    

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let toDo = toDos[indexPath.row]
        
    
        if let name = toDo.name {
            if toDo.monday{
                cell.textLabel?.text = "❤️Monday : " + name
            }else{
                cell.textLabel?.text = toDo.name
            }
            
            if toDo.tuesday{
                cell.textLabel?.text = "🧡Tuesday : " + name
            }else{
                cell.textLabel?.text = toDo.name
            }
            
            if toDo.wednesday{
                cell.textLabel?.text = "💛Wednesday : " + name
            }else{
                cell.textLabel?.text = toDo.name
            }
            
            if toDo.thursday{
                cell.textLabel?.text = "💚Thursday : " + name
            }else{
                cell.textLabel?.text = toDo.name
            }
            
            if toDo.friday{
                cell.textLabel?.text = "💙Friday : " + name
            }else{
                cell.textLabel?.text = toDo.name
            }
            
            if toDo.saturday{
                cell.textLabel?.text = "💜Saturday : " + name
            }else{
                cell.textLabel?.text = toDo.name
            }
            
            if toDo.sunday{
                cell.textLabel?.text = "🤍Sunday : " + name
            }else{
                cell.textLabel?.text = toDo.name
            }
            
            if toDo.weeklyGoal{
                cell.textLabel?.text = "🤎Weekly Goal : " + name
            }else{
                cell.textLabel?.text = toDo.name
            }
        // Configure the cell...
    }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        if let addVC = segue.destination as? AddToDoViewController{
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompleteToDoViewController{
            if let toDo = sender as? ToDoCD {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
