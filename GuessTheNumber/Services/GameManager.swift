//
//  GameManager.swift
//  GuessTheNumber
//
//  Created by Khusain on 19.06.2023.
//

import SwiftUI

final class GameManager: ObservableObject {
    @Published var game = Game()
    
    private var difference: Double {
        abs(game.targetValue - game.currentValue)
    }
    
    var alpha: CGFloat {
        let maxAlpha: CGFloat = 1
        let alpha = (100.0 - difference) / 100.0 * maxAlpha
        
        return alpha
    }
    
    var score: Int {
        return 100 - lround(difference)
    }
    
    func restartGame() {
        game.currentValue = Double.random(in: 0...100)
        game.targetValue = 0.0
    }
}
