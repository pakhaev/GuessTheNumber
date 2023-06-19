//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by Khusain on 19.06.2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var currentValue = Double.random(in: 0...100)
    @State var targetValue = 0.0
    @State var opacityValue = 1.0
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(lround(currentValue))")

            UISliderRepresentation(targetValue: $targetValue, currentValue: $currentValue)
            
            Button("Проверь меня") {
                print(computeScore())
            }
            .padding()
            
            Button("Начать заново") {
                //
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - currentValue)
        return 100 - lround(difference)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
