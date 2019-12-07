//
//  ViewController2.swift
//  Drink Up
//
//  Created by Krasa on 07/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var label: UILabel!
    var labelText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
    }
}
