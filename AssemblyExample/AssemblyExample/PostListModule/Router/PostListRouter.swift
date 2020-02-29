//
//  PostListRouter.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

class NavigationController {
    func push() {
        
    }
}

protocol PostListRouter {
    func push(in: NavigationController, postId: String)
}

class PostListRouterImpl: PostListRouter {
    func push(in nc: NavigationController, postId: String) {
        let postDetailsModelAssembly = PostDetailsModelAssembly()
        let controllerAssembly = PostDetailsControllerAssembly()
        
        let controller = controllerAssembly.controller(with: postDetailsModelAssembly.model(withPostId: postId))
        
        nc.push()
    }
}
