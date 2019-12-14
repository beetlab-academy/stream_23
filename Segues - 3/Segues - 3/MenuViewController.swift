//
//  MenuViewController.swift
//  Segues - 3
//
//  Created by Krasa on 14/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBAction func first() {
        let pushed = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "PushedVc")
        navigationController?.pushViewController(pushed, animated: true)
    }
    
    @IBAction func second() {
        let modal = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "modalVC")
        present(modal, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
