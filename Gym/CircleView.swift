//
//  CircleView.swift
//  Gym
//
//  Created by user on 3/12/2019.
//  Copyright © 2019 00557052. All rights reserved.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        VStack{
            Text("消耗卡路里分析")
                           .font(.title)
                       .foregroundColor(Color.blue)
        ZStack{
        Circle()
            .trim(from: 0 , to: 0.2)
        .stroke(Color.orange, lineWidth: 30)
            Circle()
                .trim(from: 0.2 , to: 0.5)
                  .stroke(Color.red, lineWidth: 30)
            Circle()
                .trim(from: 0.5 , to: 1)
                  .stroke(Color.purple, lineWidth: 30)
       
        } .frame(width: 300, height: 300)
            .padding()
        Text("橙色：深蹲")
        .foregroundColor(Color.orange)
        Text("紫色：划船")
        .foregroundColor(Color.purple)
        Text("紅色：跑步")
        .foregroundColor(Color.red)
    }
        }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
