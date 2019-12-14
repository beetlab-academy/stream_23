//
//  ModalViewController.swift
//  Segues - 3
//
//  Created by Krasa on 14/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
