//
//  Session.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 10/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

final class Session {
    
    static var shared = Session()
    
    // Variable que utilizamos para identificar al usuario una vez se ha logado.
    var user: String = ""
    
}
