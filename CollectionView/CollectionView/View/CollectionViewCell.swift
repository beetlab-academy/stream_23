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

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    var viewModel: CollectionViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            titleLabel.text = viewModel.titleText
            containerView.backgroundColor = viewModel.backgroundColor
        }
    }
    
    override func layoutSubviews() {
        containerView.layer.cornerRadius = containerView.frame.height / 2
    }

}
