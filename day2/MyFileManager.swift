//
//  MyFileManager.swift
//  day2
//
//  Created by Mohammad Murtada on 08/02/2023.
//

import Foundation
class MyFileManager: ObservableObject{
    
    let userDefaults = UserDefaults.standard
    @Published var items = [Item]() //Our local "Database"
    let arrayKey = "key"
    
    init() {
        items.append(Item(title: "Note 1", noteText: "text 1"))
        items.append(Item(title: "Note 2", noteText: "text 2"))
        save()
        read()
    }
    
    func save(){
        do{
            let encodedData = try JSONEncoder().encode(items)
            userDefaults.set(encodedData, forKey: arrayKey)
            
        }catch{
            
        }
    }
    // ? betyder at the kan være null ellers så kan intet være null i swift
    func read(){
        if let result = userDefaults.object(forKey: arrayKey) as? Data{ //Ask for the item we just saved
            
            do{
                let results = try JSONDecoder().decode([Item].self, from: result)
                self.items = results
                for i in items {
                    print(i) // for debugging
                }
            } catch{
                
            }
            
        }
        //Der kan også være en else hvis nødvendigt
    }
    
    
    
    
}
