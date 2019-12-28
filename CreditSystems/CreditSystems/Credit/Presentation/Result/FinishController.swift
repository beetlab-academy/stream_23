//
//  FinishController.swift
//  CreditSystems
//
//  Created by Krasa on 28/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

protocol FinishControllerInput {
    var user: User? { get set }
    var output: FinishControllerOutput? { get set }
}

protocol FinishControllerOutput {
    func bookVisitTime()
}

class FinishController: UIViewController, FinishControllerInput {
    var bankService: BankService?
    var user: User?
    var output: FinishControllerOutput?
    
    @IBOutlet weak var stateTitle: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookButton.alpha = 0
        activityIndicator.startAnimating()
        
        guard let user = user else { return }
        
        nameLabel.text = user.name
        bankService?.uploadApplication(user: user)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.stateTitle.text = "ВАМ ПРЕДВАРИТЕЛЬНО ОДОБРЕНА СУММА!!!!!"
            self.activityIndicator.stopAnimating()
            self.activityIndicator.alpha = 0
            self.bookButton.alpha = 1
        }
    }
    
    @IBAction func book() {
        output?.bookVisitTime()
    }
}
