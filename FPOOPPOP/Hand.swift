//
//  Hand.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/25/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

class Hand {
    private let deck = Deck()
    private var cards = [Card]()
    
    var numberOfCards: Int {
        return cards.count
    }
    
    func card(at index: Int) -> Card {
        return cards[index]
    }
    
    func addNewCard(at index: Int) {
        insertCard(deck.nextCard(), at: index)
    }
    
    private func insertCard(_ card: Card, at index: Int) {
        cards.insert(card, at: index)
    }
    
    func deleteCard(at index: Int) {
        cards.remove(at: index)
    }
    
    func moveCard(fromAt fromIndex: Int, to toIndex: Int) {
        let cardToMove = cards[fromIndex]
        deleteCard(at: fromIndex)
        insertCard(cardToMove, at: toIndex)
    }
    
}
