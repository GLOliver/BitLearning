//
//  CoinController.swift
//  BitLearning
//
//  Created by Aluno Mack on 08/10/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import UIKit

class CoinController: UIViewController {

    @IBOutlet weak var graphline: UIView!
    
    var timer = Timer();
    var myData = [["1": 15], ["2" : 30]]
    var graph:UIView!
    var cont = 0;
    var futureList = [
        ["3":30],
        ["4":20],
        ["5":25],
        ["6":40],
        ["7":45],
        ["8":45],
        ["9":30],
        ["10":20],
        ["11":25],
        ["12":40],
        ["13":45],
        ["14":45],
        ["15":30],
        ["16":20],
        ["17":25],
        ["18":40],
        ["19":45],
        ["20":45]
    ]
    
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
        
        var newVenda = [String:Int]()
        let ultData = self.myData.last
        
        let hora = String(self.myData.count + 1)
        let valor = (ultData?[String(self.myData.count)] ?? 0) - 10
        newVenda = [hora:valor]
        
        updateGraph(newVenda)
        
        
//        self.myData.append(newVenda)
//
//        let x: CGFloat = 10
//        let y: CGFloat = 10
//        let width = self.graphline.frame.width
//        let height = self.graphline.frame.height
//
//        let graph = GraphView(frame: CGRect(x: x, y: y, width: width-x*2, height: height * 0.5), data: myData )
//        self.graph.removeFromSuperview()
//        self.graph = graph
//        self.graphline.addSubview(graph)
//        guard let graph = graph as? GraphView else { return }
//        graph.data = self.myData
//        graph.setNeedsDisplay()
    }
    
    
    @IBAction func comprar(_ sender: Any) {
        
        var newCompra = [String:Int]()
        let ultData = self.myData.last
        
        let hora = String(self.myData.count + 1)
        let valor = (ultData?[String(self.myData.count)] ?? 0) + 10
        newCompra = [hora:valor]
        
        
        updateGraph(newCompra)
        
    }
    
    func updateGraph(_ newData: [String:Int]){
        let x: CGFloat = 10
        let y: CGFloat = 10
        let width = self.graphline.frame.width
        let height = self.graphline.frame.height
        
        self.myData.append(newData)
        
        let graph = GraphView(frame: CGRect(x: x, y: y, width: width-x*2, height: height * 0.5), data: myData )
        self.graph.removeFromSuperview()
        self.graph = graph
        self.graphline.addSubview(graph)
    }
    
    func startGraph(){
        timer = Timer.scheduledTimer(timeInterval: 5, target: self,   selector: (#selector(runGraph)), userInfo: nil, repeats: true)
    }
    
    @objc func runGraph(){
        var listnewData = self.futureList
        
        var newData = listnewData[self.cont]
        print(listnewData)
        print(newData)
        self.cont += 1;
        updateGraph(newData)
        
    }
}
