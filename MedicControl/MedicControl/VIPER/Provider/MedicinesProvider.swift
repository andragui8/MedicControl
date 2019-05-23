//
//  MedicinesProvider.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import Firebase

protocol MedicinesProviderProtocol {
    func insertMedicine(dto: MedicineInsertServiceDTO, success: @escaping(String?) -> Void, failure: @escaping(NSError) -> Void)
    func getMedicines(dto: MedicinesGetServiceDTO, success: @escaping ([MedicineModel]) -> Void, failure: @escaping (NSError) -> Void)
    func insertMedicineIntoUser(dto: MedicineUserInsertServiceDTO, success: @escaping(String?) -> Void, failure: @escaping(NSError) -> Void)
    func getMedicinesFromUser(dto: MedicinesUserGetServiceDTO, success: @escaping ([MedicinesUserModel]) -> Void, failure: @escaping (NSError) -> Void)
}

class MedicinesProvider: BaseProvider, MedicinesProviderProtocol {
    
    internal func insertMedicine(dto: MedicineInsertServiceDTO, success: @escaping (String?) -> Void, failure: @escaping (NSError) -> Void) {
        
        guard let ref = self.getReferenceForMedicines() else {
            failure(NSError())
            return
        }
        
        let medicineItem = MedicineModel(name: dto.name, composition: dto.composition, indications: dto.indications, posology: dto.posology, contraindications: dto.contraindications, warnings: dto.warnings, precautions: dto.precautions, overdosing: dto.overdosing)
        //Añadimos un hijo con el nombre de la farmacia
        let medicineItemRef = ref.child(dto.name.lowercased())
        
        medicineItemRef.setValue(medicineItem.toAnyObject())
        success("Se ha añadido una medicina a la lista de medicinas")
    }
    
    internal func getMedicines(dto: MedicinesGetServiceDTO, success: @escaping ([MedicineModel]) -> Void, failure: @escaping (NSError) -> Void) {
        guard let ref = self.getReferenceForMedicines() else {
            failure(NSError())
            return
        }
        
        let dataBaseReference = ref.child(dto.name)
        dataBaseReference.observeSingleEvent(of: .value, with: { snapshot in
            var medicines: [MedicineModel] = []
        
            if let medicineItem = MedicineModel(snapshot: snapshot) {
                medicines.append(medicineItem)
            }
            
            success(medicines)
        })
    }
    
    func insertMedicineIntoUser(dto: MedicineUserInsertServiceDTO, success: @escaping (String?) -> Void, failure: @escaping (NSError) -> Void) {
        guard let ref = self.getReferenceForUserMedicines() else {
            failure(NSError())
            return
        }
        
        let childUserRef = ref.child(dto.userName.lowercased())
        
        let medicineUserItem = MedicinesUserModel(userName: dto.userName, tabletNameKey: dto.tabletNameKey, tabletNameReal: dto.tabletNameReal, numberOfTablets: dto.numberOfTablets, remainingTablets: dto.remainingTablets)
        //Añadimos un hijo con el nombre de la farmacia
        let medicineUserItemRef = childUserRef.child(dto.tabletNameKey.lowercased())
        
        medicineUserItemRef.setValue(medicineUserItem.toAnyObject())
        success("Se ha añadido una medicina a la lista de medicinas del usuario")
    }
    
    internal func getMedicinesFromUser(dto: MedicinesUserGetServiceDTO, success: @escaping ([MedicinesUserModel]) -> Void, failure: @escaping (NSError) -> Void) {
        guard let ref = self.getReferenceForUserMedicines() else {
            failure(NSError())
            return
        }
        
        let dataBaseReference = ref.child(dto.userName.lowercased())
        dataBaseReference.observe(.value, with: { snapshot in
            
            var medicinesFromUser: [MedicinesUserModel] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let medicineFromUserItem = MedicinesUserModel(snapshot: snapshot) {
                    medicinesFromUser.append(medicineFromUserItem)
                }
            }
            success(medicinesFromUser)
        })
    }
}

struct MedicineInsertServiceDTO {
    let name: String
    let composition: String
    let indications: String
    let posology: String
    let contraindications: String
    let warnings: String
    let precautions: String
    let overdosing: String
}

struct MedicinesGetServiceDTO {
    let name: String
}

struct MedicineUserInsertServiceDTO {
    let userName: String
    let tabletNameKey: String
    let tabletNameReal: String
    let numberOfTablets: Int
    let remainingTablets: Int
}

struct MedicinesUserGetServiceDTO {
    let userName: String
}
