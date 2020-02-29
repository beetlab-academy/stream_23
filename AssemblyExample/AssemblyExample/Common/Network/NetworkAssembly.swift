//
//  NetworkAssembly.swift
//  AssemblyExample
//
//  Created by Krasa on 29/02/2020.
//  Copyright © 2020 Nikita Semenov. All rights reserved.
//

import Foundation

class NetworkAssembly {
    var urlSessionProvider: URLSessionProvider {
        return CustomURLSessionProvider()
    }
    
    func network(with provider: URLSessionProvider) -> Network {
        let network = NetworkImpl()
        network.provider = provider
        return network
    }
}
