//
//  Exercise.swift
//  Unwind_v3
//
//  Created by Hugo de Groot on 14/10/2021.
//

import Foundation

enum Exercise {
    case breatheIn, breatheOut
    
    var title: String {
        switch self {
        case .breatheIn:
            return "adem in".localized
        case .breatheOut:
            return "adem uit".localized
        }
    }
    
    var description: String {
        switch self {
        case .breatheIn:
            return "door je neus".localized
        case .breatheOut:
            return "door je mond".localized
        }
    }
}
