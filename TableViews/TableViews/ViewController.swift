//
//  ViewController.swift
//  TableViews
//
//  Created by nikita on 06/04/2020.
//  Copyright © 2020 Wheely. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var vms = [InfoCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(InfoCell.self, forCellReuseIdentifier: "InfoCell")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        vms = Array.init(repeating:
            InfoCellViewModel(title: "ХУЙ",
                              subtitle: "Коронавирус передаётся не только воздушно-капельным, но и половым путём"), count: 2000)

        tableView.dataSource = self
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoCell
        cell.viewModel = vms[indexPath.row]
        
        return cell
    }
}


