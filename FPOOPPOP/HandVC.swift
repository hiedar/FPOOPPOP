//
//  ViewController.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/25/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

class HandVC: UITableViewController {
    private let dataSource = HandDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(HandVC.addNewCard(_:)))
        self.navigationItem.leftBarButtonItem = editButtonItem
        
        tableView.dataSource = dataSource
    }
    
    @IBAction private func addNewCard(_ sender: UIBarButtonItem) {
        dataSource.addItemTo(tableView: tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

