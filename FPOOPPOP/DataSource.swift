//
//  DataSource.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/28/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource, SourceType {
    var dataObject: DataType = Hand()
    
    var conditionForAdding: Bool {
        return dataObject.numberOfItems < 5
    }
    
    func addItemTo(tableView: UITableView) {
        if conditionForAdding {
            self.dataObject = dataObject.addNewItem(at: 0)
            insertTopRow(in: tableView)
        }
    }

    // MARK: - UITableView Datasource Delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? CardCell else {
            fatalError("Could not create CardCell")
        }
        
        guard let hand = dataObject as? Hand else {
            fatalError("Could not create Card Cell or Hand instance")
        }
        
        cell.fillWith(card: hand[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.dataObject = dataObject.deleteItem(at: indexPath.row)
            deleteRow(in: tableView, at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.dataObject = dataObject.moveItem(fromAt: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
}
