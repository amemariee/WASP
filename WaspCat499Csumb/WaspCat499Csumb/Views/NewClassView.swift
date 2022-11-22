//
//  NewClassView.swift
//  WaspCat499Csumb
//
//  Created by user228393 on 11/13/22.
//

import SwiftUI

struct NewClassView: View {
    @ObservedObject var viewModel : ProgramViewModel
    @Binding var programs : [ProgramObject]
    @State var className = ""


    var body: some View {
        Section{
            HStack{
                Image(systemName: "menubar.dock.rectangle")
                TextField("New Course Name", text: $className)
                    .textFieldStyle(.roundedBorder)
                    
            }
            .padding(.horizontal, 25)
            Button(action: {
                viewModel.connectivityProvider.connect()
                //viewModel.connectivityProvider.addClass(title: className)
                //let new = ProgramObject()
                viewModel.connectivityProvider.addClass(title: className)
                //new.initWithData(title: className, students: [])
                //viewModel.connectivityProvider.programs.append(new)
                //self.programs.append(new)
                //dump(programs)
           
            }){
                Text("Add Course")
            }
        .buttonStyle(BlueButton())
        .padding()
        }
        Spacer()
    }
}



