//
//  DetailView.swift
//  day2
//
//  Created by Mohammad Murtada on 08/02/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var title:String
    @Binding var noteText:String
    @ObservedObject var fileManager: MyFileManager

    var body: some View {
        VStack {
            Spacer().frame(height: 10)
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                    .frame(width: 300, height: 50, alignment: .center)
                    .font(.title)
                    .bold()
                    .background(Color.clear)
                    .border(Color.clear, width: 0)
                    .onTapGesture {
                        if title == "New Note" {
                            title = ""
                        }
                    }
            TextEditor(text: $noteText)
                .foregroundColor(.black)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 150, alignment: .leading)
                .onTapGesture {
                    if noteText == "Enter your text here" {
                        noteText = ""
                    }
                }
                .background(Color.clear)
                .border(Color.clear, width: 0)


            Spacer()
            Button(action: {
                // Call the save method on the fileManager here
                self.fileManager.save()
                self.fileManager.read()
            }) {
                Text("Save")
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: .constant("example"),
                   noteText: .constant("example note text"),
                   fileManager: MyFileManager())
    }
}
