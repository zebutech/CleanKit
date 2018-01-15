//
//  CleanSwift.swift
//  CleanKit
//
//  Created by Ludovic Riviere on 13/01/2018.
//  Copyright © 2018 ZEBUTECH. All rights reserved.
//

import UIKit

/// Protocol Interactor
public protocol Interactor {
    associatedtype Presenter
    var presenter: Presenter { get set }
}

/// Protocol Presenter
public protocol Presenter {
    associatedtype VC: UIViewController
    weak var viewController: VC? { get set }
}

/// extension Presenter
///
/// Will extend the presenter protocol to add functionnality
///
public extension Presenter where VC: VIPController {
    typealias ViewModel = VC.ViewModel
    func present(viewModel: ViewModel) {
        viewController?.layout(model: viewModel)
    }
    
}

/// Protocol VIPController
///
/// Need to be implemented by all scenes
///
public protocol VIPController {
    associatedtype Interactor
    associatedtype ViewModel
    var interactor: Interactor { get set }
    func layout(model: ViewModel)
}

/// extension VIP
///
/// Connect interactor, presenter and ViewModel
///
public extension VIPController { }
