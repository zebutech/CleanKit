//
//  PickerViewModels.swift
//  CleanKit
//
//  Created by Ludovic Riviere on 13/01/2018.
//  Copyright © 2018 ZEBUTECH. All rights reserved.
//

import UIKit

public let UIPickerViewAutomaticDimension: CGFloat = -1.0

// MARK: - Generic Picker View Model

public protocol PickerViewModel {
    var components: [PickerComponentViewModel] { get set }
    var count: Int { get }
    
    func numberOfRows(for component: Int) -> Int
    func row(at row: Int, inComponent component: Int) -> PickerRowViewModel
}

public extension PickerViewModel {
    var count: Int { return components.count }
    
    func numberOfRows(for component: Int) -> Int { return components[component].count }
    func row(at row: Int, inComponent component: Int) -> PickerRowViewModel { return components[component].dataModel[row] }
}

public protocol PickerComponentViewModel {
    var dataModel: [PickerRowViewModel] { get }
    var count: Int { get }
    
    func width(`in` pickerView: UIPickerView) -> CGFloat
}

public extension PickerComponentViewModel {
    var count: Int { return dataModel.count }
    
    func width(in pickerView: UIPickerView) -> CGFloat { return UIPickerViewAutomaticDimension }
}

public protocol PickerRowViewModel {
    var title: String { get set }
}
