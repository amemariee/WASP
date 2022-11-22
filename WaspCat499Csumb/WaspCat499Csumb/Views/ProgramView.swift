//
//  ProgramView.swift
//  WaspCat499Csumb
//
//  Created by user228393 on 10/14/22.
//

import SwiftUI



struct ProgView : View{
    var prog : ProgramObject
    @ObservedObject var viewModel : ProgramViewModel
    //@State var selectedClass : UUID
    var body : some View{
        VStack{
            HStack{
            Text("\(prog.title!)")
                .font(.headline)
                .foregroundColor(.blue)
                .frame(width: 200, height: 30, alignment: .leading)
            
             //   Button(action : {
                      //  print("works")
                        //viewModel.connectivityProvider.connect()
                        //viewModel.connectivityProvider.removeClass(idRemove: prog.id)
               // }){
                //    Image(systemName: "trash")}
           }
            }
           // Text("\(prog.students!)")
               // .font(.subheadline)
                //.foregroundColor(.green)
                //.frame(width: 200, height: 30, alignment: .leading)
   
        
                }
        //.contentShape(Rectangle())
        

}


struct ProgramView: View {
    @ObservedObject var viewModel : ProgramViewModel
    @State var programs : [ProgramObject] = []
    @Binding var selectedClass: ProgramObject

    var body: some View {
       VStack{
            Text("Courses")
           //HStack{
               List(programs, id: \.self){ p in
                   ProgView(prog: p, viewModel: self.viewModel)
                       .onTapGesture {
                           print(p.id as Any)
                           self.selectedClass = p
                           self.programs = viewModel.connectivityProvider.programs
                       }
                   Button(action : {
                           //print("works")
                           //viewModel.connectivityProvider.connect()
                           viewModel.connectivityProvider.removeClass(idRemove: p.id)
                   }){
                       Image(systemName: "trash")}
               }

               //}
                        //GlobalModel().selectedClass = p
                        //print(p.title)
                        //print(GlobalModel().selectedClass.title)
                    
            }
            .onAppear(){
                viewModel.connectivityProvider.connect()
                //viewModel.connectivityProvider.initFakeDetails()
                //let temp = self.programs
                self.programs = viewModel.connectivityProvider.programs
                //self.programs.append(contentsOf: temp)
        }
            //print(programs)
        HStack{
            NavigationLink(destination: NewClassView(viewModel: self.viewModel, programs: self.$programs)){
                Text("New Class")
            }
            .buttonStyle(BlueButton())
                           
            NavigationLink(destination: EditClassView(viewModel : viewModel, selectedClass: self.selectedClass)){
                Text("Edit Selected Course")
            }
            .buttonStyle(BlueButton())
    }
    }
}



