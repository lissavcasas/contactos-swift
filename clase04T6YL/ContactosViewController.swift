//
//  ContactosViewController.swift
//  clase04T6YL
//
//  Created by iMundo on 11/06/23.
//

import UIKit
import CoreData

struct Contacto {
    var nombre: String
    var telefono: Int
}

class ContactosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var contactosTableView: UITableView!
    
    var contactosList: [Contacto] = []
    
    var contactoEntidadList : [ContactoEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactosTableView.dataSource = self
        contactosTableView.delegate = self
        
        listarContactos()
        
//        contactosList.append(Contacto(nombre: "Juan Perez", telefono: 987987987)
//        )
//
//        contactosList.append(Contacto(nombre: "Marilyn Casas", telefono: 946295009)
//        )
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func abrirAlertaRegistro(_ sender: Any) {
        var nombreTextField = UITextField()
        var numeroTextField = UITextField()
        
        let alerta = UIAlertController(title: "Registrar contacto", message: "Complete sus datos", preferredStyle: .alert)
        
        alerta.addTextField { alertTextField in alertTextField.placeholder = "Ingrese el nombre"
            nombreTextField = alertTextField
        }
        
        alerta.addTextField { alertTextField in alertTextField.placeholder = "Ingrese el teléfono"
            numeroTextField = alertTextField
        }
        
        let action = UIAlertAction(title: "Registrar", style: .default, handler: { action in
            //print("Registrar los datos del contacto")
            let nombre = nombreTextField.text
            let telefono = numeroTextField.text
            self.registrarContacto(nombre: nombre, telefono: telefono)
        })
        
        alerta.addAction(action)
        alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(alerta, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return contactosList.count
        return contactoEntidadList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactoCell", for: indexPath) as! ContactoTableViewCell
        
       // let contacto = contactosList[indexPath.row]
        let contacto = contactoEntidadList[indexPath.row]
        
        cell.nombreApellidoLabel.text = contacto.nombre
        
//        cell.telefonoLabel.text = String(contacto.telefono)
        cell.telefonoLabel.text = contacto.numero
        
        return cell
    }
    
//    func registrarContacto(nombre: String?, telefono: String?){
//        if let name = nombre, let phone = telefono {
//            let contacto = Contacto(nombre: name, telefono: Int(phone) ?? 0)
//            contactosList.append(contacto)
//            contactosTableView.reloadData()
//        }
//    }
    
    func registrarContacto(nombre: String?, telefono: String?){
        if let name = nombre, let phone = telefono {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let entidad = ContactoEntity(context: managedContext)
            entidad.nombre = name
            entidad.numero = phone
            
            do {
                try managedContext.save() // Guarda
                contactoEntidadList.append(entidad)
            } catch let Error as NSError{
                print("No fue posible guardar los datos \(Error),\(Error.userInfo) ")
            }
            
            contactosTableView.reloadData()
        }
    }
    
    func listarContactos(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            let results = try managedContext.fetch(ContactoEntity.fetchRequest())
                   contactoEntidadList = results as! [ContactoEntity]
        } catch let Error as NSError{
            print("No fue posible listar los datos \(Error),\(Error.userInfo) ")
        }
        
        contactosTableView.reloadData()
        
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
