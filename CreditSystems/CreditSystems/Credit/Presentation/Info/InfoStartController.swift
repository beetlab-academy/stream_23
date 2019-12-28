//
//  InfoStartController.swift
//  CreditSystems
//
//  Created by Krasa on 28/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

protocol InfoStartControllerInput {
    var output: InfoStartControllerOutput? { get set }
}

protocol InfoStartControllerOutput {
    func sumNeeded(_ sum: String)
}

class InfoStartController: UIViewController, InfoStartControllerInput {
    var output: InfoStartControllerOutput?
    
    @IBOutlet weak var sumTextField: UITextField!
    @IBAction func next() {
        output?.sumNeeded(sumTextField.text!)
    }
}
