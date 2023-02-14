//
//  Haptics Manager.swift
//  DetailsMetter
//
//  Created by Ana Caroline Sampaio Nogueira on 15/09/22.
//

import Foundation

import UIKit

final class HapticsManager {
    
    static let shared = HapticsManager()
    
    private init() {}
    
    public func vibrateNotification(for type: UINotificationFeedbackGenerator.FeedbackType){
        DispatchQueue.main.async {
            let notificationGenerator = UINotificationFeedbackGenerator()
            notificationGenerator.prepare()
            notificationGenerator.notificationOccurred(type)
        }
    }
    
    public func vibrateImpact(for type: UIImpactFeedbackGenerator.FeedbackStyle){
        DispatchQueue.main.async {
            let impactGenerator = UIImpactFeedbackGenerator(style: type)
            impactGenerator.prepare()
            impactGenerator.impactOccurred()
        }
    }
    
    public func vibrateSelection(){
        DispatchQueue.main.async {
            let selectionctionGenerator = UISelectionFeedbackGenerator()
            selectionctionGenerator.prepare()
            selectionctionGenerator.selectionChanged()
        }
    }
}
