//
//  ProgramView.swift
//  WaspCat499Csumb
//
//  Created by user228393 on 10/14/22.
//

import SwiftUI

struct ProgView : View{
    var prog : ProgramObject
    
    //
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
                .foregroundColor(.black)
                .frame(width: 200, height: 30, alignment: .leading)
            Text("\(prog.to!)")
                .font(.headline)
                .foregroundColor(.black)
                .frame(width: 200, height: 30, alignment: .leading)
        }
    }
}

struct ProgramView: View {
    @ObservedObject var viewModel : ProgramViewModel
    @State var programs : [ProgramObject] = []
    
    var body: some View {
        VStack{
            Text("Courses")
            
            List(programs, id: \.self){ p in
                ProgView(prog: p)
            }
        }.onAppear(){
            viewModel.connectivityProvider.connect()
            viewModel.connectivityProvider.initFakeDetails()
            self.programs = viewModel.connectivityProvider.programs
        }
    }
}


