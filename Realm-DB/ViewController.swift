//
//  ViewController.swift
//  Realm-DB
//
//  Created by Karem on 6/5/20.
//  Copyright © 2020 Karem. All rights reserved.

/// Let's do simple crud operation's

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    //Data Array
    var names: Results<Data>?
    
    //Realm refrence
    let realm = try! Realm()
    
    @IBOutlet weak var textFieldHolder: UITextField!
    
    @IBOutlet weak var dataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetch data from DB
        fetchData()
    }
    
    
    
    @IBAction func addDataBtn(_ sender: Any) {
        saveData(userName: textFieldHolder.text!, usweLastName: "New", age: 100)
    }
    
    func saveData(userName:String,usweLastName:String,age:Int){
        //ref from DB class
        let data = Data()
        
        data.firstName = userName
        data.lastName = usweLastName
        data.age = age
        
        realm.beginWrite()
        realm.add(data)
        try! realm.commitWrite()
        
        dataTableView.reloadData()
    }
    func fetchData(){
       
        names = realm.objects(Data.self)
        dataTableView.reloadData()
        
    }
    func deleteDataFromDB(indexPath: IndexPath){
        if let user = names?[indexPath.row] {
            
            do {
                
                try realm.write {
                    realm.delete(user)
                    fetchData()
                }
                
            }catch {
                print("couldn't delete item")
            }
            
        }
        
    }
    func updateData(indexPath: IndexPath){
        
        
        
        var updatedTextField = UITextField()
        
        let alert = UIAlertController(title: "Update Name", message: "", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Update Name"
            updatedTextField = alertTextField
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            
        }
        
        
        
        let action = UIAlertAction(title: "Update Name", style: .default) { (action) in
            if let userName = self.names?[indexPath.row] {
                do {
                    try self.realm.write{
                        userName.firstName = updatedTextField.text!
                        self.fetchData()
                    }
                }catch {
                    print("Couldnt update item")
                }
            }
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
}



