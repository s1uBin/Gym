//
//  PieChart.swift
//  Gym
//
//  Created by user on 3/12/2019.
//  Copyright © 2019 00557052. All rights reserved.
//


import SwiftUI

struct PieChartView: View {
    var percentages: [Double]
    var angles: [Angle]
    
    init(percentages: [Double]) {
        self.percentages = percentages
        angles = [Angle]()
        var startDegree: Double = 0
        for percentage in percentages {
            angles.append(.degrees(startDegree))
            startDegree += 360 * percentage / 100
        }
    }
    
    var body: some View {
        VStack{
             Text("消耗卡路里分析")
                .font(.title)
            .foregroundColor(Color.blue)
        ZStack {
            PieChart(startAngle: self.angles[0], endAngle: self.angles[1])
                .fill(Color.orange)
            PieChart(startAngle: self.angles[1], endAngle: self.angles[2])
                .fill(Color.red)
            PieChart(startAngle: self.angles[2], endAngle: self.angles[0])
                .fill(Color.purple)
           
        }
       
            Text("橙色：深蹲")
            .foregroundColor(Color.orange)
            Text("紫色：划船")
            .foregroundColor(Color.purple)
            Text("紅色：跑步")
            .foregroundColor(Color.red)
    }
    }
}


struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(percentages: [10, 40, 50])
    }
}

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX,
                        startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

