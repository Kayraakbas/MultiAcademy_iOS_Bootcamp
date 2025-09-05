//
//  ListViewModel.swift
//  MultiAcademy-iOS-Bootcamp-4
//
//  Created by Kayra Akbaş on 5.09.2025.
//

import Foundation

class ListViewModel: ObservableObject{
    @Published var list: ListObj
    
    init(list: ListObj) {
        self.list = list
    }
    
}
