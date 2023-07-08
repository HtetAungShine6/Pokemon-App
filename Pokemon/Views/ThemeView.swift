//
//  ThemeView.swift
//  Pokemon
//
//  Created by Akito Daiki on 8/7/2566 BE.
//

import SwiftUI

import SwiftUI

import SwiftUI

struct ThemeView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.pink
                .opacity(0.3)]), startPoint: .center, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            ZStack{
                Toggle(isOn: $isDarkMode) {
                    Text("Dark Mode")
                }
                .padding()
                .onChange(of: isDarkMode) { _ in
                    UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Theme")
            .frame(alignment: .center)
            }
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
