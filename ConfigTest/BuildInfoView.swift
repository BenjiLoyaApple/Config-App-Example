//
//  BuildInfoView.swift
//  ConfigTest
//
//  Created by Benji Loya on 24.10.2024.
//

import SwiftUI

struct BuildInfoView: View {
    var body: some View {
        List {
            VStack {
                Section {
                    InfoView(title: "Scheme:", value: GlobalSettings.environment.rawValue.capitalized)
                    InfoView(title: "Base URL:", value: GlobalSettings.baseApiPath)
                } header: {
                    HeaderView(title: "Build Config Variables")
                }
                
                Section {
                    InfoView(title: "Force Subscription State:", value: "\(GlobalSettings.forcceSubscribedState ? "True" : "False")")
                } header: {
                    HeaderView(title: "Environment Variables")
                }
                
                Section {
                    InfoView(title: "Log Level:", value: GlobalSettings.logLevel)
                } header: {
                    HeaderView(title: "Hubrid Variables")
                }
            }
        }
        .navigationTitle("Build info")
    }
}

// MARK: - HeaderView
private extension BuildInfoView {
    struct HeaderView: View {
        var title: String
        
        var body: some View {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding(.vertical, 10)
        }
    }
}

// MARK: - InfoView
private extension BuildInfoView {
    struct InfoView: View {
        var title: String
        var value: String
        
        var body: some View {
            VStack {
                HStack {
                    Text(title)
                    Spacer()
                    
                    Text(value)
                        .foregroundStyle(.gray)
                }
                .font(.callout)
                
                Divider()
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        BuildInfoView()
    }
}
