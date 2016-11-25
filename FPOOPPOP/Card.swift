//
//  Card.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/25/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import Foundation
import UIKit

class Card {
    let color: UIColor
    let rank: Int
    let suit: Suit
    
    init() {
        self.color = UIColor.black
        self.rank = 1
        self.suit = .heart
    }
}

enum Suit: CustomStringConvertible {
    case spade
    case club
    case heart
    case diamond
    
    var description: String {
        switch self {
        case .spade:
            return "Spade"
        case .club:
            return "Club"
        case .heart:
            return "Heart"
        case .diamond:
            return "Diamond"
        }
    }
}
