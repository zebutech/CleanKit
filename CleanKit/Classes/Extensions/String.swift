//
//  String.swift
//  CleanKit
//
//  Created by Ludovic Riviere on 13/01/2018.
//  Copyright © 2018 ZEBUTECH. All rights reserved.
//

import Foundation

public extension String {
    
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    public func firstUppercased() -> String {
        return String(self.prefix(1)).uppercased() + String(self.dropFirst())
    }
}
