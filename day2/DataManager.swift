//
//  DataManager.swift
//  day2
//
//  Created by Mohammad Murtada on 15/02/2023.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var myList = [Item]()
    
    init(){
        fetchNotes()
    }
    
    
    func fetchNotes(){
        myList.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Notes")
        ref.getDocuments {
            snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot{
                for document in snapshot.documents{
                    let data = document.data()
                    
                    let title = data["title"] as? String; ""
                    let noteText = data["noteText"] as? String; ""
                    
                    let item = Item(title: title!, noteText: noteText!)
                    self.myList.append(item)
                }
            }
        }
    }
    func addItem(title: String, noteText: String){
        let db = Firestore.firestore()
        let ref = db.collection("Notes").document()
        ref.setData(["title": title, "noteText": noteText])
    }
}
