//
//  ShowFood.swift
//  Test
//
//  Created by admin on 23/6/2567 BE.
//

import SwiftUI

struct ShowFood: View {
    var body: some View {
        VStack {
            Text("Result")
                .font(
                    .custom(
                    "AmericanTypewriter",
                    fixedSize: 32)
                    .weight(.bold)

                )
            Image(Cache.foodName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            Text(Cache.foodName)
                .font(
                    .custom(
                    "AmericanTypewriter",
                    fixedSize: 32)
                    .weight(.bold)

                ).padding(.horizontal)
            
            Text("If you can't decide what to eat, try this!")
                .font(.title3)
            
        }
    }
}

#Preview {
    ShowFood()
}
