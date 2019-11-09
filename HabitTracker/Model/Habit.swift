import Foundation

struct Habit: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var completions: [Date] = []
}
