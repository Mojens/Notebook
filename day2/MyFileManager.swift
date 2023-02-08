//
//  MyFileManager.swift
//  day2
//
//  Created by Mohammad Murtada on 08/02/2023.
//

import Foundation
class MyFileManager{
    
    let userDefaults = UserDefaults.standard
    var items = [Item]() //Our local "Database"
    let arrayKey = "key"
    
    func save(){
        do{
            let encodedData = try JSONEncoder().encode(items)
            userDefaults.set(items, forKey: arrayKey)
            
        }catch{
            
        }
    }
    // ? betyder at the kan være null ellers så kan intet være null i swift
    func read(){
        if let result = userDefaults.object(forKey: arrayKey) as? Data{ //Ask for the item we just saved
            
        }else{
            
        }
        
        
        
    }
    
    
    
    
}
