//
//  ViewController.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/25/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import UIKit

class HandVC: UITableViewController {

    private var hand = Hand()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(HandVC.addNewCard(_:)))
        
        self.navigationItem.leftBarButtonItem = editButtonItem //UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(HandVC.addNewCard(_:)))
    }
    
    @IBAction private func addNewCard(_ sender: UIBarButtonItem) {
        if hand.numberOfCards < 5 {
            self.hand = hand.addNewCard(at: 0)
            insertTopRow()
        }
    }
    
    private func insertTopRow() {
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hand.numberOfCards
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath)
        let card = hand.card(at: indexPath.row)
        cell.textLabel?.text = card.rank.description
        cell.textLabel?.textColor = card.suit.color
        cell.detailTextLabel?.text = card.suit.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                self.hand = hand.deleteCard(at: indexPath.row)
                deleteRow(at: indexPath)
            }
    }
    
    private func deleteRow(at indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        hand.moveCard(fromAt: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}

