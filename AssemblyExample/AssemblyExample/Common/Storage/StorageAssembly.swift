//
//  StorageAssembly.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

class StorageAssembly {
    func storage(with output: StorageOutput?) -> Storage {
        let storage = StorageImpl()
        storage.output = output
        return storage
    }
}

class StorageAssembly1 {
    private static let storage = StorageImpl()
    
    func storage(with output: StorageOutput?) -> Storage {
        StorageAssembly1.storage.output = output
        return StorageAssembly1.storage
    }
}
