//
//  DraggableStruct.swift
//  Test
//
//  Created by admin on 22/6/2567 BE.
//

import Foundation
import SwiftData

class DraggableClass: Identifiable {
    var id: UUID
    var name: String
    var image: String
    
    var offset: CGSize = CGSize.zero
    var scale: Double = 1.0
    var size: CGFloat = 100
    
    var position: CGPoint = CGPoint.zero
    
    init(name: String, image: String) {
        self.id = UUID()
        self.name = name
        self.image = image
    }
}
