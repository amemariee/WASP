//
//  ContentView.swift
//  WaspCat499Csumb
//
//  Created by user228393 on 10/14/22.
//

import SwiftUI

struct ContentView: View {
    
    let viewModel = ProgramViewModel(connectivityProvider : ConnectionProvider())
    let connect = ConnectionProvider()
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Confrence Planner")
                .padding()
                NavigationLink(destination: ProgramView(viewModel : viewModel)){
                    Text("Program")
                }
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
