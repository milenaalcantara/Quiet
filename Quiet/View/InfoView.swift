//
//  InfoView.swift
//  Quiet
//
//  Created by Milena Lima de Alcântara on 29/09/22.
//

import UIKit

class InfoView: UIView {
    lazy var backgroundImage: UIImageView = {
        let image = UIImage(named: "backgroundSheet")
        let imageView = UIImageView(image: image)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var aboutAppText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = """
            O Quiet propõe uma experiência sensorial por meio de uma interface simples e imersiva. Nele você pode explorar os diferentes elementos da tela para interagir com os sons naturais cuidadosamente selecionados para oferecer a experiência relaxante de uma praia.

            Esperamos que você aproveite ao máximo a sua jornada conosco.
        """
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        
        return label
    }()
    
    override func layoutSubviews() {
        self.addSubview(backgroundImage)
        self.addSubview(aboutAppText)
        configureConstraints()
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            aboutAppText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            aboutAppText.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            aboutAppText.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            aboutAppText.topAnchor.constraint(equalTo: self.topAnchor, constant: 70)
        ])
    }
}
 /*
  Seja bem-vindo ao Quiet - o seu refúgio tranquilo para relaxar e desestressar. Nós acreditamos que todos merecem um momento de paz e serenidade em meio ao caos do dia a dia. É por isso que criamos este aplicativo sensorial com sons naturais cuidadosamente selecionados para proporcionar uma experiência imersiva e revigorante.

  Ao abrir o Quiet, você será levado diretamente para a praia, com o som calmante das ondas do mar e a brisa suave do vento acariciando seu rosto. Você pode explorar os diferentes elementos da tela, cada um com um som distinto, incluindo o som das gaivotas, o barulho do mar agitado, o ruído suave de um barco a vela navegando e o sussurro tranquilo do vento. Todos esses sons trabalham juntos para criar uma sinfonia natural que acalma a mente e relaxa o corpo.

  Nós projetamos o Quiet para ser uma experiência inclusiva para todos, independentemente de suas preferências ou necessidades sensoriais. Com uma interface simples e intuitiva, o aplicativo pode ser facilmente personalizado para atender às suas necessidades únicas. Se você está procurando um ambiente tranquilo para meditar, dormir ou simplesmente relaxar, o Quiet é o lugar perfeito para você.

  Obrigado por escolher o Quiet como seu companheiro para o relaxamento e a serenidade. Esperamos que você aproveite ao máximo a sua jornada sensorial conosco. Relaxe, respire profundamente e deixe os sons naturais do Quiet levá-lo a um lugar de paz interior.
  */
