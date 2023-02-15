//
//  ContentView.swift
//  day2
//
//  Created by Mohammad Murtada on 08/02/2023.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var fileManager = MyFileManager()
    
    var body: some View {
           VStack {
               NavigationView{
                   List($fileManager.myList) { item in
                       NavigationLink(destination: DetailView(title: item.title, noteText: item.noteText, fileManager: fileManager)) {
                           Text(item.title.wrappedValue)
                       }
                   }
                   .navigationBarTitle("My Notes")
                   .navigationBarItems(trailing: Button(action: {
                       fileManager.addItem(title: "New Note", noteText: "Enter your text here")
                       fileManager.save()
                   }) {
                       Image(systemName: "plus")
                   })
               }
           }
         
       }
}

struct Item:Identifiable, Codable{
    var id = UUID()
    var title:String
    var noteText:String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
