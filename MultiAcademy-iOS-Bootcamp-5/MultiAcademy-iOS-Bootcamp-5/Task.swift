//
//  Task.swift
//  MultiAcademy-iOS-Bootcamp-5
//
//  Created by Kayra Akbaş on 7.09.2025.
//

import Foundation


struct Task: Codable, Identifiable{
    var id = UUID()
    var title: String = ""
    var isCompleted: Bool = false
    
}
