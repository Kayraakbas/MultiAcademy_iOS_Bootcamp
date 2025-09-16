//
//  EventViewModel.swift
//  MultiAcademy-iOS-Bootcamp-7
//
//  Created by Kayra Akbaş on 16.09.2025.
//

import Foundation
import Combine


class EventViewModel: ObservableObject {

    @Published var events: [Event] = []
    
    init() {
        fetchEvents()
    }
    
    func fetchEvents(){
        events = data
    }
        
    func addEvent(title: String, date: Date, type: String, hasReminder: Bool = false) {
        let newEvent = Event(title: title, date: date, type: type, hasReminder: hasReminder)
        events.append(newEvent)
        print(events.last ?? "")
    }



    func deleteEvent(WithIDs ids: Set<UUID> ){
        events.removeAll {ids.contains($0.id)}
        print(events.count)
        
    }
    
    func toggleReminder(for id: UUID) {
        guard let idx = events.firstIndex(where: { $0.id == id }) else { return }
        events[idx].hasReminder.toggle()
    }

    func updateEvent(_ updated: Event) {
        guard let idx = events.firstIndex(where: { $0.id == updated.id }) else { return }
        events[idx] = updated
    }

    func clearAll() {
        events.removeAll()
    }
}
