//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    //All Questions from QuestionsBank.swift file.
    let allQuestions = QuestionsBank()
    
    //Answers of all picked like true aor false from buttons OBJ.
    var pickedAnswer : Bool = false
    
    //Starting from question number.
    var questionNumber : Int = 0
    
    //Score with starting with.
    var score : Int = 0
    
    //Outlets for all contents of UI elements.
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Pass Next question function to load our data on screen.
        nextQuestion()
        
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        //Tags for buttons and turn all true false things with conditions.
        if sender.tag == 1 {
            pickedAnswer = true
        }else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
    }
    

    func nextQuestion() {
        if questionNumber <= 12{
            questionLabel.text = allQuestions.list[questionNumber].queationsText
            updateUI()
        }
        else{
            let alert = UIAlertController(title: " Great.! you are about to end.!", message: "if you want to start again all questions? ", preferredStyle: .alert)
            
            let  restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answers
        if correctAnswer == pickedAnswer{
            ProgressHUD.showSuccess("Correct Go ahead.! you are doing good.")
            print("Baddhu barabar jay che")
            score = score + 1
        }
        else {
            ProgressHUD.showError("Wrong Answer. Batter luck next time.!")
            print("Tu to khoto nikdo ala..!!")
        }
        
    }
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
    }
    

    
}
