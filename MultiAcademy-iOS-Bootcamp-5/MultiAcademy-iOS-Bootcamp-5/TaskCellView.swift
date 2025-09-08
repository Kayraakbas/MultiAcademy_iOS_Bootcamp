//
//  TaskCellView.swift
//  MultiAcademy-iOS-Bootcamp-5
//
//  Created by Kayra Akbaş on 7.09.2025.
//

import SwiftUI

struct TaskCellView: View {
    @ObservedObject var taskVM: TaskViewModel
    @Binding var task: Task
    
    var body: some View {
        HStack{
            Text(task.title)
                .bold()
            Spacer()
            HStack(spacing: 18){
                Button{
                    taskVM.completeTask(task: task)
                } label: {
                    Text("Completed")
                    
                }
                .buttonStyle(.plain)
                
                Button{
                    taskVM.unCompleteTask(task: task)
                } label: {
                    Text("Active")
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}

#Preview {
    TaskCellView(taskVM: TaskViewModel(), task: Binding.constant(Task(title: "prova")))
}
