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
    class Class: Identifiable {
        @State var ClassName: String
        @State var students: [String] = []
        
        init(ClassName: String, students: [String])
        {
            self.ClassName = ClassName
            self.students = students
        }
    }
    @State var classesList: [Class] = []
    @State var totalClass: Int = 0
    @State var currentClass: Int = 0
    var body: some View {
        NavigationView {
            
            VStack {
                TextField("Student Name", text: $textFieldText)
                    .foregroundColor(.black)
                    .font(.headline)
                List{
                        if(totalClass > 0)
                    {
                            
                            ForEach(classesList[currentClass].students, id: \.self)
                            {
                                students in
                                Text("\(students)")
                            }
                        }
                    
                    //.onDelete(perform: removeRows)
                }
                
                if(totalClass > 0)
                {
                    ForEach(classesList)
                    {
                        classes in
                        Text("\(classes.ClassName)")
                    }
                    //let data = ""
                    //for i in stride(from: 1, to: totalClass, by: 1)
                    //{
                    //    Text(classesList[i].ClassName)
                  // }
                   
                                    }
                TextField("Class Name", text: $addClassNameText)
                    .foregroundColor(.black)
                    .font(.headline)
                HStack{
                    
                    
                    Button(action: {
                        if TextIsName(){
                            saveText()
                            save()
                        }
                    }, label:{
                        Text("Add Student".uppercased())
                            .padding(5)
                            .background(Color.blue.cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.headline)
                    })
                    
                    
                    Spacer()
                    
                    Button(action: {
                        RandomName()
                    }, label:{
                        Text("Chose Random")
                            .padding(5)
                            .background(Color.blue.cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.headline)
                        Text(random)
                    })
                    Button(action: {
                        addClass()
                    }, label:{
                        Text("Add Class")
                            .padding(5)
                            .background(Color.blue.cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.headline)
                        
                    })                }
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
            
            .padding(4)
            
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
        //dataArray.append(textFieldText)
        //textFieldText = ""
        print("total class \(totalClass)")
        print("Text \(textFieldText)")
        print("current class\(classesList[currentClass])")
        if(totalClass > 0)
        {
            print("works")
            classesList[currentClass].students.append(textFieldText)
        }
        print(classesList[currentClass].students)
        
        //check append students
        dump(classesList[currentClass].students)
       
        
    }
    func RandomName(){
        //let random = dataArray.randomElement()
        let random = classesList[currentClass].students.randomElement()
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
            //classname.append(addClassNameText)
            //addClassNameText = ""
            classesList.append( Class(ClassName: addClassNameText, students: []))
            totalClass += 1
            addClassNameText = ""
            
        }
        if(totalClass == 0)
        {
            currentClass = 1
        }
            }
    
    
    
    
  
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
