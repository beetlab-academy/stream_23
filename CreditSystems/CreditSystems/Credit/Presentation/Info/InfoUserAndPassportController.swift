//
//  InfoUserAndPassportController.swift
//  CreditSystems
//
//  Created by Krasa on 28/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

protocol InfoUserAndPassportControllerInput {
    var output: InfoUserAndPassportControllerOutput? { get set }
}

protocol InfoUserAndPassportControllerOutput {
    func entered(name: String, secondName: String, passport: String)
}

class InfoUserAndPassportController: UIViewController, InfoUserAndPassportControllerInput {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var passportTextField: UITextField!
    
    var output: InfoUserAndPassportControllerOutput?
    
    @IBAction func next() {
        output?.entered(name: nameTextField.text!,
                        secondName: secondNameTextField.text!,
                        passport: passportTextField.text!)
    }
}
