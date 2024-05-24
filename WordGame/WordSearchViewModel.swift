//
//  WordSearchViewModel.swift
//  WordGame
//
//  Created by Jigar on 25/05/24.
//

import SwiftUI

class WordSearchViewModel: ObservableObject {
    @Published var grid: [[GridItemModel]]
    @Published var words: [Word]
    @Published var selectedPositions: [(Int, Int)] = []
    
    init() {
        self.grid = [
            [GridItemModel(letter: "D"), GridItemModel(letter: "G"), GridItemModel(letter: "L"), GridItemModel(letter: "E"), GridItemModel(letter: "W"), GridItemModel(letter: "Q")],
            [GridItemModel(letter: "O"), GridItemModel(letter: "O"), GridItemModel(letter: "D"), GridItemModel(letter: "C"), GridItemModel(letter: "O"), GridItemModel(letter: "T")],
            [GridItemModel(letter: "E"), GridItemModel(letter: "G"), GridItemModel(letter: "T"), GridItemModel(letter: "T"), GridItemModel(letter: "L"), GridItemModel(letter: "F")],
            [GridItemModel(letter: "L"), GridItemModel(letter: "S"), GridItemModel(letter: "R"), GridItemModel(letter: "E"), GridItemModel(letter: "E"), GridItemModel(letter: "E")],
            [GridItemModel(letter: "C"), GridItemModel(letter: "H"), GridItemModel(letter: "A"), GridItemModel(letter: "L"), GridItemModel(letter: "W"), GridItemModel(letter: "Z")],
            [GridItemModel(letter: "G"), GridItemModel(letter: "E"), GridItemModel(letter: "D"), GridItemModel(letter: "L"), GridItemModel(letter: "O"), GridItemModel(letter: "A")],
            [GridItemModel(letter: "E"), GridItemModel(letter: "G"), GridItemModel(letter: "N"), GridItemModel(letter: "E"), GridItemModel(letter: "R"), GridItemModel(letter: "K")]
        ]
        
        self.words = [
            Word(text: "TREE", positions: [(3, 2), (3, 3), (3, 4), (3, 5)]),
            Word(text: "CHALLENGE", positions: [(4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (5, 5), (6, 5)]),
            Word(text: "GRID", positions: [(2, 2), (3, 2), (4, 2), (5, 2)])
        ]
    }
}
