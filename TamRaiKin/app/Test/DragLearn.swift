//
//  DragLearn.swift
//  Test
//
//  Created by admin on 22/6/2567 BE.
//

import SwiftUI
import SwiftData

struct DragLearn: View {
    
    @State var DraggableShape: [DraggableClass]

    @State var notCollision: Bool = false
    
    func reload() {
        DraggableShape.removeAll()
        Cache.cache.removeAll()
        let food = FoodData.randomFood().first
        Cache.foodName = food.unsafelyUnwrapped.key
        for item in food.unsafelyUnwrapped.value {
            let image: String = FoodData.images[item] ?? ""
            Cache.cache.append(DraggableClass(name: item, image: image))
        }
        DraggableShape = Cache.cache
        print("test")
    }
    
    var xPosCircle: CGFloat = 73.0
    var yPosCircle: CGFloat = 220.0
    
    func getPoint(_ view : UIView) -> (x: CGFloat, y: CGFloat) {
        let x = view.frame.origin.x
        let y = view.frame.origin.y
        return (x, y)
    }
    
    func checkCook() {
        self.notCollision = false
        for shape in DraggableShape {
            print(abs(xPosCircle - shape.position.x))
            if abs(xPosCircle - shape.position.x) >= 0 && abs(xPosCircle - shape.position.x) <= 160 && abs(yPosCircle - shape.position.y) >= 0  && abs(yPosCircle - shape.position.y) <= 160  {
                print("cool")
            } else {
                print(abs(xPosCircle - shape.position.x))
                print(abs(yPosCircle - shape.position.y))
                self.notCollision = true
            }
        }
        
    }
    
    var body: some View {
        ZStack {
            Text("Merge Some Foods")
                .font(
                    .custom(
                    "AmericanTypewriter",
                    fixedSize: 32)
                    .weight(.bold)

                ).offset(CGSize(width: 0, height: -340))
            VStack {
                VStack {
                    ForEach(DraggableShape) { drag in
                        DraggableItem(item: drag).position(CGPoint(x: Int.random(in: 50...350), y: Int.random(in: 50...100)))
                    }
                    Spacer()
                }.zIndex(1)
                VStack {
                    Circle()
                        .fill(.orange)
                        .position(CGPoint(x: xPosCircle, y: yPosCircle))
                        .frame(width: 150)
                    HStack {
                        Button {
                            self.reload()
                        } label: {
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .fill(.orange)
                                        .frame(width: 150, height: 50)
                                        .cornerRadius(10)
                                    Text("Re - random")
                                        .padding()
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        Button {
                            self.checkCook()
                        } label: {
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .fill(.green)
                                        .frame(width: 150, height: 50)
                                        .cornerRadius(10)
                                    Text("Cook!")
                                        .padding()
                                        .foregroundColor(.black)
                                }
                            }
                        }.sheet(isPresented: $notCollision, content: {
                            ShowFood()
                        })
                    }
                }
            }
        }
        
    }
}

#Preview {
    DragLearn(DraggableShape: Cache.cache)
}
