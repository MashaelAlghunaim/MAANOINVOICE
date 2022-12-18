//
//  Item.swift
//  MAANOINVOICE
//
//  Created by Mashael Alghunaim on 21/05/1444 AH.
//

import Foundation

struct Itemm: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var quantity: Int
    var price: Double

}

