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

    var body: some View {
        TextField("",text : $title)
        TextEditor(text : $noteText)
            .foregroundColor(noteText == "Enter your text here" ? .gray : .black)

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: .constant("example"),
                   noteText: .constant("example note text"))
    }
}