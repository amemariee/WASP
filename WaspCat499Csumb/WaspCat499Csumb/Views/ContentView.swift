//
//  ContentView.swift
//  WaspCat499Csumb
//
//  Created by user228393 on 10/14/22.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
        
    }
}

struct ContentView: View {
    
    let viewModel = ProgramViewModel(connectivityProvider : ConnectionProvider())
    let connect = ConnectionProvider()
    @State var programs : [ProgramObject] = []
    @State var selectedClass: ProgramObject
    @State var names = "Student Name"
    @State var dupe : [String]
    //@StateObject var GlobalModel = GlobalModel()
    var body: some View {
       // let sname = selectedClass.title
        //dupe = selectedClass.students
        NavigationView{
            VStack{
                HStack{
                    Text("Watch Student Picker")
                        .padding()
                        .font(Font.custom("Montserrat", size:25))
                    
                    NavigationLink(destination: ProgramView(viewModel : self.viewModel, selectedClass: self.$selectedClass)) {
                        Image(systemName: "menubar.rectangle")
                    }
                    .padding()
                }
                .background(Color(red: 0, green: 0, blue: 0.5))
                .foregroundColor(.white)
                .padding()
                
                Spacer()
                Section{
                    
                    Text(names)
                        .font(Font.custom("Open-Sans", size:20))
                    
                    
                    Spacer()
                    HStack{
                        
                       // dupe.append("end of students")
                        Button(action: {
                            if selectedClass.students.isEmpty{
                                names = "Please Select Course First"
                            }
                            else if ((dupe.isEmpty)){
                                names = "Picked All Students - Press Again to Restart"
                                self.dupe = selectedClass.students
                            }
                            else{
                                //dupe.append("Picked All - Restarting")
                                //names = dupe.first ?? "Please Select Course First"
                                //dupe.removeFirst()
                                let elementIndex = self.dupe.indices.randomElement()
                                
                                names = self.dupe[elementIndex!]
                                self.dupe.remove(at: elementIndex!)
                                //dupe.removeFirst()
                                //dupe.remove(element)
                                //dupe = dupe.filter() { $0 != element}
                                //let index = dupe.firstIndex(of: element ?? "none")
                                //dupe.remove(at: index ?? 0)
                                print(names)
                                dump(self.dupe)
                                
                            }
                        }){
                            Text("Not Picked")
                        }
                        .buttonStyle(BlueButton())
                        
                        Button(action: { names = selectedClass.students.randomElement() ?? "Please Select Course First"
                            print(names)
                        }){
                            Text("Any Student")
                        }
                        .buttonStyle(BlueButton())
                        
                        
                    }
                }
                Spacer()
            }
        }.onAppear(){
            connect.connect()
        }
    }
}

