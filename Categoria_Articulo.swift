//
//  Categoria_Articulo.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 26/4/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import Foundation
import CoreData

class Categoria_Articulo: NSManagedObject {

    @NSManaged var idcategoria: NSNumber
    @NSManaged var nombre: String
    @NSManaged var newRelationship: NSSet

}
