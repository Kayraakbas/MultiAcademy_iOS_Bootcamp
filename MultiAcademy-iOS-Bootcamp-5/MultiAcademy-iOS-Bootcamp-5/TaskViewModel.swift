//
//  TaskViewModel.swift
//  MultiAcademy-iOS-Bootcamp-5
//
//  Created by Kayra Akbaş on 7.09.2025.
//

import Foundation

class TaskViewModel: ObservableObject{
    
    @Published var tasks: [Task] = []
   
    func addTask(title: String, isCompleted: Bool){
        var task = Task()
        task.title = title
        task.isCompleted = isCompleted
        tasks.append(task)
    }
    
    func removeTask(withIDs ids: Set<UUID>) {
        tasks.removeAll{ ids.contains($0.id)}
    }
        
    func completeTask(task: Task){
        let id = task.id
        guard let idx = tasks.firstIndex(where: {$0.id == id}) else{return}
        tasks[idx].isCompleted = true

    }
    
    func unCompleteTask(task: Task){
        let id = task.id
        guard let idx = tasks.firstIndex(where: {$0.id == id}) else{return}
        tasks[idx].isCompleted = false
    }
}
