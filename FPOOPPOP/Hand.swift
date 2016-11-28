//
//  Hand.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/25/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

struct Hand {
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
    
    var numberOfCards: Int {
        return cards.count
    }
    
    subscript(index: Int) -> Card {
        return cards[index]
    }
    
    func addNewCard(at index: Int) -> Hand {
        return insertCard(deck.nextCard(), at: index)
    }
    
    private func insertCard(_ card: Card, at index: Int) -> Hand {
        var mutableCards = cards
        mutableCards.insert(card, at: index)
        return Hand(deck: deck, cards: mutableCards)
    }
    
    func deleteCard(at index: Int) -> Hand {
        var mutableCards = cards
        mutableCards.remove(at: index)
        return Hand(deck: deck, cards: mutableCards)
    }
    
    func moveCard(fromAt fromIndex: Int, to toIndex: Int) -> Hand {
        return deleteCard(at: fromIndex).insertCard(cards[fromIndex], at: toIndex)
    }
    
}
