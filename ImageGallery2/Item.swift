//
//  Item.swift
//  ImageGallery2
//
//  Created by Christian Manzaraz on 09/05/2024.
//

import SwiftUI


struct Item: Identifiable {
    let id = UUID()
    let url: URL
}

extension Item: Equatable {
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }
}
