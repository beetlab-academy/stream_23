//
//  PostDetailsModelAssembly.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

class PostDetailsModelAssembly {
    private lazy var storageAssembly = StorageAssembly1()
    
    func model(withPostId postId: String) -> PostDetailsModel {
        let model = PostDetailsModelImpl()
        model.storage = storageAssembly.storage(with: nil)
        return model
    }
}
