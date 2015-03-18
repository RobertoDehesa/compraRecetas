//
//  CTienda.swift
//  recetas
//
//  Created by Eugenia Perez Velasco on 18/3/15.
//  Copyright (c) 2015 Roberto Dehesa. All rights reserved.
//

import Foundation
import CoreData

class CTienda: NSManagedObject {

    @NSManaged var idtienda: NSNumber
    @NSManaged var nombre: String
    @NSManaged var direccion: String
    @NSManaged var poblacion: String
    @NSManaged var localizacion_latitud: NSDecimalNumber
    @NSManaged var localizacion_longitud: NSDecimalNumber
    @NSManaged var newRelationship: NSSet

}
