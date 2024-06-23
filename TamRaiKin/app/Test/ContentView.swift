//
//  ContentView.swift
//  Test
//
//  Created by admin on 22/6/2567 BE.
//

import SwiftUI

struct ContentView: View {
    init() {
        let food = FoodData.randomFood().first
        Cache.foodName = food!.key
        for item in food!.value {
            let image: String = FoodData.images[item] ?? ""
            Cache.cache.append(DraggableClass(name: item, image: image))
        }
    }
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Image("Chef")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Text("TamRaiKin")
                    .font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 50)
                        .weight(.bold)

                    )
                    .offset(CGSize(width: 0, height: -50))
                NavigationLink {
                    DragLearn(DraggableShape: Cache.cache)
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(.black)
                            .frame(width: 210, height: 160)
                            .padding(3)
                            .background(.black)
                            .cornerRadius(25)
                        
                        Rectangle()
                            .fill(.orange)
                            .frame(width: 200, height: 150)
                            .padding(3)
                            .background(.orange)
                            .cornerRadius(25)
                            
                        Triangle()
                            .fill(.white)
                            .rotationEffect(.degrees(90))
                            .frame(width: 100, height: 100)
                    }
                }
            }
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

#Preview {
    ContentView()
}
