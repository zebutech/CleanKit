//
//  UICollectionView.swift
//  CleanKit
//
//  Created by Ludovic Riviere on 13/01/2018.
//  Copyright © 2018 ZEBUTECH. All rights reserved.
//

import UIKit

public extension UICollectionReusableView {
    /// Default Identifier for reuse
    public class var identifier: String {
        return String(describing: self)
    }
}

public extension UICollectionView {
    
    public func registerNibReusableView(_ reusableViewClass: UICollectionReusableView.Type, ofKind kind: String) {
        self.register(UINib(nibName: reusableViewClass.identifier, bundle: nil), forSupplementaryViewOfKind: kind, withReuseIdentifier: reusableViewClass.identifier)
    }
    
    public func registerNibCell(_ cellClass: UICollectionViewCell.Type) {
        self.register(UINib(nibName: cellClass.identifier, bundle: nil), forCellWithReuseIdentifier: cellClass.identifier)
    }
}
