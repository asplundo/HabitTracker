import SwiftUI

struct HabitDetailView: View {
    
    @ObservedObject var habits: Habits
    var index: Int
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(habits.items[index].title)
                        .fontWeight(.black)
                        .headlineStyle()
                    Text(habits.items[index].description).lineLimit(0)
                    
                    HStack {
                        Text("Completions")
                        Spacer()
                        Text("\(habits.items[index].completions.count)")
                    }.padding(.top)
                        .font(.footnote)
                }
            }
            .cardStyle()
            Spacer()
            Button(action: {
                self.habits.items[self.index].addCompletion()
            }) {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Complete")
                }
                .padding()
                .background(Color.green)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(.bottom)
                
            }
        }
    }
}

struct HeadlineModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.primary)
    }
}

struct CardModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: UIScreen.main.bounds.width - 40)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 5))
    }
}

extension View {
    func cardStyle() -> some View {
        return self.modifier(CardModifier())
    }
    
    func headlineStyle() -> some View {
        return self.modifier(HeadlineModifier())
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let habits = Habits()
        habits.items.append(Habit(title: "Piano", description: "Learn how to play the piano"))
        
        return HabitDetailView(habits: habits, index: 0)
    }
}
