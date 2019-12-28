//
//  IdentityService.swift
//  CreditSystems
//
//  Created by Krasa on 28/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import Foundation

protocol IdentityService {
    func tryRecognizeClient() -> User?
}

class IdentityServiceImpl: IdentityService {
    func tryRecognizeClient() -> User? {
        return nil
//        var user = User()
//        let passport = Passport(number: "3456 675087")
//        let work = Work(name: "ООО \"ЕБИОМАТЬ\"", position: "Сотрудник клининга")
//        user.name = "Митрофан"
//        user.phone = "7999877663"
//        user.secondName = "Невеличко"
//        user.passport = passport
//        user.work = work
//
//        return user
    }
}
