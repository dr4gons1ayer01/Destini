//
//  ViewController.swift
//  Destini
//
//  Created by Иван Семенов on 21.02.2024.
//

import UIKit

class ViewController: UIViewController {
    let mainView = MainView()
    var storyBrain = StoryBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        updateUI()
        
        tap1Choice()
        tap2Choice()
    }
    func updateUI() {
        let story = storyBrain.stories[storyBrain.storyNumber]
        mainView.storyLabel.text = story.title
        mainView.choice1Button.setTitle(story.choice1, for: .normal)
        mainView.choice2Button.setTitle(story.choice2, for: .normal)
    }
    func choiceMade(destination: Int) {
        storyBrain.nextStory(destination)
        updateUI()
    }
    
    func tap1Choice() {
        let tap = UIAction { _ in
            self.choiceMade(destination: 1)
        }
        mainView.choice1Button.addAction(tap, for: .touchUpInside)
    }
    func tap2Choice() {
        let tap = UIAction { _ in
            self.choiceMade(destination: 2)
        }
        mainView.choice2Button.addAction(tap, for: .touchUpInside)
    }
}

