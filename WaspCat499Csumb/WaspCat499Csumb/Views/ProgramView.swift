//
//  ProgramView.swift
//  WaspCat499Csumb
//
//  Created by user228393 on 10/14/22.
//

import SwiftUI



struct ProgView : View{
    var prog : ProgramObject
    //@State var selectedClass : UUID
    var body : some View{
        VStack{
            Text("\(prog.title!)")
                .font(.headline)
                .foregroundColor(.blue)
                .frame(width: 200, height: 30, alignment: .leading)
           // Text("\(prog.students!)")
               // .font(.subheadline)
                //.foregroundColor(.green)
                //.frame(width: 200, height: 30, alignment: .leading)
   
        
                }
        .contentShape(Rectangle())
        

}
}

struct ProgramView: View {
    @ObservedObject var viewModel : ProgramViewModel
    @State var programs : [ProgramObject] = []
    @State var selectedClass: ProgramObject

    var body: some View {
        VStack{
            Text("Courses")
            
            List(programs, id: \.self){ p in
                ProgView(prog: p)
                .onTapGesture {
                        print(p.id as Any)
                    selectedClass = p                    }             }
            .onAppear(){
            viewModel.connectivityProvider.connect()
            viewModel.connectivityProvider.initFakeDetails()
            self.programs = viewModel.connectivityProvider.programs
        }
        HStack{
            Button("New Class"){
                print("new class works")
            }
            .buttonStyle(BlueButton())
            NavigationLink(destination: EditClassView(viewModel : viewModel, selectedClass: self.selectedClass)){
                Text("Edit Selected Course")
            }
            .buttonStyle(BlueButton())
    }
    }
}
}


