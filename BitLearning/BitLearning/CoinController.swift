//
//  CoinController.swift
//  BitLearning
//
//  Created by Aluno Mack on 08/10/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import UIKit

class CoinController: UIViewController {

    @IBOutlet weak var btncompra: RoundButton!
    @IBOutlet weak var btnvenda: RoundButton!
    @IBOutlet weak var graphline: UIView!
    @IBOutlet weak var lbinvest: UILabel!
    @IBOutlet weak var lbretorno: UILabel!
    @IBOutlet weak var lbcotacaoatual: UILabel!
    @IBOutlet weak var valcarteira: UILabel!
    
    
    var timer = Timer();
    var myData = [["1": 150], ["2" : 151]]
    var graph:UIView!
    var cont = 2;
    var futureList = [0,1,2,3,4,5,6,10]
    var usuario = Usuario(valorcarteira: 1000)
    
    var compraAtiva = false;
    var vendaAtiva = false;
    var cotacao = 0;
    var cotacaoAtual = 0;
    var investimento = 100;

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let x: CGFloat = 10
        let y: CGFloat = 10
        let width = self.graphline.frame.width
        let height = self.graphline.frame.height
        
        graph = GraphView(frame: CGRect(x: x, y: y, width: width-x*2, height: height * 0.5), data: myData )
        
        self.graphline.addSubview(graph)
        
        lbinvest.text = String(investimento);
        valcarteira.text = String(usuario.carteira)
        
        startGraph()
    }
    
    @IBAction func invest100(_ sender: Any) {
        if (usuario.carteira - 100 >= 0) {
            investimento = 100;
            lbinvest.text = String(investimento);
        } else {
            let alert = UIAlertController(title: "Saldo insuficiente", message: "Que pena! Você não possue saldo suficiente", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Ok!", style: .default)
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func invest200(_ sender: Any) {
        investimento = 200;
        lbinvest.text = String(investimento)
        
    }
    
    @IBAction func invest300(_ sender: Any) {
        investimento = 300;
        lbinvest.text = String(investimento);
    }
    
    
    @IBAction func vender(_ sender: Any) {
        if(usuario.carteira - investimento >= 0){
            let ultData = self.myData.last;
            var retorno = 0;
            var lose = 0;
            var won = 0;
            if (vendaAtiva == false){
                // Inicio do trade de venda
                btnvenda.setTitle("Fechar Venda", for: .normal)
                btnvenda.titleLabel?.font = UIFont(name: "System", size: 26.0)
                vendaAtiva = true
                
                usuario.carteira -= investimento
                valcarteira.text = String(usuario.carteira)
                
                cotacao = (ultData?[String(self.cont)] ?? 0)
                
            } else {
                // Fim do trade de compra
                btnvenda.setTitle("Vender", for: .normal)
                btnvenda.titleLabel?.font = UIFont(name: "System", size: 26.0)
                vendaAtiva = false
                
                cotacaoAtual = (ultData?[String(self.cont)] ?? 0)
                //print("Cotação no inicio: \(cotacao)")
                //print("Contação no inicio: \(cotacaoAtual)")
                
                if (cotacao < cotacaoAtual){
                    lose = cotacao - cotacaoAtual
                    //self.carteira -= lose
                    retorno = investimento - lose
                    let res = investimento + lose
                    usuario.carteira += res
                    valcarteira.text = String(usuario.carteira)
                    
                    //Alert
                    let alert = UIAlertController(title: "Fim do trade", message: "Que pena! Seu investimento foi de \(investimento); Seu retorno foi de \(retorno); Você perdeu \(abs(lose))", preferredStyle: .alert)
                    let restartAction = UIAlertAction(title: "Ok!", style: .default)
                    alert.addAction(restartAction)
                    present(alert, animated: true, completion: nil)
                } else {
                    won = cotacaoAtual - cotacao
                    //self.carteira += won
                    retorno = investimento + won
                    let res = investimento + won
                    usuario.carteira += res
                    valcarteira.text = String(usuario.carteira)
                    
                    //Alert
                    let alert = UIAlertController(title: "Fim do trade", message: "Que legal! Seu investimento foi de \(investimento); Seu retorno foi de \(retorno); Você lucrou \(abs(won))", preferredStyle: .alert)
                    let restartAction = UIAlertAction(title: "Ok!", style: .default)
                    alert.addAction(restartAction)
                    present(alert, animated: true, completion: nil)
                }
                lbretorno.text = "---"
            }
        } else {
            let alert = UIAlertController(title: "Saldo insuficiente", message: "Que pena! Você não possue saldo suficiente", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Ok!", style: .default)
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func comprar(_ sender: Any) {
        if(usuario.carteira - investimento >= 0){
            let ultData = self.myData.last;
            var retorno = 0;
            var lose = 0;
            var won = 0;
            if (compraAtiva == false){
                // Inicio do trade de compra
                btncompra.setTitle("Fechar compra", for: .normal)
                btncompra.titleLabel?.font = UIFont(name: "System", size: 20)
                compraAtiva = true
                
                usuario.carteira -= investimento
                valcarteira.text = String(usuario.carteira)
                
                cotacao = (ultData?[String(self.cont)] ?? 0)
                
            } else {
                // Fim do trade de compra
                btncompra.setTitle("Comprar", for: .normal)
                btncompra.titleLabel?.font = UIFont(name: "System", size: 26.0)
                compraAtiva = false
                cotacaoAtual = (ultData?[String(self.cont)] ?? 0)
                //print("Cotação no inicio: \(cotacao)")
                //print("Contação no inicio: \(cotacaoAtual)")
                
                if (cotacao > cotacaoAtual){
                    lose = cotacao - cotacaoAtual
                    //self.carteira -= lose
                    retorno = investimento - lose
                    
                    usuario.carteira += retorno
                    valcarteira.text = String(usuario.carteira)
                    //Alert
                    let alert = UIAlertController(title: "Fim do trade", message: "Que pena! Seu investimento foi de \(investimento); Seu retorno foi de \(retorno); Você perdeu \(abs(lose))", preferredStyle: .alert)
                    let restartAction = UIAlertAction(title: "Ok!", style: .default)
                    alert.addAction(restartAction)
                    present(alert, animated: true, completion: nil)
                } else {
                    won = cotacaoAtual - cotacao
                    //self.carteira += won
                    retorno = investimento + won
                    
                    usuario.carteira += retorno
                    valcarteira.text = String(usuario.carteira)
                    
                    //Alert
                    let alert = UIAlertController(title: "Fim do trade", message: "Que legal! Seu investimento foi de \(investimento); Seu retorno foi de \(retorno); Você lucrou \(abs(won))", preferredStyle: .alert)
                    let restartAction = UIAlertAction(title: "Ok!", style: .default)
                    alert.addAction(restartAction)
                    present(alert, animated: true, completion: nil)
                }
                lbretorno.text = "---"
            }
        }else {
            let alert = UIAlertController(title: "Saldo insuficiente", message: "Que pena! Você não possue saldo suficiente", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Ok!", style: .default)
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
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
        
        if(compraAtiva == true){
            if (cotacao > valor){
                let resparcial = valor - cotacao
                lbretorno.text = String(resparcial)
            } else {
                let resparcial = valor - cotacao
                lbretorno.text = String(resparcial)
            }
        }
        if(vendaAtiva == true){
            if (cotacao < valor){
                let resparcial = valor - cotacao
                lbretorno.text = "-\(String(resparcial))"
            } else {
                let resparcial = valor - cotacao
                lbretorno.text = String(abs(resparcial))
            }
        }
        lbcotacaoatual.text = String(valor)
            
        }
}
