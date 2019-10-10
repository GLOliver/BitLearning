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
        list.append(Question(image: "coins", questionText: "De acordo com a definição, o que são criptomoedas?", choiceA: "A. RESPOSTA 1!", choiceB: "B. RESPOSTA 2!", choiceC: "C. RESPOSTA 3!", choiceD: "D. RESPOSTA 4!", answer: 2))
        
        list.append(Question(image: "coins", questionText: "Quem inventou as criptos?", choiceA: "A. Satoshi Nakamoto", choiceB: "B. RESPOSTA 2!", choiceC: "C. RESPOSTA 3!", choiceD: "D. RESPOSTA 4!", answer: 1))
        
        list.append(Question(image: "coins", questionText: "Complete a frase: Bit...", choiceA: "A. Satoshi Nakamoto", choiceB: "B. Hub", choiceC: "C. coin", choiceD: "D. Bucket", answer: 3))
        
        
    }
}
