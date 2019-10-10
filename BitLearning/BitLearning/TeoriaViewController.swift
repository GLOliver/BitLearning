//
//  TeoriaViewController.swift
//  BitLearning
//
//  Created by Aluno Mack on 10/10/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import UIKit

class TeoriaViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    struct Article {
        
        var articleName : String!
        var articleImg : UIImage
        var articleSubText: String
        var articlePublished: String
        var articleLabel1: String!
        var image2: UIImage
        
    }
    
    
    var articles = [Article]()
    
    func loadArticles() {
        guard let articleImage1 = UIImage(named: "coins") else { return}
        guard let articleImage2 = UIImage(named: "coins") else { return }
        
        var article1 = Article(articleName: "O QUE SÃO CRIPTOMOEDAS", articleImg: articleImage1, articleSubText: "Artigo introdutório sobre criptomoedas", articlePublished: "08-10-2019", articleLabel1: "Criptomoedas são uma espécie de dinheiro virtual que não possui centralização de nenhum governo ou banco e usa funções criptográficas para o seu funcionamento. Mesmo não possuindo uma autoridade central, há segurança e consenso feito pela própria comunidade: não há como mudar os dados sem que todos saibam, é como se fosse um livro-razão de contabilidade, com entradas e saídas. Uma das criptomoedas mais conhecidas é o Bitcoin.", image2: articleImage2)
        
        var article2 = Article(articleName: "HISTÓRIA DAS CRIPTOMOEDAS", articleImg: articleImage2, articleSubText: "Artigo introdutório sobre criptomoedas 2", articlePublished: "08-10-2019", articleLabel1: "UM BREVE HISTÓRICO DAS CRIPTOMOEDAS", image2: articleImage2)
        
        articles += [article1, article2]
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articles.count;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let row = indexPath.row;
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ViewCollectionViewCell;

        
        cell.labelTitle.text = articles[row].articleName
        cell.imageViewCenter.image = articles[row].articleImg
        cell.labelSubText.text = articles[row].articleSubText
        
        //if let title = row as? String{
           // cell.labelTitle.text = title;
        //}
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.size.width
        return CGSize(width: cellWidth, height: cellWidth*0.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showAula", sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            AulaViewController, let index =
            collectionView.indexPathsForSelectedItems?.first {
            destination.selectedTitle = articles[index.row].articleName
            
            destination.selectedImage = articles[index.row].articleImg
            
            destination.selectedText1 = articles[index.row].articleLabel1
            
            destination.selectedImage2 = articles[index.row].image2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("load teoria")
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(UINib(nibName: "ViewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell");
        
        loadArticles()
    }

}
