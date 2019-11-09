import Foundation

class Habits: ObservableObject {
    
    static let habitsKey = "habits"
    
    @Published var items: [Habit] {
        didSet {
            if let data = try? JSONEncoder().encode(self.items) {
                UserDefaults.standard.set(data, forKey: Habits.habitsKey)
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Habits.habitsKey) {
            if let savedItems = try? JSONDecoder().decode([Habit].self, from: data) {
                items = savedItems
                return
            }
        }
        items = []
    }
}
