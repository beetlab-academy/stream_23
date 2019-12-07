//
//  ViewController.swift
//  CollectionView
//
//  Created by Krasa on 30/11/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

enum Operation {
    case digit(Int)
    case plus
}

protocol Calc {
    func process( _ op: Operation) -> String
}

class Model {
    var calc: Calc?
    var models = [Operation]()
}

class ViewControllerViewModel {
    var model: Model!
    
    var count: Int {
        return model.models.count
    }
    
    func viewModel(at: IndexPath) -> CollectionViewCellViewModel {
        let opModel = model.models[at.item]
        var title = ""
        var bgColor = UIColor.clear
        
        switch opModel {
        case .digit(let value):
            title = "\(value)"
            bgColor = .orange
        case .plus:
            title = "+"
            bgColor = .black
        }
        
        return CollectionViewCellViewModel(titleText: title, backgroundColor: bgColor)
    }
    
    func didSelect(at: IndexPath) -> String {
        let op = model.models[at.item]
        return model.calc?.process(op) ?? "sdjvneworbv"
    }
}

class ViewController: UIViewController {
    var viewModel: ViewControllerViewModel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! CollectionViewCell
        cell.viewModel = viewModel.viewModel(at: indexPath)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelect(at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width / 4)
        print("size - \(size)")
        return CGSize(width: size, height: size)
    }
}

