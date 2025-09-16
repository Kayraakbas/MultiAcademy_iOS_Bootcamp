//
//  EventDetailView.swift
//  MultiAcademy-iOS-Bootcamp-7
//
//  Created by Kayra Akbaş on 16.09.2025.
//

import SwiftUI

struct EventDetailView: View {
    
    @State var event: Event
    @ObservedObject var vm: EventViewModel
    @Binding var showModal: Bool
    
    var body: some View {
        VStack{
            Spacer()
            Text(event.title)
                .font(.largeTitle)
                .bold()
            Text("Date: \(event.date.formatted(date: .abbreviated, time: .shortened))")
            Text("Type: \(event.type)")
            if event.hasReminder {
                Text("Reminder Set")
            }
            Spacer()
            Button("Delete Event") {
                let id = Set([event.id])
                vm.deleteEvent(WithIDs: id)
                showModal.toggle()
            }
            .tint(Color(.red))
        }.padding()
    }
}

#Preview {
    EventDetailView(event:Event(
        title: "Team Standup",
        date: Date(),
        type: "Meeting",
        hasReminder: true
    ), vm: EventViewModel(), showModal: .constant(true))
}
