//
//  NewsModel.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 01/09/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import Firebase

struct NewsModel {
	
	let ref: DatabaseReference?
	let key: String
	let titulo: String
	let descripcion: String
	let texto: String
	
	init(key: String = "", titulo: String, descripcion: String, texto: String) {
		self.ref = nil
		self.key = key
		self.titulo = titulo
		self.descripcion = descripcion
		self.texto = texto
	}
	
	init?(snapshot: DataSnapshot) {
		guard let value = snapshot.value as? [String: AnyObject],
			let titulo = value["Titulo"] as? String,
			let descripcion = value["Descripcion"] as? String,
			let texto = value["Texto"] as? String
			else {
				return nil
		}
		
		self.ref = snapshot.ref
		self.key = snapshot.key
		self.titulo = titulo
		self.descripcion = descripcion
		self.texto = texto
	}
	
	func toAnyObject() -> Any {
		return [
			"Titulo": titulo,
			"Descripcion": descripcion,
			"Texto": texto
		]
	}
}
