//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Anis on 31/08/21.
//

import SwiftUI

struct ContentView: View {
    //MARK:- Properties
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    //MARK:- Functions
    func save() {
        dump(notes)
    }
    
    //MARK:- Body
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6, content: {
                TextField("Add new note", text: $text)
                
                Button(action: {
                    // 1. Only run the button action when the textfield is not empty
                    guard text.isEmpty == false else { return}
                    // 2. Create a new note item and initialize it with text value
                    let note = Note(id: UUID(), text: text)
                    // 3. Add the new note to the notes array
                    notes.append(note)
                    // 4. Empty the text field
                    text = ""
                    // 5. Save the notes(function)
                    save()
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                })
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                
            }) //: HStack
            
            Spacer()
            
            Text("\(notes.count)")
        } //: VStack
        .navigationTitle("Notes")
    }
}

    //MARK:- Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
