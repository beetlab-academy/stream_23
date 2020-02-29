//
//  PostDetailsControlle.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

class PostDetailsController {
    var model: PostDetailsModel! // injected
    var post: PresentationPostDetails!
    
    func viewDidLoad() {
        post = model.getPostToDisplay()
    }
    
    func liked() {
        model.toggle(like: !post.isLiked)
        post = model.getPostToDisplay()
    }
}
