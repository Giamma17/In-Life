//
//  Item.swift
//  In-life
//
//  Created by Gianmarco Lugaresi on 08/04/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
