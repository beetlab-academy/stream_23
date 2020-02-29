//
//  PostsListViewControllerAssembly.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

class PostsListViewControllerAssembly {
    private lazy var modelAssembly = ModelAssembly()
    
    func viewController(withModel model: PostListModel) -> PostsListViewController {
        let controller = PostsListViewController()
        controller.model = model
        controller.router = router
        return controller
    }
    
    var viewController: PostsListViewController {
        let controller = PostsListViewController()
        controller.model = modelAssembly.model
        controller.router = router
        return controller
    }
    
    var router: PostListRouter {
        return PostListRouterImpl()
    }
}
