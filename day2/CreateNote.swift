//
//  CreateNote.swift
//  day2
//
//  Created by Mohammad Murtada on 08/02/2023.
//

import SwiftUI
struct CreateNote: View {
    @State private var title: String = "Enter your title here"
    @State private var noteText: String = "Enter your text here"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Title", text: $title)
                    .font(.headline)
                Spacer()
            }
            .padding(.horizontal, 20.0)
            
            TextEditor(text: $noteText)
                .font(.body)
                .foregroundColor(noteText == "Enter your text here" ? .gray : .black)
                .padding(.horizontal, 20.0)
                .padding(.top, 20.0)
        }
    }
}


struct CreateNote_Previews: PreviewProvider {
    static var previews: some View {
        CreateNote()
    }
}
