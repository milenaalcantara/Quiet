//
//  Animations.swift
//  Quiet
//
//  Created by Moyses Miranda do Vale Azevedo on 17/02/23.
//

import Foundation
import SpriteKit

enum Animation {
    func getModel() -> ([SKTexture], SKAction) {
        switch self {
        case .treeBreath:
            let animationBreath = AnimationStruct(nameTextureAtlas: "Tree_breath", prefixNameFiles: "Tree_breath_")
            animationBreath.action.duration = 2
            let repeate = SKAction.repeatForever(animationBreath.action)
            let animationOn = AnimationStruct(nameTextureAtlas: "Tree_on", prefixNameFiles: "Tree_on_")
            let action = SKAction.sequence([animationOn.action, repeate])
            return (animationOn.textures + animationBreath.textures,action)
        case .treeOff:
            let animation = AnimationStruct(nameTextureAtlas: "Tree_on", prefixNameFiles: "Tree_on_")
            return (animation.textures, animation.action.reversed())
        case .boatBreath:
            let animationBreath = AnimationStruct(nameTextureAtlas: "Boat_breath", prefixNameFiles: "Boat_breath_")
            animationBreath.action.duration = 2
            let repeate = SKAction.repeatForever(animationBreath.action)
            let animationOn = AnimationStruct(nameTextureAtlas: "Boat_on", prefixNameFiles: "Boat_on_")
            let action = SKAction.sequence([animationOn.action, repeate])
            return (animationOn.textures + animationBreath.textures,action)
        case .boatOff:
            let animation = AnimationStruct(nameTextureAtlas: "Boat_on", prefixNameFiles: "Boat_on_")
            return (animation.textures, animation.action.reversed())
        case .seagullBreath:
            let animationBreath = AnimationStruct(nameTextureAtlas: "Seagull_breath", prefixNameFiles: "Seagull_breath_")
            animationBreath.action.duration = 2
            let repeate = SKAction.repeatForever(animationBreath.action)
            let animationOn = AnimationStruct(nameTextureAtlas: "Seagull_on", prefixNameFiles: "Seagull_on_")
            let action = SKAction.sequence([animationOn.action, repeate])
            return (animationOn.textures + animationBreath.textures,action)
        case .seagullOff:
            let animation = AnimationStruct(nameTextureAtlas: "Seagull_on", prefixNameFiles: "Seagull_on_")
            return (animation.textures, animation.action.reversed())
        }
    }

    case treeBreath
    case treeOff
    case boatBreath
    case boatOff
    case seagullBreath
    case seagullOff
}

class AnimationStruct {
    let nameTextureAtlas: String
    let prefixNameFiles: String
    let textures: [SKTexture]
    var action: SKAction

    init(nameTextureAtlas: String,
         prefixNameFiles: String) {
        self.nameTextureAtlas = nameTextureAtlas
        self.prefixNameFiles = prefixNameFiles
        var fileNames: [String] = []
        let textureAtlas = SKTextureAtlas(named: nameTextureAtlas)

        for i in 0...30 {
            let fileName = "\(prefixNameFiles)\(String(format: "%02d", i))"
            fileNames.append(fileName)
        }
        self.textures = fileNames.map { textureAtlas.textureNamed($0) }
        action = SKAction.animate(with: textures, timePerFrame: 1/30)
    }
}

class Node: SKSpriteNode {
    let animation: Animation

    init(animation: Animation) {
        self.animation = animation
        let model = animation.getModel()
        super.init(texture: model.0.first, color: .clear, size: model.0.first!.size())
        position.x = 0.5
        position.y = 0.5
        scale(to: CGSize(width: 1, height: 1))
        self.run(model.1)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
