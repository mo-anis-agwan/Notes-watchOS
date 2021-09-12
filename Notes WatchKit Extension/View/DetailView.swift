//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Anis on 12/09/21.
//

import SwiftUI

struct DetailView: View {
    //MARK:- Property
    let note: Note
    let count: Int
    let index: Int
    @State private var isCreditsPresented: Bool = false
    
    //MARK:- Body
    var body: some View {
        VStack(alignment: .center, spacing: 3, content: {
            // Header
            HeaderView()
            
            // Content
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            // Foooter
            HStack(alignment: .center, content: {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
                Spacer()
                Text("\(count) / \(index+1)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
            }) //: HStack
            .foregroundColor(.secondary)
            
        }) //: VStack
        .padding(3)
    }
}

//MARK:- Preview
struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "Hello, Friend")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
