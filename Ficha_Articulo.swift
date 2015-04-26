//
//  Ficha_Articulo.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 26/4/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import Foundation
import CoreData

class Ficha_Articulo: NSManagedObject {

    @NSManaged var articulo_id: NSNumber
    @NSManaged var fechahora_ultimamod: NSDate
    @NSManaged var idficha_articulo: NSNumber
    @NSManaged var observaciones: String
    @NSManaged var precio: NSDecimalNumber
    @NSManaged var tienda_id: NSNumber
    @NSManaged var newRelationship: Tienda
    @NSManaged var newRelationship1: Articulo

}
