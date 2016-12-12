//
//  DataSource.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/28/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource, SourceType {
    var dataObject: DataType
    
    init<A: DataType>(dataObject: A) {
        self.dataObject = dataObject
    }
    
    var conditionForAdding: Bool {
        return false
    }
    
    func addItemTo(tableView: UITableView) {
        if conditionForAdding {
            self.dataObject = dataObject.addNewItem(at: 0)
            insertTopRow(in: tableView)
        }
    }

    // MARK: - UITableView Datasource Delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("This method must be overriden")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("This method must be overriden")
    }
    
}
