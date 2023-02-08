//
//  ContentView.swift
//  day2
//
//  Created by Mohammad Murtada on 08/02/2023.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var fileManager = MyFileManager()
    
    
    
   @State var myList = [
    Item(title: "First Thing",noteText:"first thing first rip uncle phil"),
    Item(title: "Next thing", noteText: "For real, you the only father that I ever knew")
   ]
    
    
    
    var body: some View {
        VStack {
            NavigationView{
                List($myList) { item in
                    NavigationLink(destination: DetailView(title: item.title, noteText: item.noteText)) {
                        Text(item.title.wrappedValue)
                    }
                }
            }

            .frame(maxHeight: .infinity)
        }
        .padding()
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
