//
//  ProgramViewModel.swift
//  WaspCat499Csumb
//
//  Created by user228393 on 10/20/22.
//

import UIKit

final class ProgramViewModel: ObservableObject {
    private(set) var connectivityProvider : ConnectionProvider
    
    init(connectivityProvider : ConnectionProvider){
        self.connectivityProvider = connectivityProvider
        self.connectivityProvider.connect()
        
    
    }
}
