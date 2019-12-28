//
//  ClientStartController.swift
//  CreditSystems
//
//  Created by Krasa on 28/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

protocol ClientStartControllerInput {
    var output: ClientStartControllerOutput? { get set }
}

protocol ClientStartControllerOutput {
    func next()
}

class ClientStartController: UIViewController, ClientStartControllerInput {
    var output: ClientStartControllerOutput?
    
    @IBAction func next() {
        output?.next()
    }
}
