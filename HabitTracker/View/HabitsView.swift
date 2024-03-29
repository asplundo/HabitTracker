import SwiftUI

struct HabitsView: View {
    
    @ObservedObject var habits = Habits()
    @State private var showAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<habits.items.count, id: \.self) { index in
                    NavigationLink(destination: HabitDetailView(habits: self.habits, index: index)) {
                        HabitRow(habit: self.habits.items[index])
                    }
                }
                .onDelete(perform: removeItems)
            }
            .sheet(isPresented: $showAddView) {
                AddHabitView(habits: self.habits)
            }
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: {
                    self.showAddView = true
                }) {
                    Image(systemName: "plus")
                }
            )
                .navigationBarTitle("Habit Tracker")
        }
    }
    
    private func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct HabitsView_Previews: PreviewProvider {
    
    static var previews: some View {
        let habit = Habit(title: "Play piano", description: "I wanna play the piano one time per week")
        
        let habits = Habits()
        
        habits.items.append(habit)
        
        var view = HabitsView()
        view.habits = habits
        
        return view
    }
}
