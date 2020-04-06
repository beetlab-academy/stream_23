//
//  main.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

print("Hello, World!")


// Scene Delegate

// didFinishLaunching... sceneDidConnect

let vcAssembly = PostsListViewControllerAssembly()
let startVC = vcAssembly.viewController

var x = 5

let d = { [x] in
    x += 5
}

d()

print(x)

// window?.rootViewController = startVC
