//
//  BuscadorResponse.swift
//  clase04T6YL
//
//  Created by iMundo on 25/06/23.
//

import Foundation

struct BuscadorResponse: Decodable {
    let total: String
    let page: String
    let books: [LibroResponse]
}

struct LibroResponse: Decodable {
    let title: String
    let subtitle: String
    let isbn13: String
    let price: String
    let image: String
    let url: String
}
