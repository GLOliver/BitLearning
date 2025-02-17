//
//  QuestionBank.swift
//  BitLearning
//
//  Created by Aluno Mack on 10/10/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    
    init() {
        list.append(Question(image: "coins", questionText: "De acordo com a definição, o que são criptomoedas?", choiceA: "A. Dinheiro virtual descentralizado", choiceB: "B. Esquema de pirâmide", choiceC: "C. Esquema Ponzi", choiceD: "D. Dinheiro virtual centralizado", answer: 1))
        
        list.append(Question(image: "coins", questionText: "Quem criou as criptomoedas?", choiceA: "A. Satoshi Nakamoto", choiceB: "B. Bill Gates", choiceC: "C. Steve Jobs", choiceD: "D. Silvio Santos", answer: 1))
        
        list.append(Question(image: "coins", questionText: "Complete a palavra: Bit...", choiceA: "A. Satoshi Nakamoto", choiceB: "B. Hub", choiceC: "C. coin", choiceD: "D. Bucket", answer: 3))
        
        
    }
}
