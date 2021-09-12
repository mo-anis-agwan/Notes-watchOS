//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Anis on 12/09/21.
//

import SwiftUI

struct CreditsView: View {
    //MARK:- Property
    @State private var randomNo: Int = Int.random(in: 1..<4)
    private var randomImage: String {
        return "developer-no\(randomNo)"
    }
    
    //MARK:- Body
    var body: some View {
        VStack(spacing: 3, content: {
            // Profile Image
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // Header
            HeaderView(title: "Credits")
            
            // Content
            Text("Childish El-Niño")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
        })
    }
}

//MARK:- Preview
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
