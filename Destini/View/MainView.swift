//
//  MainView.swift
//  Destini
//
//  Created by Иван Семенов on 21.02.2024.
//

import UIKit

class MainView: UIView {
    let backgroundImage = UIImageView(image: UIImage(named: "background"))
    let storyLabel = UILabel()
    let choice1Button = UIButton(title: "выбор 1", bg: UIColor(named: "choice1bg")!)
    let choice2Button = UIButton(title: "выбор 2", bg: UIColor(named: "choice2bg")!)
    
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    func setupUI() {
        backgroundImage.contentMode = .scaleAspectFill
        storyLabel.textAlignment = .center
        storyLabel.lineBreakMode = .byWordWrapping        
        storyLabel.numberOfLines = 16
        storyLabel.font = UIFont(name: "Gilroy-Lightitalic", size: 25)
        storyLabel.textColor = .white
        
        storyLabel.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        storyLabel.layer.cornerRadius = 12
        storyLabel.clipsToBounds = true

        let stack = UIStackView(arrangedSubviews: [storyLabel, choice1Button, choice2Button])
        stack.axis = .vertical
        stack.spacing = 20
        
        addSubview(backgroundImage)
        addSubview(stack)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            storyLabel.bottomAnchor.constraint(equalTo: choice1Button.topAnchor, constant: -80),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UIButton {
    convenience init(title: String, bg: UIColor) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Gilroy-Lightitalic", size: 25)
        backgroundColor = bg
        titleLabel?.numberOfLines = 0
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.textAlignment = .center
        layer.cornerRadius = 12
        layer.borderWidth = 2
        layer.borderColor = UIColor(white: 1, alpha: 0.6).cgColor
        heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
}

import SwiftUI

struct MainViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }
    struct ContainerView: UIViewRepresentable {
        let view = MainView()
        
        func makeUIView(context: Context) -> some UIView {
            return view
        }
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
