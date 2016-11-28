//
//  Hand.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/25/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

struct Hand: DataType {
    private var deck: Deck
    private var cards: [Card]
    
    init() {
        self.deck = Deck()
        self.cards = [Card]()
    }
    
    init(deck: Deck, cards: [Card]) {
        self.deck = deck
        self.cards = cards
    }
    
    subscript(index: Int) -> Card {
        return cards[index]
    }
    
    // MARK: - DataType Implementation
    var numberOfItems: Int {
        return cards.count
    }
    
    func addNewItem(at index: Int) -> Hand {
        var mutableCards = cards
        mutableCards.insert(deck.nextCard(), at: index)
        return Hand(deck: deck, cards: mutableCards)
    }
    
    func deleteItem(at index: Int) -> Hand {
        var mutableCards = cards
        mutableCards.remove(at: index)
        return Hand(deck: deck, cards: mutableCards)
    }
    
    func moveItem(fromAt: Int, to: Int) -> Hand {
        return deleteItem(at: fromAt).addNewItem(at: to)
    }
    
}
