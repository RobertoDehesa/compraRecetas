//
//  CCesta.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 18/3/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import Foundation
import CoreData

class CCesta: NSManagedObject {

    @NSManaged var tienda_id: NSNumber
    @NSManaged var aviso_localizacion: NSNumber
    @NSManaged var fechahora_creacion: NSDate
    @NSManaged var orden: NSNumber
    @NSManaged var comentarios: String
    @NSManaged var nombre: String
    @NSManaged var idcesta: NSNumber
    @NSManaged var newRelationship: CTienda
    @NSManaged var newRelationship1: NSSet

}
