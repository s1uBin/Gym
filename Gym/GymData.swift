//
//  GymData.swift
//  Gym
//
//  Created by user on 3/12/2019.
//  Copyright © 2019 00557052. All rights reserved.
//

import Foundation


struct Gymer: Identifiable, Codable {
    var id = UUID()
    var name: String
    var weight2: String
    var weight: Int
    var gym:String
    var trueHeart: Bool
}

class GymsData: ObservableObject{
    @Published var gyms = [Gymer](){
        didSet{
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(gyms){
                UserDefaults.standard.set(data, forKey: "mygyms")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "mygyms"){
            let decoder = JSONDecoder()
            if let decodeData = try? decoder.decode([Gymer].self, from: data){
                gyms = decodeData
            }
        }
    }
}
