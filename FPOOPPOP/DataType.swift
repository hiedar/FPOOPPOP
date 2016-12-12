//
//  DataType.swift
//  FPOOPPOP
//
//  Created by 檜枝　龍一 on 11/28/16.
//  Copyright © 2016 檜枝　龍一. All rights reserved.
//

import Foundation

protocol DataType {
    var numberOfItems: Int { get }
    
    func addNewItem(at index: Int) -> Self
    func deleteItem(at index: Int) -> Self
    func moveItem(fromAt: Int, to: Int) -> Self
}
