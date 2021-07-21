//
//  CompleteToDoViewController.swift
//  kwkfinalproject
//
//  Created by Phoebe Lai on 7/21/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
var previousVC = ToDTableViewController ()
    var selectedToDo : ToDoCD?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = selectedToDo?.name

        // Do any additional setup after loading the view.
    }
    

    @IBAction func completeTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let theToDo = selectedToDo{
                context.delete(theToDo)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    /*


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
