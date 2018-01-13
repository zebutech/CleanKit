//
//  UICollectionView.swift
//  CleanKit
//
//  Created by Ludovic Riviere on 13/01/2018.
//  Copyright © 2018 ZEBUTECH. All rights reserved.
//

import UIKit

extension UICollectionReusableView {
    /// Default Identifier for reuse
    class var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    
    func registerNibReusableView(_ reusableViewClass: UICollectionReusableView.Type, ofKind kind: String) {
        self.register(UINib(nibName: reusableViewClass.identifier, bundle: nil), forSupplementaryViewOfKind: kind, withReuseIdentifier: reusableViewClass.identifier)
    }
    
    func registerNibCell(_ cellClass: UICollectionViewCell.Type) {
        self.register(UINib(nibName: cellClass.identifier, bundle: nil), forCellWithReuseIdentifier: cellClass.identifier)
    }
}
