//
//  WordSearchView.swift
//  WordGame
//
//  Created by Jigar on 25/05/24.
//

import SwiftUI

struct WordSearchView: View {
    @ObservedObject var viewModel = WordSearchViewModel()
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), spacing: 10) {
                ForEach(viewModel.grid.indices, id: \.self) { row in
                    ForEach(viewModel.grid[row].indices, id: \.self) { col in
                        Text(viewModel.grid[row][col].letter)
                            .frame(width: 40, height: 40)
                            .background(viewModel.selectedPositions.contains(where: { $0 == (row, col) }) ? Color.yellow : Color.white)
                            .cornerRadius(5)
                            .onTapGesture {
                                handleTap(row: row, col: col)
                            }
                    }
                }
            }
            .padding()
        }
    }
    
    private func handleTap(row: Int, col: Int) {
        if viewModel.selectedPositions.contains(where: { $0 == (row, col) }) {
            viewModel.selectedPositions.removeAll(where: { $0 == (row, col) })
        } else {
            viewModel.selectedPositions.append((row, col))
        }
    }
}
