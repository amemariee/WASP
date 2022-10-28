//
//  ContentView.swift
//  WaspCat499Csumb WatchKit Extension
//
//  Created by user228393 on 10/14/22.
//


import SwiftUI

struct ContentView: View {
    
    let viewModel = ProgramViewModel(connectivityProvider: ConnectionProvider())
    
    var body: some View {
        NavigationView{
            VStack{
        
                Text("Watch Student Planner")
                    .padding()
                NavigationLink(destination: ProgContentView(viewModel :
                    viewModel)){
                    Text("Program")
                }.padding(50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
