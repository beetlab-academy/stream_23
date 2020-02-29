//
//  PostDetailsControllerAssembly.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

class PostDetailsControllerAssembly {
    func controller(with model: PostDetailsModel) -> PostDetailsController {
        let controller = PostDetailsController()
        controller.model = model
        return controller
    }
}
