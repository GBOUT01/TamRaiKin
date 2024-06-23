//
//  DraggableItem.swift
//  Test
//
//  Created by admin on 22/6/2567 BE.
//

import SwiftUI

struct DraggableItem: View {
    
    var item: DraggableClass
    
    @State var isDragging: Bool = false
    
    @State var offset: CGSize = CGSize.zero
    @State var scale: Double = 1.0
    @State var size: CGFloat = 100
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.isDragging = true
                print(value)
                offset = CGSize(width: value.startLocation.x + value.translation.width - size/2, height: value.startLocation.y + value.translation.height - size/2)
                withAnimation {
                    scale = 1.5
                }
                item.offset = offset
                item.position = value.location
            }
            .onEnded { _ in self.isDragging = false }
    }


    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray)
                .opacity(0.1)
                .frame(width: size, height: size)
                .offset(offset)
                .gesture(drag)
                .frame(width: size * scale, height: size * scale)
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
                .offset(offset)
                .gesture(drag)
                .frame(width: size * scale, height: size * scale)
        }
        
        
    }
}

#Preview {
    DraggableItem(item: DraggableClass(name: "crab", image: "crab"))
}
