import SwiftUI

struct HabitRow: View {
    
    var habit: Habit
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(habit.title)
                    .font(.headline)
                Text(habit.description)
            }
            Spacer()
            Text("\(habit.completions.count)")
                .padding(10)
                .background(Color.orange)
                .foregroundColor(.white)
                .clipShape(Circle())
            
        }
    }
}

struct HabitRow_Previews: PreviewProvider {
    static var previews: some View {
        HabitRow(habit: Habit(title: "Play piano", description: "Once a week I want to play the piano"))
    }
}
