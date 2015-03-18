//
//  CArticulo.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 18/3/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import Foundation
import CoreData

class CArticulo: NSManagedObject {

    @NSManaged var categoria_id: NSNumber
    @NSManaged var imagen: String
    @NSManaged var descripcion: String
    @NSManaged var nombre: String
    @NSManaged var idarticulo: NSNumber
    @NSManaged var newRelationship: NSSet

}
