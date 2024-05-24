//
//  Model.swift
//  WordGame
//
//  Created by Jigar on 25/05/24.
//

import SwiftUI

struct GridItemModel: Identifiable {
    var id = UUID()
    var letter: String
}

struct Word: Identifiable {
    var id = UUID()
    var text: String
    var positions: [(Int, Int)]
}
