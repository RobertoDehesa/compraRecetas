//
//  Cesta.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 20/3/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import Foundation
import CoreData

class Cesta: NSManagedObject {

    @NSManaged var aviso_localizacion: NSNumber
    @NSManaged var comentarios: String
    @NSManaged var fechahora_creacion: NSDate
    @NSManaged var idcesta: NSNumber
    @NSManaged var nombre: String
    @NSManaged var orden: NSNumber
    @NSManaged var tienda_id: NSNumber
    @NSManaged var newRelationship: Tienda
    @NSManaged var newRelationship1: NSSet

}
