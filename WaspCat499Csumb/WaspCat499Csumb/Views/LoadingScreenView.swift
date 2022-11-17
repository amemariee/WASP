//
//  LoadingScreenView.swift
//  WaspCat499Csumb
//
//  Created by user228393 on 11/9/22.
//

import SwiftUI

struct LoadingScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        
        //let progObj = ProgramObject()
        //progObj.initWithData(title: "CST 123", students: ["Amy", "Yma"])
        //ConnectionProvider.programs.append(progObj)
        
        if isActive{
            ContentView(selectedClass: GlobalModel().selectedClass)
                //.enviornmentObject(progObj)
        }
        else{
            
        VStack{
            VStack{
                Image("appstore")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                Text("Watch Student Picker")
                    .font(Font.custom("Montserrat", size:26))
                    .foregroundColor(.black.opacity(0.80))
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.2)){
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                withAnimation{
                    self.isActive = true
                }
            }
        }
        }
    }
}

