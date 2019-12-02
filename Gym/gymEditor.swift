//
//  gymEditor.swift
//  Gym
//
//  Created by user on 3/12/2019.
//  Copyright © 2019 00557052. All rights reserved.
//

import SwiftUI

struct gymEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var gymsData: GymsData
    @State private var name = ""
    @State private var weight = 0
    @State private var weight2 = ""
    @State private var time = ""
    @State private var trueHeart = true
    @State private var selectDate = Date()
        @State private var selectIndex = 0
    let today = Date()
    let startDate = Calendar.current.date(byAdding: .year, value: -5, to: Date())!
    var editgym: Gymer?
     var gym = ["深蹲","臥推","划船","硬舉","肩推","引體向上","跑步","休息"]
    
    
    var body: some View {
        Form {
            TextField("名字", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
             .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.orange, lineWidth: 5))
            TextField("體重", text: $weight2)
             .textFieldStyle(RoundedBorderTextFieldStyle())
                         .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.orange, lineWidth: 5))
            DatePicker("健身日期", selection: self.$selectDate, in: self.startDate..., displayedComponents: .date)
            TextField("健身時間", text: $time)
            .textFieldStyle(RoundedBorderTextFieldStyle())
                         .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.orange, lineWidth: 5))
            Stepper("消耗卡路里 \(weight)", value: $weight, in: 0...300)
        Picker(selection: $selectIndex, label:
        Text("choose type")){
            Text(self.gym[0]).tag(0)
            Text(self.gym[1]).tag(1)
            Text(self.gym[2]).tag(2)
            Text(self.gym[3]).tag(3)
            Text(self.gym[4]).tag(4)
            Text(self.gym[5]).tag(5)
            Text(self.gym[6]).tag(6)
            Text(self.gym[7]).tag(7)
        }
        }
        .navigationBarTitle(editgym == nil ? "新增健身資料" : "編輯資料")
        .navigationBarItems(trailing: Button("Save") {
            let lover = Gymer(name: self.name, weight2: self.weight2, weight: self.weight,gym: self.gym[self.selectIndex], trueHeart: self.trueHeart)
            if let editLover = self.editgym {
                let index = self.gymsData.gyms.firstIndex {
                    $0.id == editLover.id
                    }!
                self.gymsData.gyms[index] = lover
            } else {
                self.gymsData.gyms.insert(lover, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
            
        })
            .onAppear {
                if let editLover = self.editgym {
                    self.name = editLover.name
                    self.weight2 = editLover.weight2
                    self.weight = editLover.weight
                    self.trueHeart = editLover.trueHeart
                    
                }
        }
        
    }
    
}

struct gymEditor_Previews: PreviewProvider {
    static var previews: some View {
        gymEditor(gymsData: GymsData())
    }
}
