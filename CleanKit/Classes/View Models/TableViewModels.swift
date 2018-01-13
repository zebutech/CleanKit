//
//  TableViewModels.swift
//  CleanKit
//
//  Created by Ludovic Riviere on 13/01/2018.
//  Copyright © 2018 ZEBUTECH. All rights reserved.
//

import UIKit

// MARK: - Generic Table View Model

protocol TableViewModel {
    var sections: [TableSectionViewModel] { get set }
    var count: Int { get }
    
    func headerViewModel(_ section: Int) -> TableHeaderViewModel?
    func footerViewModel(_ section: Int) -> TableFooterViewModel?
    
    func numberOfRows(_ section: Int) -> Int
    func row(at indexPath: IndexPath) -> TableRowViewModel
}

extension TableViewModel {
    var count: Int { return sections.count }
    
    func headerViewModel(_ section: Int) -> TableHeaderViewModel? { return sections[section].header }
    func footerViewModel(_ section: Int) -> TableFooterViewModel? { return sections[section].footer }
    
    func numberOfRows(_ section: Int) -> Int { return sections[section].count }
    func row(at indexPath: IndexPath) -> TableRowViewModel { return sections[indexPath.section].dataModel[indexPath.row] }
}

protocol TableSectionViewModel {
    var header: TableHeaderViewModel? { get set }
    var footer: TableFooterViewModel? { get set }
    var dataModel: [TableRowViewModel] { get }
    
    var count: Int { get }
    
    var isExpandable: Bool { get }
    var isExpanded: Bool { get set }
    
    mutating func selectHeaderView()
}

extension TableSectionViewModel {
    var header: TableHeaderViewModel? { return nil }
    var footer: TableFooterViewModel? { return nil }
    var count: Int { return dataModel.count }
    
    var isExpandable: Bool { return false }
    var isExpanded: Bool { get { return true } set {} }
    
    mutating func selectHeaderView() {
        isExpanded = !isExpanded
    }
}

protocol TableHeaderViewModel {
    var rowClass: AnyClass { get }
    var headerHeight: CGFloat { get }
    
    func configure(view: UITableViewHeaderFooterView, isExpanded: Bool?)
}

protocol TableFooterViewModel {
    var rowClass: AnyClass { get }
    var footerHeight: CGFloat { get }
    
    func configure(view: UITableViewHeaderFooterView)
}

protocol TableRowViewModel {
    var rowClass: AnyClass { get }
    var rowHeight: CGFloat { get }
    
    func configure(cell: UITableViewCell)
}
