//
//  Receta.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 26/4/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import Foundation
import CoreData

class Receta: NSManagedObject {

    @NSManaged var categoria_id: NSNumber
    @NSManaged var dificultad: String
    @NSManaged var elaboracion: String
    @NSManaged var fechahora_creacion: NSDate
    @NSManaged var idreceta: NSNumber
    @NSManaged var imagen: String
    @NSManaged var nombre: String
    @NSManaged var raciones: String
    @NSManaged var tiempo: String
    @NSManaged var valoracion: NSNumber
    @NSManaged var newRelationship: Categoria_Receta
    @NSManaged var newRelationship1: NSSet

}
