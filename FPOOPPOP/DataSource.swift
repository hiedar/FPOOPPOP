//
//  DataSource.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/28/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    private var hand = Hand()
    
    func addItemTo(tableView: UITableView) {
        if hand.numberOfCards < 5 {
            self.hand = hand.addNewCard(at: 0)
            insertTopRow(in: tableView)
        }
    }

    // MARK: - UITableView Datasource Delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hand.numberOfCards
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? CardCell else {
            fatalError("Could not create CardCell")
        }
        cell.fillWith(card: hand[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.hand = hand.deleteCard(at: indexPath.row)
            deleteRow(in: tableView, at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.hand = hand.moveCard(fromAt: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    // MARK: - Private
    private func insertTopRow(in tableView: UITableView) {
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
    }
    
    private func deleteRow(in tableView: UITableView, at indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

}
