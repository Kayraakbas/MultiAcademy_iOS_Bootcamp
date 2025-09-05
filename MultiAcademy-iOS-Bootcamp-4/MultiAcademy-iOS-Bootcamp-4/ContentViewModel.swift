//
//  ContentViewModel.swift
//  MultiAcademy-iOS-Bootcamp-4
//
//  Created by Kayra Akbaş on 5.09.2025.
//

private var dummyData : [ListObj] = [
        ListObj(title: "Shopping", content: "Buy groceries for the week", symbol: "cart", isDone: false),
        ListObj(title: "Work Tasks", content: "Complete project presentation", symbol: "briefcase", isDone: true),
        ListObj(title: "Exercise", content: "30 minutes cardio workout", symbol: "figure.run", isDone: false),
        ListObj(title: "Reading", content: "Finish chapter 5 of Swift programming book", symbol: "book", isDone: true),
        ListObj(title: "Travel", content: "Plan weekend trip to mountains", symbol: "airplane", isDone: false),
        ListObj(title: "Cooking", content: "Try new pasta recipe for dinner", symbol: "fork.knife", isDone: false),
        ListObj(title: "Learning", content: "Watch iOS development tutorial", symbol: "graduationcap", isDone: true),
        ListObj(title: "Health", content: "Schedule dentist appointment", symbol: "cross.case", isDone: false),
        ListObj(title: "Entertainment", content: "Movie night with friends", symbol: "tv", isDone: true),
        ListObj(title: "Finance", content: "Review monthly budget", symbol: "dollarsign.circle", isDone: false)
]

import Foundation
class ContentViewModel: ObservableObject{
    @Published var listData: [ListObj] = []
    
    init() {
        self.listData = getData()
    }
    
    func getData() -> [ListObj]{
        return dummyData
    }
    
    func addList(title: String, content: String, symbol: String){
        let list = ListObj(title: title,content: content, symbol: symbol, isDone: false)
        listData.append(list)
    }
    
    
}
