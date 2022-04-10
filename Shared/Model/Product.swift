//
//  Product.swift
//  Art
//
//  Created by Kevin Stradtman on 4/10/22.
//

import Foundation
import FirebaseFirestore

struct Product {
    var name: String
    var id: String
    var category: String
    var price: Double
    var productDescription: String
    var imgUrl: String
    var timeStamp: Timestamp
    var stock: Int
    var favorite: Bool
}
