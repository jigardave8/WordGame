//
//  WordSearchView.swift
//  WordGame
//
//  Created by Jigar on 25/05/24.
//

import SwiftUI

struct WordSearchView: View {
    @ObservedObject var viewModel = WordSearchViewModel()
    @State private var currentWord = ""
    @State private var isValidWord = false
    
    var body: some View {
        VStack {
            VStack {
                ForEach(viewModel.grid.indices, id: \.self) { row in
                    HStack {
                        ForEach(viewModel.grid[row].indices, id: \.self) { col in
                            Text(viewModel.grid[row][col].letter)
                                .frame(width: 40, height: 40)
                                .background(viewModel.selectedPositions.contains(where: { $0 == (row, col) }) ? Color.yellow : Color.white)
                                .cornerRadius(5)
                        }
                    }
                }
            }
            .gesture(DragGesture(minimumDistance: 10)
                .onChanged { gesture in
                    let row = Int(gesture.location.y / 40)
                    let col = Int(gesture.location.x / 40)
                    
                    if row >= 0 && row < 8 && col >= 0 && col < 8 {
                        viewModel.selectedPositions.append((row, col))
                        let letter = viewModel.grid[row][col].letter
                        currentWord += letter
                    }
                }
                .onEnded { _ in
                    isValidWord = viewModel.validateWord(currentWord)
                    if !isValidWord {
                        withAnimation {
                            viewModel.selectedPositions.removeAll()
                        }
                    } else {
                        viewModel.detectedWords.append(currentWord)
                    }
                    currentWord = ""
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isValidWord ? Color.green : Color.red, lineWidth: 3)
                    .frame(width: 40 * CGFloat(currentWord.count), height: 40)
                    .position(x: 40 * CGFloat(viewModel.selectedPositions.first?.1 ?? 0) + 20,
                              y: 40 * CGFloat(viewModel.selectedPositions.first?.0 ?? 0) + 20)
                    .animation(.default)
            )
            VStack {
                Text("Detected Words")
                    .font(.headline)
                    .padding(.bottom, 5)
                ScrollView {
                    ForEach(viewModel.detectedWords, id: \.self) { word in
                        Text(word)
                            .foregroundColor(Color.blue)
                    }
                }
            }
        }
    }
}
