//
//  LoginRequest.swift
//  clase04T6YL
//
//  Created by iMundo on 25/06/23.
//

import Foundation

struct LoginRequest : Encodable {
    var correo: String
    var clave: String
}

struct LoginResponse :  Decodable {
    var nombre: String
    var apellido: String
    var dni: Int
}
