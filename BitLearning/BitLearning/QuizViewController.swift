//
//  QuizViewController.swift
//  BitLearning
//
//  Created by Aluno Mack on 10/10/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import UIKit
import CoreData

class QuizViewController: UIViewController {

    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var flagView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    //Buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    var premio: Int = 0
    var users:[User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI()
        self.navigationController?.isNavigationBarHidden = true;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        if sender.tag == selectedAnswer {
            print("correct")
            score += 1
        } else {
            print("wrong")
        }
        
        questionNumber += 1
        updateQuestion()
    }
    
    func updateQuestion() {
        
        
        if questionNumber < allQuestions.list.count {
            
            flagView.image = UIImage(contentsOfFile: allQuestions.list[questionNumber].questionImage)
            
            questionLabel.text = allQuestions.list[questionNumber].question
            
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
            
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
            
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
            
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
            
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
        
            updateUI()
            
        } else {
            scoreLabel.text = "Pontuação: \(score)"
            
            if (score <= 1){
                premio = 0
            } else if (score == 2){
                premio = 50
            } else if (score >= 3){
                premio = 100
            }
            
            if (premio > 0){
                
                users = CoreDataManager.sharedInstance.getUsers()
                let newsaldo = Int(users[0].saldoReais) + premio
                CoreDataManager.sharedInstance.updateSaldo(saldo: newsaldo)
                
                let alert = UIAlertController(title: "Fim do Quiz!", message: "Parabéns! Você ganhou \(premio), que será adicionado a sua carteira.", preferredStyle: .alert)
                
                 alert.addAction(UIAlertAction(title:"Legal!", style: .default, handler:  { action in self.performSegue(withIdentifier: "mySegueIdentifier", sender: self) }))
                 
                present(alert, animated: true, completion: nil)
                
            } else {
                let alert = UIAlertController(title: "Fim do Quiz.", message: "Que pena! Você não ganhou o premio, deseja tentar novamente?", preferredStyle: .alert)
                
                let restartAction = UIAlertAction(title: "Sim :)", style: .default, handler: {action in self.restartQuiz()})
                
                alert.addAction(UIAlertAction(title:"Não :(", style: .default, handler:  { action in self.performSegue(withIdentifier: "mySegueIdentifier", sender: self) }))
                alert.addAction(restartAction)
                
                present(alert, animated: true, completion: nil)
            }
            
            
        }
        
        
        
    }
    
    func updateUI() {
        scoreLabel.text = "Pontuação: \(score)"
        questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
    }

    
    
    // Actions
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
