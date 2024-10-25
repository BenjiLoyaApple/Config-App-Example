//
//  SwiftUIView.swift
//  ConfigTest
//
//  Created by Benji Loya on 25.10.2024.
//

import SwiftUI

struct DebugView: View {
    
    @State private var showAlert = false
    @State private var alertTitle = "Test alert"
    @State private var alertMessage = "Alert Message"
    
    var body: some View {
        List {
            Button("Show Test Alert") {
                alertTitle = "Debug"
                alertMessage = "Showing Debug Alert"
                showAlert.toggle()
            }
            
            Button(action: {
                alertTitle = "Warning"
                alertMessage = "Simulating Crash"
                showAlert.toggle()
                
            }, label: {
                Text("Crash")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .tint(.red)
            })
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("Close", role: .cancel) {}
        }
    }
}

#Preview {
    DebugView()
}
