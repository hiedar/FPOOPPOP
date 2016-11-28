//
//  Hand.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/25/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

struct Hand {
    private let deck = Deck()
    private var cards = [Card]()
    
    var numberOfCards: Int {
        return cards.count
    }
    
    func card(at index: Int) -> Card {
        return cards[index]
    }
    
    mutating func addNewCard(at index: Int) {
        insertCard(deck.nextCard(), at: index)
    }
    
    mutating private func insertCard(_ card: Card, at index: Int) {
        cards.insert(card, at: index)
    }
    
    mutating func deleteCard(at index: Int) {
        cards.remove(at: index)
    }
    
    mutating func moveCard(fromAt fromIndex: Int, to toIndex: Int) {
        let cardToMove = cards[fromIndex]
        deleteCard(at: fromIndex)
        insertCard(cardToMove, at: toIndex)
    }
    
}
