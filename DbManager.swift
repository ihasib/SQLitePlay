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
            if let database = db { return database }
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
            try db.run(table.drop())
            try db.run(sqlStatement)
            return table
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func insertUserData() -> Bool {
        guard let users = usersTable else { return false}
        let sqlStatement = users.insert(nidCol <- "19 50 47 26", nameCol <- "Hasib")
        let sqlStatement2 = users.insert(nidCol <- "19 50 47 29", nameCol <- "Hasibur")
        do {
            try db?.run(sqlStatement)
            try db?.run(sqlStatement2)
            print("Data inserted")
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    
    let nid = Expression<String>("Nationa id no")
    let name = Expression<String>("Name")

    func insertLoaneeData() -> Bool {
        guard let db = db else { return false }
        let loaneeTable = Table("Loanee")
        do {
            try db.run(loaneeTable.insert(nid <- "123 456 789", name <- "হাসিব"))
            try db.run(loaneeTable.insert(nid <- "123 456 781", name <- "Hossan"))
        } catch {
            print(error.localizedDescription)
        }
        return true
    }

    func createLoaneeTable() -> Table? {
        guard let db = db else { return nil }
        let loaneeTable = Table("Loanee")
        let sqlStatement = loaneeTable.create { tableBuilder in
            tableBuilder.column(nid, primaryKey: true)
            tableBuilder.column(name)
        }
        do {
            try db.run(loaneeTable.drop(ifExists: true))
            try db.run(sqlStatement)
            return loaneeTable
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func fetchLoaneeData() {
        guard let db = db else { return }
        do {
            let loanees = try db.prepare(Table("Loanee"))
            for loanee in loanees {
                print(" nid = \(loanee[nid])\n name = \(loanee[name])")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}
