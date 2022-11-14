//
//  ProgramObject.swift
//  WaspCat499Csumb
//
//  Created by user228393 on 10/14/22.
//

import UIKit

public class ProgramObject: NSObject, ObservableObject, NSSecureCoding {
    
    public static var supportsSecureCoding: Bool = true
    
    let id = UUID()
    @Published var title: String?
    @Published var students: [String] = []
    
    
    func initWithData( title : String,
                       students : [String])
    {
        self.title = title
        self.students = students
    
    }
    
    public required convenience init?(coder: NSCoder) {
        guard let title = coder.decodeObject(forKey: "title") as? String,
        let students = coder.decodeObject(forKey: "students") as? [String]
        else { return nil }
        
        self.init()
        self.initWithData(title: title as String, students: students as [String])
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(self.title, forKey: "title")
        coder.encode(self.students, forKey: "students")

    }
    
   
}
