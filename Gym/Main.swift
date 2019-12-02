//
//  Main.swift
//  Gym
//
//  Created by user on 3/12/2019.
//  Copyright © 2019 00557052. All rights reserved.
//

import SwiftUI

struct Main: View {
    var body: some View {
                TabView{
            GymList()
                .tabItem{
                    Image(systemName:"house.fill")
                    Text("主頁")
                }
            PieChartView(percentages: [10, 40, 50])
                .tabItem {
                      Image(systemName: "questionmark")
                      Text("卡路里分析")
                }
                CircleView()
            .tabItem {
                  Image(systemName: "questionmark")
                  Text("卡路里分析2")
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
