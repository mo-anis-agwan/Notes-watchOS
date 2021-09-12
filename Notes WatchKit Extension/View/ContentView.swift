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
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        //dump(notes)
        do {
            //1. Convert the notes array to data using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            //2. Create a new URL to save the file using the getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            //3. Write the data to the given URL
            try data.write(to: url)
        } catch {
            print("Saving Data has failed")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                // 1. Get notes url path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                // 2. Create a new property for the data
                let data = try Data(contentsOf: url)
                // 3. Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                //Do nothing

            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
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
            
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        HStack {
                            Capsule()
                                .frame(width: 4)
                                .foregroundColor(.accentColor)
                            Text(notes[i].text)
                                .lineLimit(1)
                                .padding(.leading, 5)
                        } //: HStack
                    } //: Loop
                    .onDelete(perform: { indexSet in
                        delete(offsets: indexSet)
                    })
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            } //: List
        } //: VStack
        .navigationTitle("Notes")
        .onAppear(perform: {
            load()
        })
    }
}

    //MARK:- Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
