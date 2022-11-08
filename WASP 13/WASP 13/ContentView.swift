//
//  ContentView.swift
//  WASP
//
//  Created by Rajveer Saini on 10/7/22.
//

import SwiftUI
struct ContentView: View {
    @State var textFieldText: String = ""
    @State var addClassNameText: String = ""
    @State var ChoseenArray: [String] = []
    @State var classname: [String] = []
    @State var dataArray: [String] = []
    @State var random: String = ""
    class Class {
        var ClassName: String = "null"
        var students: [String] = []
    }
    var classesList: [Class] = []
    var totalClass: Int = 0
    var body: some View {
        NavigationView {
            
            VStack {
                TextField("Student Name", text: $textFieldText)
                    .foregroundColor(.black)
                    .font(.headline)
                List{
                    ForEach(dataArray, id:\.self){
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                TextField("Class Name", text: $addClassNameText)
                    .foregroundColor(.black)
                    .font(.headline)
                Button(action: {
                    if TextIsName(){
                        saveText()
                        save()
                    }
                }, label:{
                    Text("Save".uppercased())
                        .padding()
                        .background(Color.blue.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                })
                
                ForEach(dataArray, id:\.self){ data in
                    Text(data)
                }
                Spacer()
                
                Button(action: {
                    RandomName()
                }, label:{
                    Text("Chose Random")
                        .padding()
                        .background(Color.blue.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(random)
                })
                Button(action: {
                    addClass()
                }, label:{
                    Text("Add Class")
                        .padding()
                        .background(Color.blue.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                    
                })
                .padding()
                ForEach(classname, id:\.self){ data in
                    Text(data)
                }

                .padding()
                ForEach(ChoseenArray, id:\.self){ data in
                    Text(data)
                }
                
            }.onAppear(perform: {
                load()
            })
            
            .padding()
            
            .navigationTitle("WASP")
            
            
        }
    }
    func TextIsName() -> Bool {
        if textFieldText.count >= 2 {
            return true
        }
        return false
    }
    func saveText(){
        dataArray.append(textFieldText)
        textFieldText = ""
        
    }
    func RandomName(){
        let random = dataArray.randomElement()
        print(random)
    }
    func save(){
        UserDefaults.standard.set(dataArray, forKey: "StudentNames")
        
    }
    func load(){
        if let loadedData:[String] = UserDefaults.standard.value(forKey: "StudentNames") as? [String] {
            dataArray = loadedData
            
            
        }
    }
    func removeRows(at offsets: IndexSet){
        dataArray.remove(atOffsets: offsets)
        save()
    }
    func addClass(){
        if addClassNameText != "" {
            classname.append(addClassNameText)
            addClassNameText = ""
            classesList.append( Class(ClassName: addClassNameText))
        }
        
    }
    
    
    
    
  
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
