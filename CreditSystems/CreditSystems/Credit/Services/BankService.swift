//
//  BankServicd.swift
//  CreditSystems
//
//  Created by Krasa on 28/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import Foundation

protocol BankService {
    func uploadApplication(user: User)
}

class BankServiceImpl: BankService {
    func uploadApplication(user: User) {
        print("загружаю персональные данные")
    }
}
