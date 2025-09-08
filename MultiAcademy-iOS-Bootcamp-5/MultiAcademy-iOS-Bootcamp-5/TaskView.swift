//
//  TaskView.swift
//  MultiAcademy-iOS-Bootcamp-5
//
//  Created by Kayra Akbaş on 7.09.2025.
//

import SwiftUI

struct TaskView: View {
    @StateObject var taskVM = TaskViewModel()
    @State var showAddTask: Bool = false
    @State var title: String = ""
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Completed").font(.title2).bold()) {
                    let completedTasks = taskVM.tasks.filter {$0.isCompleted}
                    
                    ForEach(completedTasks, id: \.id) { task in
                        TaskCellView(taskVM: taskVM, task: .constant(task))
                    }.onDelete { offsets in
                        let ids = Set(offsets.map{completedTasks[$0].id})
                        taskVM.removeTask(withIDs: ids)
                    }
                    
                }
                Section(header: Text("Un Completed").font(.title2).bold()) {
                    let inCompleteTasks = taskVM.tasks.filter {!$0.isCompleted}
                    ForEach(inCompleteTasks) { task in
                        TaskCellView(taskVM: taskVM, task: .constant(task))
                    }.onDelete { offsets in
                        let ids = Set(offsets.map{ inCompleteTasks[$0].id})
                        taskVM.removeTask(withIDs: ids)
                    }
                    
                }
            }
            Text("")
                .navigationTitle("Task List")
                .navigationTitle("prova")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            showAddTask.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }.sheet(isPresented: $showAddTask) {
                        VStack(spacing: 20){
                        TextField("Title", text: $title)
                            .padding()
                            .disableAutocorrection(true)
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    .padding()
                    Button{
                        if !title.isEmpty{
                            taskVM.addTask(title: title, isCompleted: false)
                            showAddTask.toggle()
                            title = ""
                        }
                        
                    } label: {
                        Text("Add To Task")
                            .tint(.secondary)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    
                }
        }

    }
}

#Preview {
    TaskView()
}
