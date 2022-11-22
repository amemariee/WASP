//
//  ConnectionProvider.swift
//  WaspCat499Csumb
//
//  Created by user228393 on 10/14/22.
//

import UIKit
import WatchConnectivity

class ConnectionProvider: NSObject, WCSessionDelegate {
    
    
    private let session : WCSession
    var programs : [ProgramObject] = []
    var receivedPrograms : [ProgramObject] = []
    var lastMessage : CFAbsoluteTime = 0
    
    init(session : WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        
        #if os(iOS)
            print("Connection provider initialized on phone")
        #endif
        
        #if os(watchOS)
            print("Connection provider initialized on watch")
        #endif
        
        self.connect()
    }
    
    func connect(){
        guard WCSession.isSupported() else {
            print("WCSession is not supported")
            return
        }
        
        session.activate()
    }
    
    func send(message : [String : Any]) -> Void {
        session.sendMessage(message, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }

    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    #endif
    
    func addClass(title : String ){
        let progObj3 = ProgramObject()
        progObj3.initWithData(title: title, students: [])
        programs.append(progObj3)
        dump(programs)
        
    }
    
    func removeClass(idRemove : UUID){
        
        if let index = programs.index(where: {
            $0.id == idRemove
        }){
            programs.remove(at: index)
        }
    }
    
    func initFakeDetails(){
        programs.removeAll()
        
        let progObj = ProgramObject()
        progObj.initWithData(title: "CST 123", students: ["Amy", "Yma"])
        programs.append(progObj)
        
        let progObj2 = ProgramObject()
        progObj2.initWithData(title: "CST 153", students: ["Name1","Name2"])
        programs.append(progObj2)
    
        NSKeyedArchiver.setClassName("ProgramObject", for: ProgramObject.self)
        let programData = try! NSKeyedArchiver.archivedData(withRootObject: programs, requiringSecureCoding: true)
        sendWatchMessage(msgData: programData)

}
    func sendWatchMessage( msgData : Data){
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        if lastMessage + 0.5 >  currentTime {
            return
        }
        
        if(session.isReachable){
            print("Sending watch Message")
            let message = ["progData" : msgData]
            session.sendMessage(message, replyHandler:  nil)
            
        }
        lastMessage = CFAbsoluteTimeGetCurrent()
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("entered didreceivemessage")
        
        if(message["progData"] != nil){
            let loadedData = message["progData"]
            print("progDaata no reply handler")
            
            NSKeyedUnarchiver.setClass(ProgramObject.self, forClassName: "ProgramObject")
            let loadedPerson = try! NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClasses: [ProgramObject.self], from: loadedData as! Data) as? [ProgramObject]
            
            self.receivedPrograms = loadedPerson!
            print("program recived")
        }
    }
}
