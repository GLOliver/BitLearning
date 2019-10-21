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
    
    var myData = [["1": 15]]
    var graph:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let x: CGFloat = 10
        let y: CGFloat = 10
        let width = self.graphline.frame.width
        let height = self.graphline.frame.height
        
        myData.append(["2" : 30])
        myData.append(["3" : 7])
        myData.append(["4" : 65])
        myData.append(["5" : 30])
        
        
        graph = GraphView(frame: CGRect(x: x, y: y, width: width-x*2, height: height * 0.5), data: myData )
        
        self.graphline.addSubview(graph)
        
    }
    @IBAction func vender(_ sender: Any) {
        
        var newVenda = [String:Int]()
        let ultData = self.myData.last
        
        let hora = String(self.myData.count + 1)
        let valor = (ultData?[String(self.myData.count)] ?? 0) - 10
        newVenda = [hora:valor]
        
        
        self.myData.append(newVenda)
        
        let x: CGFloat = 10
        let y: CGFloat = 10
        let width = self.graphline.frame.width
        let height = self.graphline.frame.height
        
        let graph = GraphView(frame: CGRect(x: x, y: y, width: width-x*2, height: height * 0.5), data: myData )
        self.graph.removeFromSuperview()
        self.graph = graph
        self.graphline.addSubview(graph)
//        guard let graph = graph as? GraphView else { return }
//        graph.data = self.myData
//        graph.setNeedsDisplay()
    }
    
    
    @IBAction func comprar(_ sender: Any) {
        
        var newVenda = [String:Int]()
        let ultData = self.myData.last
        
        let hora = String(self.myData.count + 1)
        let valor = (ultData?[String(self.myData.count)] ?? 0) + 10
        newVenda = [hora:valor]
        
        
        self.myData.append(newVenda)
        
        let x: CGFloat = 10
        let y: CGFloat = 10
        let width = self.graphline.frame.width
        let height = self.graphline.frame.height
        
        let graph = GraphView(frame: CGRect(x: x, y: y, width: width-x*2, height: height * 0.5), data: myData )
        self.graph.removeFromSuperview()
        self.graph = graph
        self.graphline.addSubview(graph)
    }
}
