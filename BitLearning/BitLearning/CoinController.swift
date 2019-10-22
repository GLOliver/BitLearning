//
//  CoinController.swift
//  BitLearning
//
//  Created by Aluno Mack on 08/10/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import UIKit

class CoinController: UIViewController {

    @IBOutlet weak var btncompra: UIButton!
    @IBOutlet weak var btnvenda: UIButton!
    @IBOutlet weak var graphline: UIView!
    
    var timer = Timer();
    var myData = [["1": 150], ["2" : 151]]
    var graph:UIView!
    var cont = 2;
    var futureList = [0,1,2,3,4,5,6,10]
    
    var compraAtiva = false;
    var vendaAtiva = false;
    var cotacao = 0;
    var cotacaoAtual = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let x: CGFloat = 10
        let y: CGFloat = 10
        let width = self.graphline.frame.width
        let height = self.graphline.frame.height
        
//        myData.append(["2" : 30])
//        myData.append(["3" : 7])
//        myData.append(["4" : 65])
//        myData.append(["5" : 30])
        
        
        graph = GraphView(frame: CGRect(x: x, y: y, width: width-x*2, height: height * 0.5), data: myData )
        
        self.graphline.addSubview(graph)
        
        startGraph()
    }
    
    
    @IBAction func vender(_ sender: Any) {
        let investimento = 100; //Trocar pelo valor da label
        let ultData = self.myData.last;
        var retorno = 0;
        var lose = 0;
        var won = 0;
        if (vendaAtiva == false){
            // Inicio do trade de venda
            btnvenda.setTitle("Fechar Venda", for: .normal)
            vendaAtiva = true
            
            cotacao = (ultData?[String(self.cont)] ?? 0)
            
        } else {
            // Fim do trade de compra
            btnvenda.setTitle("Vender", for: .normal)
            vendaAtiva = false
            
            cotacaoAtual = (ultData?[String(self.cont)] ?? 0)
            
            //print("Cotação no inicio: \(cotacao)")
            //print("Contação no inicio: \(cotacaoAtual)")
            
            if (cotacao < cotacaoAtual){
                lose = cotacao - cotacaoAtual
                //self.carteira -= lose
                retorno = investimento - lose
                
                //Alert
                let alert = UIAlertController(title: "Fim do trade", message: "Que pena! Seu investimento foi de \(investimento); Seu retorno foi de \(retorno); Você perdeu \(lose)", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Ok!", style: .default)
                alert.addAction(restartAction)
                present(alert, animated: true, completion: nil)
            } else {
                won = cotacaoAtual - cotacao
                //self.carteira += won
                retorno = investimento + won
                
                //Alert
                let alert = UIAlertController(title: "Fim do trade", message: "Que legal! Seu investimento foi de \(investimento); Seu retorno foi de \(retorno); Você lucrou \(won)", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Ok!", style: .default)
                alert.addAction(restartAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //Função de trade de compra
    @IBAction func comprar(_ sender: Any) {
        let investimento = 100; //Trocar pelo valor da label
        let ultData = self.myData.last;
        var retorno = 0;
        var lose = 0;
        var won = 0;
        if (compraAtiva == false){
            // Inicio do trade de compra
            btncompra.setTitle("Fechar compra", for: .normal)
            compraAtiva = true
            
            cotacao = (ultData?[String(self.cont)] ?? 0)
            
        } else {
            // Fim do trade de compra
            btncompra.setTitle("Comprar", for: .normal)
            compraAtiva = false
            cotacaoAtual = (ultData?[String(self.cont)] ?? 0)
            //print("Cotação no inicio: \(cotacao)")
            //print("Contação no inicio: \(cotacaoAtual)")
            
            if (cotacao > cotacaoAtual){
                lose = cotacao - cotacaoAtual
                //self.carteira -= lose
                retorno = investimento - lose
                
                //Alert
                let alert = UIAlertController(title: "Fim do trade", message: "Que pena! Seu investimento foi de \(investimento); Seu retorno foi de \(retorno); Você perdeu \(lose)", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Ok!", style: .default)
                alert.addAction(restartAction)
                present(alert, animated: true, completion: nil)
            } else {
                won = cotacaoAtual - cotacao
                //self.carteira += won
                retorno = investimento + won
                
                //Alert
                let alert = UIAlertController(title: "Fim do trade", message: "Que legal! Seu investimento foi de \(investimento); Seu retorno foi de \(retorno); Você lucrou \(abs(won))", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Ok!", style: .default)
                alert.addAction(restartAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    //Função para atualizar o grafico
    func updateGraph(_ newData: [String:Int]){
        let x: CGFloat = 10
        let y: CGFloat = 10
        let width = self.graphline.frame.width
        let height = self.graphline.frame.height
        
        if (self.myData.count == 9){
            self.myData.remove(at: 0)
            self.myData.append(newData)
        } else {
            self.myData.append(newData)
        }
        
        
        let graph = GraphView(frame: CGRect(x: x, y: y, width: width-x*2, height: height * 0.5), data: myData )
        self.graph.removeFromSuperview()
        self.graph = graph
        self.graphline.addSubview(graph)
    }
    
    func startGraph(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(runGraph)), userInfo: nil, repeats: true)
    }
    
    @objc func runGraph(){
        let listnewData = self.futureList
        var valor = 0;
        let ultData = self.myData.last
        
        //ultData?[String(self.myData.count)] ultimo valor do dicionario
        let random = Int.random(in: 0..<listnewData.count)
        let randomInt = Int.random(in: 0..<9)
        
        if (randomInt < 5){
            //valorização
            valor = (ultData?[String(self.cont)] ?? 0) + listnewData[random]
        } else {
            //desvalorização
            valor = (ultData?[String(self.cont)] ?? 0) - listnewData[random]
        }
        
        let hora = String(self.cont + 1)
        
        if (valor < 0){
            valor = 0
        }
        
        let newData = [hora:valor]
        self.cont += 1;
        
        updateGraph(newData)
        
    }
}
