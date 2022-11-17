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
    //@StateObject var GlobalModel = GlobalModel()
    var body: some View {
       // let sname = selectedClass.title
       
        NavigationView{
            VStack{
                HStack{
                    Text("Watch Student Picker")
                        .padding()
                        .font(Font.custom("Montserrat", size:30))
                    
                    NavigationLink(destination: ProgramView(viewModel : viewModel, selectedClass: self.$selectedClass)){
                        Text("Courses")
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
                        Button("Not picked"){
                            print("Doesnt work")
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

