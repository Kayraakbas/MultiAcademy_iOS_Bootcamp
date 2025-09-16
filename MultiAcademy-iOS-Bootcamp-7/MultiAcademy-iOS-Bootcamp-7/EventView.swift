//
//  ContentView.swift
//  MultiAcademy-iOS-Bootcamp-7
//
//  Created by Kayra Akbaş on 16.09.2025.
//

import SwiftUI

struct EventView: View {
    
    @StateObject var eventVM = EventViewModel()
    @State var showAddTask: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Events")) {
                    ForEach(eventVM.events) { event in
                        NavigationLink(value: event) {
                            Text(event.title)
                        }
                    }
                    .onDelete { offsets in
                        let ids = Set(offsets.map { eventVM.events[$0].id })
                        eventVM.deleteEvent(WithIDs: ids)
                    }
                }
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddTask.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTask) {
                EventFormView(viewModel: eventVM)
            }
            .navigationDestination(for: Event.self) { event in
                // Since EventDetailView expects a Binding<Bool> for dismissal, provide a local presenter
                EventDetailPresenter(event: event, vm: eventVM)
            }
        }
    }
}

// A small wrapper to bridge navigationDestination to EventDetailView's Binding<Bool> API
private struct EventDetailPresenter: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isShown: Bool = true
    
    var event: Event
    var vm: EventViewModel
    
    var body: some View {
        EventDetailView(event: event, vm: vm, showModal: $isShown)
            .onChange(of: isShown) { _, newValue in
                if newValue == false {
                    dismiss()
                }
            }
    }
}

#Preview {
    EventView()
}
