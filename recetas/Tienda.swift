//
//  Tienda.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 20/3/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import Foundation
import CoreData

class Tienda: NSManagedObject {

    @NSManaged var direccion: String
    @NSManaged var idtienda: NSNumber
    @NSManaged var localizacion_latitud: NSDecimalNumber
    @NSManaged var localizacion_longitud: NSDecimalNumber
    @NSManaged var nombre: String
    @NSManaged var poblacion: String
    @NSManaged var newRelationship: NSSet

}
