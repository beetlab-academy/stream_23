//
//  PostListModel.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

protocol PostListModelOutput {
    func collectionChanged(collection: [PresentationPost])
}

protocol PostListModel {
    var output: PostListModelOutput? { get set }
    
    func getPosts(completion: ([PresentationPost]) -> Void)
}

class PostListModelImpl: PostListModel {
    var network: Network! // injected
    var storage: Storage! // injected
    var output: PostListModelOutput?
    
    
    func getPosts(completion: ([PresentationPost]) -> Void) {
        network.load { _ in
            self.storage.store(obj: StoragePost(url: "", id: ""))
        }
    }
}

extension PostListModelImpl: StorageOutput {
    func collectionChanged(collection: [StoragePost]) {
        output?.collectionChanged(collection: collection.map {_ in PresentationPost()})
    }
}
