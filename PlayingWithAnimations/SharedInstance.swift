//
//  SharedInstance.swift
//  PlayingWithAnimations
//
//  Created by Derek on 7/1/17.
//  Copyright © 2017 DboTheGoat. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class SharedInstance: NSObject {
    static let share = SharedInstance()
    
    //how you access core data
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var listItems = [NSManagedObject]()
    
//    let dummyData = ["Luke", "Anakin", "Yoda", "Mace", "ObiWan", "Rey", "Kylo", "R2D2", "C3PO", "Poe", "Finn", "Han", "QuiGon", "Lando", "BB8", "Chewy"]
    let dummyData = ["Luke", "Anakin", "Yoda", "Mace", "ObiWan"]
    var voices = [AVSpeechSynthesisVoice]()
    
    //save
    func save(itemToSave: String) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ListEntity", in: managedContext)
        let item = NSManagedObject(entity: entity!, insertInto: managedContext)
        item.setValue(itemToSave, forKey: "item")
        do {
            try managedContext.save()
            listItems.append(item)
            print("Item saved")
        } catch {
            print("Error on save")
        }
    }
    
    //retrieve
    func retrieve() {
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListEntity")
        do {
            let results = try managedContext.fetch(fetchRequest)
            listItems = results as! [NSManagedObject]
            print("Items retrieved")
        } catch {
            print("Error on retrieval")
        }
    }
    
    //delete only one item
    func deleteOneItem(itemToDelete: Int) {
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(listItems[itemToDelete])
        listItems.remove(at: itemToDelete)
        
        do {
            try managedContext.save()
             print("Item deleted")
        } catch { }
    }
    
    //delete all
    func deleteAll() {
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListEntity")
        let deleteAll = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try managedContext.execute(deleteAll)
            listItems.removeAll()
            print("All items deleted")
        }
        catch { }
        
    }
    
    func getVoices() {
        for voice in AVSpeechSynthesisVoice.speechVoices() {
            SharedInstance.share.voices.append(voice)
        }
    }
}
