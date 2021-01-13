//
//  ContentView.swift
//  progressBarSwiftUI
//
//  Created by 허예은 on 2021/01/13.
//

import SwiftUI


struct ContentView: View {
    @State var progressValue: Int = 50
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ProgressBar(value: $progressValue)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
