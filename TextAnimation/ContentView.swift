//
//  ContentView.swift
//  TextAnimation
//
//  Created by irfan wahendra on 17/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var Yoffset: CGFloat = 0
    @State var tapCount = 3
    
    var body: some View {
        HStack {
            Text("Level Up")
            VStack(alignment: .leading, spacing: 20){
                Text("20")
                    .foregroundStyle(.green)
                Text("21")
                    .foregroundStyle(.orange)
                Text("22")
                    .foregroundStyle(.blue)
            }
            .offset(y:54 + Yoffset)
            .mask({
                Rectangle()
                    .frame(height:50)
            })
            Text("")
        }
        .font(.title.bold())
        .onAppear(){
            startTimer()
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            if tapCount > 1 {
                withAnimation(.bouncy(duration:2)) {
                    Yoffset -= 54
                }
                tapCount -= 1
            } else {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    ContentView()
}



