//
//  ViewController.swift
//  HoleStatsPicker
//
//  Created by John DaCorte on 10/29/21.
//

import UIKit

var cnt = 0
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var puttsLabel: UILabel!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var fwyLabel: UILabel!

    override func viewDidLoad() {
        print ("override function")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myPickerView.selectRow(1, inComponent: 0, animated: true)
        myPickerView.selectRow(3, inComponent: 1, animated: true)
        myPickerView.selectRow(2, inComponent: 2, animated: true)
        myPickerView.selectRow(0, inComponent: 3, animated: true)
        myPickerView.backgroundColor = .yellow
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return myDatabase.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myDatabase[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myDatabase[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (cnt % 2 == 0) {
            myPickerView.backgroundColor = .white
        }
        else {
            myPickerView.backgroundColor = .yellow
        }
        cnt += 1
        print ("component: \(component) row: \(row)")
        switch (component){
        case 0:
            holeLabel.text = myDatabase[component][row]
        case 1:
            scoreLabel.text = myDatabase[component][row]
        case 2:
            puttsLabel.text = myDatabase[component][row]
        case 3:
            fwyLabel.text = myDatabase[component][row]
        default:
            break
        }
    }
    

    // The array below represents what will be shown in the picker scrolls
    // Each line of the array represents what the pickerView calls a component
    // Each element of the component is what the pikcerView calls a row
    // The array below represents a picker with 4 components [0-3] and each component has
    // a different number of rows.
    // The first compoonent has 18 [0-17] rows.
    // The fourth component has two rows
    // e.g. the first "4" in the first line is component 0 (first line) and row 3
    var myDatabase = [
        ["1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"],
       ["1","2","3","4","5","6","7","8","9"],
       ["0", "1","2","3","4","5"],
       ["Test", "M","H"]]
    


}

