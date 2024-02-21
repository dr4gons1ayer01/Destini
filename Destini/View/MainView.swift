//
//  MainView.swift
//  Destini
//
//  Created by Иван Семенов on 21.02.2024.
//

import UIKit

class MainView: UIView {
    let backgroundImage = UIImageView(image: UIImage(named: "background"))
    
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    func setupUI() {
        backgroundImage.contentMode = .scaleAspectFill
        
        addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
