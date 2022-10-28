//
//  ProgContentView.swift
//  WaspCat499Csumb WatchKit Extension
//
//  Created by user228393 
//

import SwiftUI

struct ProgView : View {
    var prog : ProgramObject
    
    var body : some View{
        VStack{
            Text("\(prog.title!)")
                .font(.headline)
                .foregroundColor(.blue)
                .frame(width: 200, height: 30, alignment: .leading)
            Text("\(prog.speaker!)")
                .font(.subheadline)
                .foregroundColor(.green)
                .frame(width: 200, height: 30, alignment: .leading)
            Text("\(prog.from!)")
                .font(.subheadline)
                .foregroundColor(.red)
                .frame(width: 200, height: 30, alignment: .leading)
            Text("\(prog.to!)")
                .font(.subheadline)
                .foregroundColor(.black)
                .frame(width: 200, height: 30, alignment: .leading)
        }
    }
}

struct ProgContentView: View {
    @ObservedObject var viewModel : ProgramViewModel
    @State var programs : [ProgramObject] = []
    
    var body: some View {
            VStack{
                Text("Watch Student Planner test")
                
                List(programs, id:\.self){p in
                    ProgView(prog: p)
                    
                }
            }.onAppear(){
                viewModel.connectivityProvider.connect()
                self.programs = viewModel.connectivityProvider.receviedPrograms
            }
    }
}


