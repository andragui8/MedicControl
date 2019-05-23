//
//  MedicineModel.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import Firebase

struct MedicineModel {
    
    let ref: DatabaseReference?
    let key: String
    let name: String
    let composition: String
    let indications: String
    let posology: String
    let contraindications: String
    let warnings: String
    let precautions: String
    let overdosing: String
    
    init(name: String, key: String = "", composition: String = "", indications: String = "", posology: String = "", contraindications: String = "", warnings: String = "", precautions: String = "", overdosing: String = "") {
        self.ref = nil
        self.key = key
        self.name = name
        self.composition = composition
        self.indications = indications
        self.posology = posology
        self.contraindications = contraindications
        self.warnings = warnings
        self.precautions = precautions
        self.overdosing = overdosing
    }
    
    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: AnyObject],
            let name = value["name"] as? String,
            let composition = value["composition"] as? String,
            let indications = value["indications"] as? String,
            let posology = value["posology"] as? String,
            let contraindications = value["contraindications"] as? String,
            let warnings = value["warnings"] as? String,
            let precautions = value["precautions"] as? String,
            let overdosing = value["overdosing"] as? String else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.name = name
        self.composition = composition
        self.indications = indications
        self.posology = posology
        self.contraindications = contraindications
        self.warnings = warnings
        self.precautions = precautions
        self.overdosing = overdosing
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "composition": composition,
            "indications": indications,
            "posology": posology,
            "contraindications": contraindications,
            "warnings": warnings,
            "precautions": precautions,
            "overdosing": overdosing
        ]
    }
    
}
