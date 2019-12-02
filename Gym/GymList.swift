//
//  GymList.swift
//  Gym
//
//  Created by user on 3/12/2019.
//  Copyright © 2019 00557052. All rights reserved.
//

import SwiftUI

struct GymList: View {
    
    @ObservedObject var gymsData = GymsData()
    @State private var showEditgym = false
    
    
    var body: some View {
        
        VStack{
        
        NavigationView {
            List {
                ForEach(gymsData.gyms) { (gyms) in
                    NavigationLink(destination: gymEditor(gymsData: self.gymsData, editgym: gyms)) {
                        GymRow(gyms: gyms)
                        
                    }
                }
                .onDelete { (indexSet) in
                    self.gymsData.gyms.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("健身列表")
            .navigationBarItems(leading: EditButton() ,trailing: Button(action: {
                
                self.showEditgym = true
                
            }, label: {
                Image(systemName: "plus.circle.fill")
                
            }))
                .sheet(isPresented: $showEditgym) {
                    NavigationView {
                         gymEditor(gymsData: self.gymsData)
                    }
                   
            }
        }

        }
        
    }
}

struct GymList_Previews: PreviewProvider {
    static var previews: some View {
        GymList()
    }
}
