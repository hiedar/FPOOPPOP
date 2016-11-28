//
//  SourceType.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/28/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

protocol SourceType: UITableViewDataSource {
    func insertTopRow(in tableView: UITableView)
    func deleteRow(in tableView: UITableView, at indexPath: IndexPath)
}

extension SourceType {
    func insertTopRow(in tableView: UITableView) {
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
    }
    
    func deleteRow(in tableView: UITableView, at indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
