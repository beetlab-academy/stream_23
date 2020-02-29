//
//  Network.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

protocol Network {
    func load(completion: (Result<Post, Error>) -> Void)
    func like(postId: String)
}

protocol URLSessionProvider {
    var urlSession: URLSession { get }
}

class CustomURLSessionProvider: URLSessionProvider {
    var urlSession: URLSession {
        let conf = URLSessionConfiguration()
        conf.timeoutIntervalForRequest = 10
        return URLSession(configuration: conf)
    }
}

class SharedURLSessionProvider: URLSessionProvider {
    let urlSession = URLSession.shared
}

class NetworkImpl: Network {
    var provider: URLSessionProvider! // injected

    func load(completion: (Result<Post, Error>) -> Void) {
//        provider.urlSession.dataTask(with: URL(string: "")!) { _ in
//
//        }
//        .resume()
    }
    
    func like(postId: String) {
        
    }
}
