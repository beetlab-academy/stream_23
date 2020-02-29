//
//  ModelAssembly.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

class ModelAssembly {
    private lazy var networkAssembly = NetworkAssembly()
    private lazy var storageAssembly = StorageAssembly1()
    
    var model: PostListModel {
        let model = PostListModelImpl()
        model.network = networkAssembly
            .network(with: networkAssembly.urlSessionProvider)
        model.storage = storageAssembly.storage(with: model)
        return model
    }
    
    func model(withStorageOutput output: StorageOutput) -> PostListModel {
        let model = PostListModelImpl()
        model.network = networkAssembly
            .network(with: networkAssembly.urlSessionProvider)
        model.storage = storageAssembly.storage(with: output)
        return model
    }
}
