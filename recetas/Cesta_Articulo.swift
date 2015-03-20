//
//  Cesta_Articulo.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 20/3/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import Foundation
import CoreData

class Cesta_Articulo: NSManagedObject {

    @NSManaged var articulo_id: NSNumber
    @NSManaged var cantidad: String
    @NSManaged var cesta_id: NSNumber
    @NSManaged var comprado: NSNumber
    @NSManaged var idcesta_articulo: NSNumber
    @NSManaged var orden: NSNumber
    @NSManaged var newRelationship: Cesta
    @NSManaged var newRelationship1: Articulo

}
