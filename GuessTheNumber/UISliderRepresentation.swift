//
//  UISliderRepresentation.swift
//  GuessTheNumber
//
//  Created by Khusain on 19.06.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var targetValue: Double
    @Binding var currentValue: Double

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = .red
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        
        slider.setValue(Float(targetValue), animated: false)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged(_:)),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(Float(targetValue), animated: false)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(targetValue: $targetValue, currentTarget: $currentValue)
    }
}

// MARK: - Coordinator
extension UISliderRepresentation {
    class Coordinator: NSObject {
        @Binding var targetValue: Double
        @Binding var currentTarget: Double
        
        init(targetValue: Binding<Double>, currentTarget: Binding<Double>) {
            _targetValue = targetValue
            _currentTarget = currentTarget
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            targetValue = Double(sender.value)
            
            let maxDistance = abs(targetValue - currentTarget)
            let maxAlpha: CGFloat = 1
            let minAlpha: CGFloat = 0.1
            
            let alpha = (1.0 - maxDistance / 100.0) * (maxAlpha - minAlpha) + minAlpha
            
            sender.thumbTintColor = UIColor.red.withAlphaComponent(alpha)
        }
    }
}
