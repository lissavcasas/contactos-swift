//
//  ContactoDetalleViewController.swift
//  clase04T6YL
//
//  Created by iMundo on 25/06/23.
//

import UIKit

class ContactoDetalleViewController: UIViewController {

    
    @IBOutlet weak var nombreContactoLabel: UILabel!
    
    @IBOutlet weak var numeroContactoLabel: UILabel!
    
    var nombre: String = ""
    var telefono: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nombreContactoLabel.text = nombre
        numeroContactoLabel.text = telefono
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
