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
        @Published var detectedWords: [String] = []
//        private let spellChecker = NSSpellChecker.shared
    
    init() {
          self.grid = Array(repeating: Array(repeating: GridItemModel(letter: ""), count: 8), count: 8)
          self.words = []
          generateGrid()
      }
    
    func generateGrid() {
        // Place hidden words in the grid
        self.words = [
            Word(text: "TREE", positions: [(3, 2), (3, 3), (3, 4), (3, 5)]),
            Word(text: "CHALLENGE", positions: [(4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (5, 5), (6, 5)]),
            Word(text: "GRID", positions: [(2, 2), (3, 2), (4, 2), (5, 2)])
        ]
        
        // Place words in the grid
        for word in self.words {
            for (index, (i, j)) in word.positions.enumerated() {
                let letterIndex = word.text.index(word.text.startIndex, offsetBy: index)
                grid[i][j].letter = String(word.text[letterIndex])
            }
        }
        
        // Fill empty spaces with random letters
        for i in 0..<8 {
            for j in 0..<8 {
                if grid[i][j].letter.isEmpty {
                    grid[i][j].letter = randomLetter()
                }
            }
        }
    }
    
    private func randomLetter() -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String(letters.randomElement()!)
    }
    
    func validateWord(_ word: String) -> Bool {
        return words.contains { $0.text.uppercased() == word }
    }
}
