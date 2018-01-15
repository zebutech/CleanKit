//
//  UITableView.swift
//  CleanKit
//
//  Created by Ludovic Riviere on 13/01/2018.
//  Copyright © 2018 ZEBUTECH. All rights reserved.
//

import UIKit

public extension UITableView {
    
    public func registerNibCell(_ cellClass: UITableViewCell.Type) {
        self.register(UINib(nibName: cellClass.identifier, bundle: nil), forCellReuseIdentifier: cellClass.identifier)
    }
    
    public func registerNibHeaderFooterView(_ viewClass: UITableViewHeaderFooterView.Type) {
        self.register(UINib(nibName: viewClass.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: viewClass.identifier)
    }
}

/**
 Extension UITableViewCell that offer
 a reuse identifier which is the name of the class
 */
public extension UITableViewCell {
    /// Default Identifier for reuse
    class var identifier: String {
        return String(describing: self)
    }
}

/**
 Extension UITableViewHeaderFooterView that offer
 a reuse identifier which is the name of the class
 */
public extension UITableViewHeaderFooterView {
    /// Default Identifier for reuse
    class var identifier: String {
        return String(describing: self)
    }
}
