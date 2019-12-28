
//
//  User.swift
//  CreditSystems
//
//  Created by Krasa on 28/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import Foundation

struct Passport {
    let number: String
}

struct Work {
    let name: String
    let position: String
}

struct User {
    var phone: String?
    var name: String?
    var secondName: String?
    var passport: Passport?
    var work: Work?
}
