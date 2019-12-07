//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Krasa on 30/11/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

struct CollectionViewCellViewModel {
    let titleText: String
    let backgroundColor: UIColor
}

class RoundView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        print("RoundView - \(frame)")
        layer.cornerRadius = frame.size.height / 2
    }
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var containerView: RoundView!
    
    var viewModel: CollectionViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            titleLabel.text = viewModel.titleText
            containerView.backgroundColor = viewModel.backgroundColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("collection view cell = \(containerView.frame)")
    }

}
