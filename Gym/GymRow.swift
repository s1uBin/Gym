//
//  GymRow.swift
//  Gym
//
//  Created by user on 3/12/2019.
//  Copyright © 2019 00557052. All rights reserved.
//

import SwiftUI

struct GymRow: View {
    
    var gyms: Gymer

    var body: some View {
        HStack {
            Text(gyms.name)
            Text(gyms.gym)
            Spacer()
            Text("\(gyms.weight2) kg")
            Text("消耗\(gyms.weight) 卡路里")
        }
        
    }
}

struct GymRow_Previews: PreviewProvider {
    static var previews: some View {
        GymRow(gyms: Gymer(name: "penny",weight2: "30" , weight: 30, gym: "休息", trueHeart: true))
    }
}
