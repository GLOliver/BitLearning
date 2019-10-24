//
//  CoreDataManager.swift
//  BitLearning
//
//  Created by Aluno Mack on 24/10/2019.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let sharedInstance = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "BitLearning")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func insertUser(saldo: Int,lista: [[String: Int]]) {
        guard let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: persistentContainer.viewContext) as? User else { return }
        newUser.saldoReais = Int16(saldo)
        newUser.listaCotacao = lista
        saveContext()
    }
    
    func updateSaldo(saldo: Int){
        do{
            let usuarios:[User] = try persistentContainer.viewContext.fetch(User.fetchRequest())
            let usuario = usuarios[0]
            usuario.saldoReais = Int16(saldo)
            saveContext()
        } catch {
            print("CoreData error")
        }
    print("CoreData error")
    }
    
    func updateCotacao(lista: [[String: Int]]){
        do{
            let usuarios:[User] = try persistentContainer.viewContext.fetch(User.fetchRequest())
            let usuario = usuarios[0]
            usuario.listaCotacao = lista
            saveContext()
        } catch {
            print("CoreData error updateCotacao 1")
        }
        print("CoreData error updateCotacao 2")
    }
    
    
    func getUsers() -> [User] {
        do{
            let usuarios:[User] = try persistentContainer.viewContext.fetch(User.fetchRequest())
            return usuarios
        } catch {
            print("CoreData error")
        }
        return []
    }
    
    func deleteObject(object:NSManagedObject) {
        persistentContainer.viewContext.delete(object)
        saveContext()
    }
    
}
