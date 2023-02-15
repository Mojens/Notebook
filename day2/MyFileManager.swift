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
   read()
    }
    
    func addItem(title:String, noteText:String){
        myList.append(Item(title: title, noteText: noteText))
        save()
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
