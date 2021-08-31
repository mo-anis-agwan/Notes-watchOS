//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Anis on 01/09/21.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
