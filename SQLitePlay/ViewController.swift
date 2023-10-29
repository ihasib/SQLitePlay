//
//  ViewController.swift
//  SQLitePlay
//
//  Created by S. M. Hasibur Rahman on 27/10/23.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red

//        do {

//            let userTable = Table("Users")
//            let tableCreationStatementString = userTable.create { tableBuilder in
//                tableBuilder.column(Expression<String>("name"), primaryKey: true)
//                tableBuilder.column(Expression<String>("roll"))
//            }
//            try db.run(tableCreationStatementString)
//            
//            
//            //MARK: insert
//            let insertStatementString = userTable.insert(Expression<String>("name") <- "Hasib", Expression<String>("roll") <- "123069")
//            let insertStatementString2 = userTable.insert(Expression<String>("name") <- "Hasib2", Expression<String>("roll") <- "123069")
//            var ins = try db.run(insertStatementString)
//            ins = try db.run(insertStatementString2)
//            
//            
//    
//            
//            var userHasib = userTable.filter(Expression<String>("name") == "Hasib")
//            
//            //MARK: update
////            try userTable.update(Expression<String>("name") <- "Hasib", Expression<String>("roll") <- "123070"))
//            let updateStatementString = userHasib.update(Expression<String>("roll") <- Expression<String>("roll").replace("69", with: "70"))
//            try db.run(updateStatementString)
//            
//            
//            //MARK: delete
//            let deleteStatementString = userHasib.delete()
//            try db.run(deleteStatementString)
//            
//            print("---->"+dbFileUrl.path+" DB creation successful")
//        } catch {
//            print(error.localizedDescription)
//        }
    }
    
    

}



