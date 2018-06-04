//
//  ErstellenViewController.swift
//  LernGruppe
//
//  Created by BulBul on 31.05.18.
//  Copyright © 2018 BulBul. All rights reserved.
//

import UIKit
import Firebase

class ErstellenViewController: UIViewController {

    @IBOutlet weak var Instituttf: UITextField!
    @IBOutlet weak var Fachtf: UITextField!
    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var Suchtexrt: UITextView!
    var docRef: CollectionReference!
   
    
    @IBAction func SaveEntry(_ sender: Any) {
        
        docRef.document(Fachtf.text!).setData([
            "Institution": Instituttf.text,
            "Text": Suchtexrt.text,
            "User": NameTF.text
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        performSegue(withIdentifier: "backtoHome", sender: self)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        docRef = Firestore.firestore().collection("Lerngruppen")

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
