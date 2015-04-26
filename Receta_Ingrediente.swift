//
//  Receta_Ingrediente.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 26/4/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import Foundation
import CoreData

class Receta_Ingrediente: NSManagedObject {

    @NSManaged var articulo_id: NSNumber
    @NSManaged var cantidad: String
    @NSManaged var cesta_id: NSNumber
    @NSManaged var idreceta_ingrediente: NSNumber
    @NSManaged var orden: NSNumber
    @NSManaged var receta_id: NSNumber
    @NSManaged var newRelationship: Receta
    @NSManaged var newRelationship1: Articulo
    @NSManaged var newRelationship2: Cesta

}
