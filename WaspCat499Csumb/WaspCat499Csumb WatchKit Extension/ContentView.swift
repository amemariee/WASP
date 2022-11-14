//
//  ContentView.swift
//  WaspCat499Csumb WatchKit Extension
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
    let sName = "Student Name"
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("WASP")
                        .padding()
                        .font(Font.custom("Montserrat", size:20))
                    
                    NavigationLink(destination: ProgContentView(viewModel : viewModel)){
                        Text("Courses")
                    }
                    .padding()
                }
                .background(Color(red: 0, green: 0, blue: 0.5))
                .foregroundColor(.white)
                .padding()
                
                Spacer()
                Section{
                    Text(sName)
                        .font(Font.custom("Open-Sans", size:20))
                }
                
                Spacer()
                HStack{
                    Button("Not picked"){
                        print("not picked works")
                    }
                    .buttonStyle(BlueButton())
                    Button("Any Student"){
                        print("Any Student works")
                    }
                    .buttonStyle(BlueButton())
               
                }
                Spacer()
            }
        }.onAppear(){
            connect.connect()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct ContentView: View {
    
//    let viewModel = ProgramViewModel(connectivityProvider: ConnectionProvider())
    
//    var body: some View {
//        NavigationView{
 //           VStack{
        
  //              Text("Watch Student Picker")
  //                  .padding()
 //               NavigationLink(destination: ProgContentView(viewModel :
 //                   viewModel)){
 //                   Text("Courses")
 //               }.padding(50)
//            }
 //       }
//    }
//}

//struct ContentView_Previews: PreviewProvider {
 //   static var previews: some View {
  //      ContentView()
 //   }
//}
