//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by Anis on 12/09/21.
//

import SwiftUI

struct SettingsView: View {
    //MARK:- Property
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    //MARK:- Functions
    func updateLine() {
        lineCount = Int(value)
    }
    
    //MARK:- Body
    var body: some View {
        VStack(spacing: 8) {
            // Header
            HeaderView(title: "Settings")
            // Actual Line Count
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            // Slider
            Slider(value: Binding(get: {
                self.value
            }, set: { (newValue) in
                self.value = newValue
                self.updateLine()
            }), in: 1...4, step: 1)
                .accentColor(.accentColor)
            //: VStack
        }
    }
}

//MARK:- Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
