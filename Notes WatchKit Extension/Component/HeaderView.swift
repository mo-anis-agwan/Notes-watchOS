//
//  HeaderView.swift
//  Notes WatchKit Extension
//
//  Created by Anis on 12/09/21.
//

import SwiftUI

struct HeaderView: View {
    //MARK:- Property
    var title: String = ""
    
    //MARK:- Body
    var body: some View {
        // Header
        VStack {
            // Title
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            // Separator
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            } //: HStack
            .foregroundColor(.accentColor)
        } //: VStack
    }
}

    //MARK:- Preview
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
