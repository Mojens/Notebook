//
//  MyFileManager.swift
//  day2
//
//  Created by Mohammad Murtada on 08/02/2023.
//

import Foundation
class MyFileManager: ObservableObject{
    
    let userDefaults = UserDefaults.standard
    @Published var myList = [Item]() //Our local "Database"
    let arrayKey = "key"
    
    init() {
        myList.append(Item(title: "Groceries", noteText: "Curry, Potato, Apples, Chicken, Toiletpaper, Milk"))
        myList.append(Item(title: "My Favorite Songs", noteText: "Fayrouz - Sa'alouni Al Nas,\nIndila - Tourner Dans Le Vide,\n Indila - Dernière Danse,\nTupac Shakur - Ambitionz az a Ridah"))
        save()
        read()
    }
    
    func save(){
        do{
            let encodedData = try JSONEncoder().encode(myList)
            userDefaults.set(encodedData, forKey: arrayKey)
            
        }catch{
            
        }
    }
    // ? betyder at the kan være null ellers så kan intet være null i swift
    func read(){
        if let result = userDefaults.object(forKey: arrayKey) as? Data{ //Ask for the item we just saved
            
            do{
                let results = try JSONDecoder().decode([Item].self, from: result)
                self.myList = results
                for i in myList {
                    print(i) // for debugging
                }
            } catch{
                
            }
            
        }
        //Der kan også være en else hvis nødvendigt
    }
    
    
    
    
}
