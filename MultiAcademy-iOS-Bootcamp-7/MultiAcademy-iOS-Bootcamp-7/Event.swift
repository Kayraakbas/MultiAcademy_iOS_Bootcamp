//
//  Event.swift
//  MultiAcademy-iOS-Bootcamp-7
//
//  Created by Kayra Akbaş on 16.09.2025.
//

import Foundation


struct Event: Identifiable, Codable, Equatable, Hashable {
    var id: UUID
    var title: String
    var date: Date
    var type: String
    var hasReminder: Bool

    init(
        id: UUID = UUID(),
        title: String,
        date: Date,
        type: String,
        hasReminder: Bool = false
    ) {
        self.id = id
        self.title = title
        self.date = date
        self.type = type
        self.hasReminder = hasReminder
    }
}


// Sample dummy data
private let calendar = Calendar.current
private let now = Date()

var data: [Event] = [
    Event(
        title: "Team Standup",
        date: calendar.date(byAdding: .hour, value: 2, to: now) ?? now,
        type: "Meeting",
        hasReminder: true
    ),
    Event(
        title: "iOS Bootcamp Session",
        date: calendar.date(byAdding: .day, value: 1, to: now) ?? now,
        type: "Workshop",
        hasReminder: true
    ),
    Event(
        title: "Design Review",
        date: calendar.date(byAdding: .day, value: 3, to: now) ?? now,
        type: "Review",
        hasReminder: false
    ),
    Event(
        title: "Code Refactor",
        date: calendar.date(byAdding: .day, value: -1, to: now) ?? now,
        type: "Task",
        hasReminder: false
    ),
    Event(
        title: "Release Planning",
        date: calendar.date(byAdding: .day, value: 7, to: now) ?? now,
        type: "Planning",
        hasReminder: true
    )
]
