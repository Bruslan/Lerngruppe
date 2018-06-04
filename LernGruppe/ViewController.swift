//
//  ViewController.swift
//  LernGruppe
//
//  Created by BulBul on 30.05.18.
//  Copyright © 2018 BulBul. All rights reserved.
//

import UIKit
import Firebase

var EintragListe : [String] = []
var InstListe: [String] = []
var myindex = 0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EintragListe.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tabelle.dequeueReusableCell(withIdentifier: "customCell") as! customTableViewCell
       
        
        
        cell.cellName.text = EintragListe[indexPath.row]
        cell.Institutionlabel.text = InstListe[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myindex = indexPath.row
        performSegue(withIdentifier: "cellSegue", sender: self)
    }
    
    
    
    var Username : String = ""

    @IBOutlet weak var Tabelle: UITableView!

    
  

    
    var docRef: CollectionReference!
    var listener: ListenerRegistration!
    
    
  
    
    
    

override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listener = docRef.addSnapshotListener(includeMetadataChanges: true) { (docSnapshot, error) in
            guard let docSnapshot = docSnapshot else {return}
            let myData = docSnapshot.documents
            
            EintragListe.removeAll()
            InstListe.removeAll()
            
            for data in myData
            {
            
            print(data.documentID, data.data())
                EintragListe.append(data.documentID)
                guard let institutionfromData = data.data()["Institution"]  else {return}
                InstListe.append(institutionfromData as! String)
                
            }
            self.Tabelle.reloadData()
            

        }
      
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Tabelle.delegate = self
        Tabelle.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        
        docRef = Firestore.firestore().collection("Lerngruppen")

        
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        listener.remove()
    }




}

