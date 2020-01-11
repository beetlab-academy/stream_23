//
//  CreditCoordinator.swift
//  CreditSystems
//
//  Created by Krasa on 28/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

class ServicesAssembly {
    var bankService: BankService {
        return BankServiceImpl()
    }
    
    var identityService: IdentityService {
        return IdentityServiceImpl()
    }
}

class CoordinatorAssembly {
    private let servicesAssembly = ServicesAssembly()
    
    var coordinator: CreditCoordinator {
        let coordinator = CreditCoordinator()
        coordinator.bankService = servicesAssembly.bankService
        coordinator.identityService = servicesAssembly.identityService
        return coordinator
    }
}

class CreditCoordinator {
    var window: UIWindow?
    var bankService: BankService?
    var identityService: IdentityService?
    
    //-----state-----//
    var startVC: ClientStartController?
    var infoVC: InfoStartController?
    var neededSum = ""
    var passportVC: InfoUserAndPassportController?
    //--------------//
    
    var flowCompleted: (() -> Void)?
    
    func start() {
        
        [1,2,4].firstIn
        if identityService?.tryRecognizeClient() != nil {
            let startVC = vc("ClientStartController") as! ClientStartController
            startVC.output = self
            window?.rootViewController = startVC
            self.startVC = startVC
        } else {
            let infoVC = vc("InfoStartController") as! InfoStartController
            infoVC.output = self
            window?.rootViewController = infoVC
            self.infoVC = infoVC
        }
    }
}

extension CreditCoordinator: InfoStartControllerOutput {
    func sumNeeded(_ sum: String) {
        neededSum = sum
        let uservc = vc("InfoUserAndPassportController") as! InfoUserAndPassportController
        uservc.output = self
        infoVC?.present(uservc, animated: true, completion: nil)
        self.passportVC = uservc
    }
}

extension CreditCoordinator: InfoUserAndPassportControllerOutput {
    func entered(name: String, secondName: String, passport: String) {
        let user = User(phone: neededSum, // должен был быть телефон
                        name: name,
                        secondName: secondName,
                        passport: Passport(number: passport),
                        work: nil) // работа - другой экран!
        
        let finishVC = vc("FinishController") as! FinishController
        finishVC.bankService = bankService
        finishVC.user = user
        finishVC.output = self
        
        passportVC?.present(finishVC, animated: true, completion: nil)
    }
}

extension CreditCoordinator: ClientStartControllerOutput {
    func next() {
        let user = identityService?.tryRecognizeClient()
        let finishVC = vc("FinishController") as! FinishController
        finishVC.bankService = bankService
        finishVC.user = user
        finishVC.output = self

        startVC?.present(finishVC, animated: true, completion: nil)
    }
}

extension CreditCoordinator: FinishControllerOutput {
    func bookVisitTime() {
        flowCompleted?()
    }
}

private extension CreditCoordinator {
    func vc(_ id: String) -> UIViewController {
        let st = UIStoryboard(name: "Main", bundle: nil)
        return st.instantiateViewController(withIdentifier: id)
    }
}
