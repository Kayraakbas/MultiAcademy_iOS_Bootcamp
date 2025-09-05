//
//  List.swift
//  MultiAcademy-iOS-Bootcamp-4
//
//  Created by Kayra Akbaş on 5.09.2025.
//

import Foundation


struct ListObj: Codable, Hashable, Identifiable{
    var id = UUID()
    var title: String? = nil
    var content: String? = nil
    var symbol: String? = nil
    var isDone: Bool
    
    
    init(title: String? = nil, content: String? = nil, symbol: String? = nil, isDone: Bool) {
        self.title = title
        self.content = content
        self.symbol = symbol
        self.isDone = isDone
    }
}


