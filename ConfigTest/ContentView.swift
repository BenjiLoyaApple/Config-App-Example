//
//  ContentView.swift
//  ConfigTest
//
//  Created by Benji Loya on 24.10.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                NavigationStack {
                    BuildInfoView()
                }
                .tabItem {
                    Label("Build Info", systemImage: "gearshape")
                }
                
//MARK: - variant 1
#if DEBUG
                Text("Debug")
#else
                Text("Hello")
#endif
                
//MARK: - variant 2
                
                let debugViewEnvs: [BuildEnvironment] = [.dev, .qa]

                if debugViewEnvs.contains(where: { GlobalSettings.environment == $0 }) {
                    NavigationStack {
                        DebugView()
                    }
                    .tabItem {
                        Label("Debug Opts", systemImage: "ladybug")
                    }
                }
                
            }
    }
}

#Preview {
    ContentView()
}
