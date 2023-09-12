//
//  String.swift
//  ShopApp
//
//  Created by AnvarSaidov on 3.09.23.
//

import Foundation

extension String {
    func validateString(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    func localize(tableName: String = "Localizable") -> String {
        NSLocalizedString(self, tableName: tableName, value: "***\(self)***", comment: "")
    }
}
