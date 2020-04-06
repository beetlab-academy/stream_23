//
//  InfoCell.swift
//  TableViews
//
//  Created by nikita on 06/04/2020.
//  Copyright © 2020 Wheely. All rights reserved.
//

import UIKit

struct InfoCellViewModel {
    let title: String
    let subtitle: String
}

class InfoCell: UITableViewCell {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let calculatedSize = super.sizeThatFits(size)
        
        print("размер ебиомать - \(calculatedSize)")
        
        return calculatedSize
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        let calculatedSize = super.systemLayoutSizeFitting(targetSize)
        
        print("размер ебиомать - \(calculatedSize)")
        
        return calculatedSize
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize,
                                          withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                          verticalFittingPriority: UILayoutPriority) -> CGSize {
        let calculatedSize = super.systemLayoutSizeFitting(targetSize,
                                                           withHorizontalFittingPriority: horizontalFittingPriority,
                                                           verticalFittingPriority:    verticalFittingPriority)
        
        print("размер ебиомать - \(calculatedSize)")
        
        return CGSize(width: calculatedSize.width, height: 1088)

    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.required,
                                                      for: .vertical)
        label.setContentHuggingPriority(.required,
                                        for: .vertical)
        addSubview(label)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel: InfoCellViewModel! {
        didSet {
            titleLabel.text = viewModel.title
            subtitleLabel.text = viewModel.subtitle
        }
    }
}

private extension InfoCell {
    func applyConstraints() {
        // как деды воевали
//        let constraint1 = NSLayoutConstraint(item: titleLabel,
//                                            attribute: .leading,
//                                            relatedBy: .equal,
//                                            toItem: self.layoutMargins,
//                                            attribute: .leading,
//                                            multiplier: 1,
//                                            constant: 0)
//
//        let constraint2 = NSLayoutConstraint(item: titleLabel,
//                                            attribute: .top,
//                                            relatedBy: .equal,
//                                            toItem: self.layoutMargins,
//                                            attribute: .top,
//                                            multiplier: 1,
//                                            constant: 0)
//
//        constraint1.isActive = true
//        constraint2.isActive = true
//
//        NSLayoutConstraint.activate([
//            constraint1,
//            constraint2
//        ])
//
//
        // мы
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -12),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
