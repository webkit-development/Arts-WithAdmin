//
//  Categry.swift
//  Art
//
//  Created by Kevin Stradtman on 4/9/22.
//

import Foundation
import FirebaseFirestore

struct Category {
    var name: String
    var id: String
    var imgUrl: String
    var isActive: Bool = true
    var timeStamp: Timestamp
}
