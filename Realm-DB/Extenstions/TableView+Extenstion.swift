//
//  TableView+Extenstion.swift
//  Realm-DB
//
//  Created by Karem on 6/6/20.
//  Copyright © 2020 Karem. All rights reserved.
//

import UIKit

extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names?[indexPath.row].firstName ?? "No Data"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateData(indexPath: indexPath)
        
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            
            self.deleteDataFromDB(indexPath: indexPath)
        }
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") {  (contextualAction, view, boolValue) in
            self.updateData(indexPath: indexPath)
        }
        editAction.backgroundColor = .purple
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction,editAction])
        
        return swipeActions
    }
    
    
    /*********************************************************************************/
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    
}
