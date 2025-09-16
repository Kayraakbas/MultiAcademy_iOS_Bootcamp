//
//  FormView.swift
//  MultiAcademy-iOS-Bootcamp-7
//
//  Created by Kayra Akbaş on 16.09.2025.
//

import SwiftUI

struct EventFormView: View {
    
    @ObservedObject var viewModel: EventViewModel
    @State var eventName: String = ""
    @State var eventDate: Date = Date()
    @State var eventType: String = ""
    @State var hasReminder: Bool = false
    
    var body: some View {
        ScrollView(){
            
            VStack(spacing: 22){
                TextField("Event Name", text: $eventName)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .fill(Color(.systemGray6))
                    )
                
                
                DatePicker("Event Date", selection: $eventDate)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .fill(Color(.systemGray6))
                    )
                
                
                Picker(selection: $eventType){
                    Text("Lecture").tag("Lecture")
                    Text("Workshop").tag("Workshop")
                } label: {
                    HStack{
                        Text("Event Type")
                        Spacer()
                    }
                }
                .padding()
                
                
                Toggle("Has Reminder", isOn: $hasReminder)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .fill(Color(.systemGray6))
                    )
                
                Button {
                    viewModel.addEvent(title: eventName, date: eventDate, type: eventType, hasReminder: hasReminder)
                } label: {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 22, style: .continuous)
                                .fill(Color(.systemGray6))
                        )
                }
            }
            
        }
        .padding() // keeps content inside safe areas
        .defaultScrollAnchor(.center)
    }
    
    
}

#Preview {
    EventFormView(viewModel: EventViewModel())
}
