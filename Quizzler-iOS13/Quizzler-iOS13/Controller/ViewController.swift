//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
       print(sender.currentTitle!)
      let userAnswer = sender.currentTitle!
      let userGotItRight =  quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(
           timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        answerOne.backgroundColor = UIColor.clear
        answerOne.setTitle(quizBrain.currentQuestionAnswer(index:0), for: .normal)
        trueButton.backgroundColor = UIColor.clear
        trueButton.setTitle(quizBrain.currentQuestionAnswer(index:1), for: .normal)
        scoreLabel.text = "Score: \(quizBrain.score)"
        falseButton.backgroundColor = UIColor.clear
        falseButton.setTitle(quizBrain.currentQuestionAnswer(index:2), for: .normal)
        progressBar.progress = quizBrain.getProgress()
    }
    
    

}

