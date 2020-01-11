//
//  ViewController.swift
//  Modular
//
//  Created by Krasa on 11/01/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import UIKit
import StorageSystems

class ViewController: UIViewController {

    @IBAction func test() {
        let assembly = CoordinatorAssembly()
        let vc = assembly.coordinator.startVC()
        present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }


}

