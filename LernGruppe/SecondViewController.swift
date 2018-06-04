//
//  SecondViewController.swift
//  LernGruppe
//
//  Created by BulBul on 30.05.18.
//  Copyright © 2018 BulBul. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController {
    @IBOutlet weak var Userlabel: UILabel!
    var docRef: DocumentReference!
    
    @IBOutlet weak var TextEintrag: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Userlabel.text = EintragListe[myindex]
        docRef = Firestore.firestore().collection("Lerngruppen").document(EintragListe[myindex])

        
   
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                self.TextEintrag.text = dataDescription
                //
            } else {
                print("Document does not exist")
            }
        }
        
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
