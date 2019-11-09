import SwiftUI

struct AddHabitView: View {
    
    @ObservedObject var habits: Habits
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var description = ""
    @State private var offsetY: CGFloat = -500
    @State private var opacity: Double = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("e.g Go running", text: self.$title)
                }
                .offset(y: offsetY)
                .opacity(self.opacity)
                .animation(.spring())
                
                Section(header: Text("Description")) {
                    TextField("e.g I wanna be fast!", text: self.$description)
                }
                .offset(y: offsetY)
                .opacity(self.opacity)
                .animation(.spring())
            }
            .onAppear {
                withAnimation {
                    self.offsetY = 0
                    self.opacity = 1
                }
            }
            .navigationBarItems(trailing: Button("save") {
                self.habits.items.append(Habit(title: self.title, description: self.description))
                self.presentationMode.wrappedValue.dismiss()
            }.disabled(!self.isValid))
                .navigationBarTitle("Add Habit")
        }
    }
    
    var isValid: Bool {
        return title != "" && description != ""
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
