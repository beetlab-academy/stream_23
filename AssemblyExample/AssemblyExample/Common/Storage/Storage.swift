//
//  Storage.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

protocol StorageOutput {
    func collectionChanged(collection: [StoragePost])
}

protocol Storage {
    var output: StorageOutput? { get set }
    
    func store(obj: StoragePost)
    func load() -> [StoragePost]
    func like(id: String, liked: Bool)
}

class StorageImpl: Storage {
    var output: StorageOutput?
    
    func store(obj: StoragePost) {
        
    }
    
    func load() -> [StoragePost] {
        return []
    }
    
    func like(id: String, liked: Bool) {
        //
        output?.collectionChanged(collection: [StoragePost]())
    }
}
