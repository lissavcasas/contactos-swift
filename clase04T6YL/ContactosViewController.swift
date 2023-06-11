//
//  ContactosViewController.swift
//  clase04T6YL
//
//  Created by iMundo on 11/06/23.
//

import UIKit

struct Contacto {
    var nombre: String
    var telefono: Int
}

class ContactosViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var contactosTableView: UITableView!
    
    var contactosList: [Contacto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactosTableView.dataSource = self

        contactosList.append(Contacto(nombre: "Juan Perez", telefono: 987987987)
        )
        
        contactosList.append(Contacto(nombre: "Marilyn Casas", telefono: 946295009)
        )
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func abrirAlertaRegistro(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactosList.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "contactoCell", for: indexPath) as! ContactoTableViewCell
//
//        let contacto = contactosList[indexPath.row]
//
//        cell.nombreApellidoLabel.text = contacto.nombre
//        cell.telefonoLabel.text = String(contacto.telefono)
//
//        return cell
//    }
//
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "contactoCell", for: indexPath) as! ContactoTableViewCell

        let contacto = contactosList[indexPath.row]

        cell.nombreApellidoLabel.text = contacto.nombre

        cell.telefonoLabel.text = String(contacto.telefono)

        return cell
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
