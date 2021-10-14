//
//  String.swift
//  Unwind_v3
//
//  Created by Hugo de Groot on 14/10/2021.
//

import Foundation

extension String {
var localized: String {
        let couldntFindKey = "couldntFindKey"
        let localizedSelf = NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: couldntFindKey, comment: "")
        guard localizedSelf != couldntFindKey else {
            if let path = Bundle.main.path(forResource: "Lokalise", ofType: "bundle"), let lokaliseBundle = Bundle(path: path) {
                return NSLocalizedString(self, tableName: nil, bundle: lokaliseBundle, value: "", comment: "")
            }
            return self
        }
        return localizedSelf
    }
}
