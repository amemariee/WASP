//
//  ContentView.swift
//  WASP
//
//  Created by Rajveer Saini on 10/7/22.
//

import SwiftUI

struct ContentView: View {
    @State var textFieldText: String = ""
    @State var ChoseenArray: [String] = []
    @State var dataArray: [String] = []
  
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type Something Here", text: $textFieldText)
                    .foregroundColor(.black)
                    .font(.headline)
                    
                Button(action: {
                    if TextIsName(){
                        saveText()
                    }
                }, label:{
                    Text("Save".uppercased())
                        .padding()
                        .frame(width: .infinity)
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
                        .frame(width: .infinity)
                        .background(Color.blue.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
              })
                ForEach(ChoseenArray, id:\.self){ data in
                    Text(data)
                }
            
            }
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
        let randomstring = dataArray.randomElement()
        print(randomstring)
    }
        
    
    
    
    
  
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
