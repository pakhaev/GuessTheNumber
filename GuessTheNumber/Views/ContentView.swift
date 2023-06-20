//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by Khusain on 19.06.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameManager = GameManager()
    @State private var showAlert = false
    
    //Тут ведь не нужно разбивать на составляющие, т.к. мало нагрузки
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(lround(gameManager.game.currentValue))")

            UISliderRepresentation()
            
            Button("Проверь меня!") {
                showAlert = true
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Your Score"),
                    message: Text(gameManager.score.formatted())
                )
            }
            
            Button("Начать заново") {
                gameManager.restartGame()
            }
        }
        .environmentObject(gameManager)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
