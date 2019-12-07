//
//  ViewController.swift
//  Drink Up
//
//  Created by Krasa on 07/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    var isTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTapped() {
        isTapped = true
    }
    
    @IBAction func хуй (_ пизда: UIStoryboardSegue) {
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextController = segue.destination as? ViewController2 else { return }
        
        let randomString = UUID().uuidString
        let inputString = inputTextField.text  ?? "нихуя \(isTapped)"
        
        // путь пидора
        // nextController.loadViewIfNeeded() // принудительно загружаем вью
        
        // путь нормального
        nextController.labelText = inputString + " \(isTapped)"
        
        //nextController.label.text = randomString
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        /*вызывется при нажатии на enter*/
        textField.resignFirstResponder()
        return true
    }
}
