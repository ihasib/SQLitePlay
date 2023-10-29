//
//  DbManager.swift
//  SQLitePlay
//
//  Created by S. M. Hasibur Rahman on 29/10/23.
//

import Foundation
import SQLite

class DbManager {
    var db: Connection?
    var usersTable: Table?
    
    let nidCol = Expression<String>("National ID")
    let nameCol = Expression<String>("Name")
    
    init() {
        db = createDatabase()
    }
    
    func createDatabase() -> Connection? {
        do {
            let docUrl = getDocumentsDirectory()
            let dbFileUrl = docUrl.appendingPathComponent("db.sqlite3")
            //if FileManager.default.fileExists(atPath: dbFileUrl.path)
            if let database = db { return database}
            let database = try Connection(dbFileUrl.path)
            return database
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func deleteDatabase() -> Bool {
        let docUrl = getDocumentsDirectory()
        let dbFileUrl = docUrl.appendingPathComponent("db.sqlite3")
        do{
            try FileManager.default.removeItem(at: dbFileUrl)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func createUserTable() -> Table? {
        guard let db = db else { return nil}
        let table = Table("Users")
        let sqlStatement = table.create { tableBuilder in
            tableBuilder.column(nidCol, primaryKey: true)
            tableBuilder.column(nameCol)
        }
        do {
            try db.run(sqlStatement)
            return table
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func insertUserData() {
        guard let users = usersTable else { return }
        let sqlStatement = users.insert(nidCol <- "19 50 47 26", nameCol <- "Hasib")
        let sqlStatement2 = users.insert(nidCol <- "19 50 47 29", nameCol <- "Hasibur")
        do {
            try db?.run(sqlStatement)
            try db?.run(sqlStatement2)
            print("Data inserted")
        } catch {
            print(error.localizedDescription)
            return
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}
