//
//  AddToDoViewController.swift
//  kwkfinalproject
//
//  Created by Phoebe Lai on 7/21/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var mondaySwitch: UISwitch!
    @IBOutlet weak var tuesdaySwitch: UISwitch!
    @IBOutlet weak var wednesdaySwitch: UISwitch!
    @IBOutlet weak var thursdaySwitch: UISwitch!
    @IBOutlet weak var fridaySwitch: UISwitch!
    @IBOutlet weak var saturdaySwitch: UISwitch!
    @IBOutlet weak var sundaySwitch: UISwitch!
    @IBOutlet weak var weeklyGoalSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let toDo =  ToDoCD(entity:ToDoCD.entity(), insertInto: context)
        if let titleText = titleTextField.text{
            toDo.name = titleText
            toDo.monday = mondaySwitch.isOn
            toDo.tuesday = tuesdaySwitch.isOn
            toDo.wednesday = wednesdaySwitch.isOn
            toDo.thursday = thursdaySwitch.isOn
            toDo.friday = fridaySwitch.isOn
            toDo.saturday = saturdaySwitch.isOn
            toDo.sunday = sundaySwitch.isOn
            toDo.weeklyGoal = weeklyGoalSwitch.isOn
        }
            try? context.save()
        navigationController?.popViewController(animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
