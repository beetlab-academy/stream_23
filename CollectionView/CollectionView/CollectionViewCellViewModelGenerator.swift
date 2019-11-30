//
//  CollectionViewCellViewModelGenerator.swift
//  CollectionView
//
//  Created by Krasa on 30/11/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import Foundation

extension Array where Element == CollectionViewCellViewModel {
    static func generate() -> [CollectionViewCellViewModel] {
        return [CollectionViewCellViewModel(titleText: "AC",
                                            backgroundColor: .gray),
                CollectionViewCellViewModel(titleText: "+/-",
                                            backgroundColor: .gray),
                CollectionViewCellViewModel(titleText: "%",
                                            backgroundColor: .gray),
                CollectionViewCellViewModel(titleText: "/",
                                            backgroundColor: .orange),
                CollectionViewCellViewModel(titleText: "7",
                                            backgroundColor: .black),
                CollectionViewCellViewModel(titleText: "8",
                                            backgroundColor: .black),
                CollectionViewCellViewModel(titleText: "9",
                                            backgroundColor: .black),
                CollectionViewCellViewModel(titleText: "*",
                                            backgroundColor: .orange)
        ]
    }
}
