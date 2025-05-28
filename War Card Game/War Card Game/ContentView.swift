//
//  ContentView.swift
//  War Card Game
//
//  Created by Anuj Shrestha on 5/22/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    @State private var showAlert = false
    @State private var winnerMessage = ""

    
    var body: some View {
            ZStack {
                Image("background-plain")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Image("logo")
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Image(playerCard)
                        Spacer()
                        Image(cpuCard)
                        Spacer()
                    }
                    Spacer()
                    
                    Button {
                        deal()
                    } label: {
                        Image("button")
                    }
                    
                    Button("Reset", action: {
                        resetScore()
                    })
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        VStack {
                            Text("Player")
                                .font(.headline)
                                .padding(.bottom, 10.0)
                            Text(String(playerScore))
                                .font(.largeTitle)
                        }
                        Spacer()
                        VStack {
                            Text("CPU")
                                .font(.headline)
                                .padding(.bottom, 10.0)
                            Text(String(cpuScore))
                                .font(.largeTitle)
                        }
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Game Over"),
                            message: Text(winnerMessage),
                            dismissButton: .default(Text("OK")) {
                                resetScore()
                            }
                        )
                    }
                    
                    Spacer()
                }
            }
        }
    
    
    func deal(){
        var RandPlayerNum = Int.random(in: 2...14)
        var RandCPUNum = Int.random(in: 2...14)
        
        playerCard = "card" + String(RandPlayerNum)
        cpuCard =  "card" + String(RandCPUNum)
        
        if (RandPlayerNum > RandCPUNum) {
            playerScore += 1
        }
        else if (RandCPUNum > RandPlayerNum) {
            cpuScore += 1
        }
        
        if (playerScore == 10) {
            winnerMessage = "Player wins the game!"
            showAlert = true
        }
        else if (cpuScore == 10) {
            winnerMessage = "CPU wins the game!"
            showAlert = true
            
        }
    }
    
    func resetScore(){
        playerScore = 0
        cpuScore = 0
    }
}

#Preview {
    ContentView()
}
