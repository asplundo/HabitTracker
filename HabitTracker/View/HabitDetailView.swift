import SwiftUI

struct HabitDetailView: View {
    
    let habit: Habit
    
    var body: some View {
        VStack {
            Text(habit.title)
                .font(.title)
            Text(habit.description)
            
        }
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(habit:
            Habit(title: "Piano", description: "Learn how to play")
        )
    }
}
