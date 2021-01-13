//
//  ProgressBar.swift
//  progressBarSwiftUI
//
//  Created by 허예은 on 2021/01/13.
//

import SwiftUI

struct ProgressBarValue {
    static let MAX = 100
}
struct ProgressBar: View {
    @Binding var value: Int

    var body: some View {
        VStack(alignment: .trailing, spacing: 10){
            Text("Progress \(value)%")
            ZStack(alignment: .leading) {
                Capsule().frame(width: UIScreen.main.bounds.width-20).foregroundColor(Color.gray)
                Capsule().frame(width: (UIScreen.main.bounds.width-20)*CGFloat(value)/CGFloat(ProgressBarValue.MAX)).foregroundColor(Color.purple)
            }.frame(height: 20)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: .constant(2))
    }
}
