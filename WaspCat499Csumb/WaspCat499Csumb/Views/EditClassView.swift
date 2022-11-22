//
//  EditClassView.swift
//  WaspCat499Csumb
//
//  Created by user228393 on 11/13/22.
//

import SwiftUI

struct EditClassView: View {
    @State private var studentName: String = ""
    @ObservedObject var viewModel : ProgramViewModel
    @State var selectedClass: ProgramObject
    @State var programs : [ProgramObject] = []
    @State var selectedStudent : String = "error"
    
        var body: some View {
            let names = selectedClass.students
        VStack{
            Section{
            TextField("Student Name", text: $studentName)
            Button("Add Student"){
                print(studentName)
                //print(selectedClass)
                selectedClass.students.append(studentName)
            }
            .buttonStyle(BlueButton())
            .padding()
            }
            Spacer()
            
            Form{
                Section{
                    Picker("Students", selection: $selectedStudent){
                        ForEach(names, id: \.self){
                            Text($0)
                        }
                        
                    }
                    .pickerStyle(.wheel)
                
                    Button(action:{
                        //print(selectedStudent)
                        selectedClass.students = selectedClass.students.filter(){
                            $0 != selectedStudent
                        }
                    }){
                        Text("Remove Student")
                    //students = students.filter(){}
                }
                .buttonStyle(BlueButton())
                .padding()
            }
            }
            Spacer()
        }
        .textFieldStyle(.roundedBorder)
}
}


