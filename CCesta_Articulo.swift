//
//  CCesta_Articulo.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 18/3/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import Foundation
import CoreData

class CCesta_Articulo: NSManagedObject {

    @NSManaged var idcesta_articulo: NSNumber
    @NSManaged var cesta_id: NSNumber
    @NSManaged var articulo_id: NSNumber
    @NSManaged var cantidad: String
    @NSManaged var comprado: NSNumber
    @NSManaged var orden: NSNumber
    @NSManaged var newRelationship: CCesta
    @NSManaged var newRelationship1: CArticulo

}
