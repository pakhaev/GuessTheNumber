//
//  UISliderRepresentation.swift
//  GuessTheNumber
//
//  Created by Khusain on 19.06.2023.
//

import SwiftUI

// MARK: - UISliderRepresentation
struct UISliderRepresentation: UIViewRepresentable {
    @EnvironmentObject private var gameManager: GameManager

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = .red
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.setValue(Float(gameManager.game.targetValue), animated: false)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged(_:)),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(Float(gameManager.game.targetValue), animated: false)
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(gameManager.alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(gameManager: gameManager)
    }
}

// MARK: - Coordinator
extension UISliderRepresentation {
    class Coordinator: NSObject {
        let gameManager: GameManager
        
        init(gameManager: GameManager) {
            self.gameManager = gameManager
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            gameManager.game.targetValue = Double(sender.value)
        }
    }
}
