//
//  AulaViewController.swift
//  BitLearning
//
//  Created by Aluno Mack on 10/10/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import UIKit

class AulaViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgAula1: UIImageView!
    @IBOutlet weak var imgAula2: UIImageView!
    @IBOutlet weak var labelText1: UILabel!
    @IBOutlet weak var labelText2: UILabel!
    
    var selectedTitle: String!
    var selectedImage: UIImage?
    var selectedImage2:UIImage?
    var selectedText1: String!
    var selectedLabel2:String!
    
    override func viewWillAppear(_ animated: Bool) {
            self.navigationController?.isNavigationBarHidden = false;
           
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedTitle
        imgAula1.image = selectedImage
        labelText1.text = selectedText1
        imgAula2.image = selectedImage2
        labelText2.text = "A tecnologia por trás do Bitcoin e de várias criptomoedas é chamada de Blockchain, ela nasceu juntamente com o Bitcoin."

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
