//
//  CollectionViewModels.swift
//  CleanKit
//
//  Created by Ludovic Riviere on 13/01/2018.
//  Copyright © 2018 ZEBUTECH. All rights reserved.
//

import UIKit

// MARK: - Generic Collection View Model

public protocol CollectionViewModel {
    var sections: [CollectionSectionViewModel] { get set }
    var count: Int { get }
    
    func headerViewModel(_ section: Int) -> CollectionHeaderViewModel?
    func footerViewModel(_ section: Int) -> CollectionFooterViewModel?
    
    func numberOfRows(_ section: Int) -> Int
    func row(at indexPath: IndexPath) -> CollectionRowViewModel
}

public extension CollectionViewModel {
    var count: Int { return sections.count }
    
    func headerViewModel(_ section: Int) -> CollectionHeaderViewModel? { return sections[section].header }
    func footerViewModel(_ section: Int) -> CollectionFooterViewModel? { return sections[section].footer }
    func numberOfRows(_ section: Int) -> Int { return sections[section].count }
    func row(at indexPath: IndexPath) -> CollectionRowViewModel { return sections[indexPath.section].dataModel[indexPath.row] }
}

public protocol CollectionSectionViewModel {
    var header: CollectionHeaderViewModel? { get }
    var footer: CollectionFooterViewModel? { get }
    var dataModel: [CollectionRowViewModel] { get }
    
    var count: Int { get }
}

public extension CollectionSectionViewModel {
    var count: Int { return dataModel.count }
    var header: CollectionHeaderViewModel? { return nil }
    var footer: CollectionFooterViewModel? { return nil }
}

public protocol CollectionHeaderViewModel {
    var rowClass: AnyClass { get }
    
    func headerSize(inParent bounds: CGRect) -> CGSize
    func configure(view: UICollectionReusableView)
}

public extension CollectionHeaderViewModel {
    func headerSize(inParent bounds: CGRect) -> CGSize { return .zero }
}

public protocol CollectionFooterViewModel {
    var rowClass: AnyClass { get }
    
    func footerSize(inParent bounds: CGRect) -> CGSize
    func configure(view: UICollectionReusableView)
}

public extension CollectionFooterViewModel {
    func footerSize(inParent bounds: CGRect) -> CGSize { return .zero }
}

public protocol CollectionRowViewModel {
    var rowClass: AnyClass { get }
    
    func rowSize(inParent bounds: CGRect) -> CGSize
    func configure(cell: UICollectionViewCell)
}

public extension CollectionRowViewModel {
    func rowSize(inParent bounds: CGRect) -> CGSize { return .zero }
}
