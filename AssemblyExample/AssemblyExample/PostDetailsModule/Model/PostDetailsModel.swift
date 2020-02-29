//
//  PostDetailsModel.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

protocol PostDetailsModel {
    func getPostToDisplay() -> PresentationPostDetails
    func toggle(like: Bool)
}

class PostDetailsModelImpl: PostDetailsModel {
    var storage: Storage!// injected
    var postId: String!// injected
    
    func getPostToDisplay() -> PresentationPostDetails {
        return PresentationPostDetails(url: URL(string: "")!,
                                       isLiked: false)
    }
    
    func toggle(like: Bool) {
        storage.like(id: postId, liked: like)
    }
}
