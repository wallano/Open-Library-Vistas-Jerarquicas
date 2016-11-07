//
//  Libros.swift
//  VistasJerarquicasOpenLibrary
//
//  Created by Walter Llano on 05/11/16.
//  Copyright © 2016 Walter Llano. All rights reserved.//

import Foundation

struct Libro
{
    var titulo : String = ""
    var autores : String = ""
    var portada : String = ""
    var isbn : String = ""
    
    init(titulo: String, autores: String, portada: String, isbn: String)
    {
        self.titulo = titulo
        self.autores = autores
        self.portada = portada
        self.isbn = isbn
    }
    
    init()
    {}
}

var libros = [Libro]()
