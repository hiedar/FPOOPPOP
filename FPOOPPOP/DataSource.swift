//
//  DataSource.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/28/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource, SourceType {
    private var hand = Hand()
    
    func addItemTo(tableView: UITableView) {
        if hand.numberOfItems < 5 {
            self.hand = hand.addNewItem(at: 0)
            insertTopRow(in: tableView)
        }
    }

    // MARK: - UITableView Datasource Delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hand.numberOfItems
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
            self.hand = hand.deleteItem(at: indexPath.row)
            deleteRow(in: tableView, at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.hand = hand.moveItem(fromAt: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
}
