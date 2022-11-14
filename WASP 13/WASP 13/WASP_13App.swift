//
//  WASP_13App.swift
//  WASP 13
//
//  Created by Rajveer Saini on 10/28/22.
//

import SwiftUI

@main
struct WASP_13App: App {
    @StateObject var authentication = Authentication()
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
                ContentView()
                    .environmentObject(authentication)
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
        }
    }
}
