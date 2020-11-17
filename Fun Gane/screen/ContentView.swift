//
//  ContentView.swift
//  Fun Gane
//
//  Created by hosam on 11/17/20.
//

import SwiftUI


 


struct ContentView: View {
    
    @ObservedObject var viewModel = RLGameViewModel()
    
    var body: some View {
        VStack {
            
            ZStack {
                Color.purple
                VStack{
                Text("Player 2")
                Spacer()
                Text(viewModel.getFinalMove(forPlayer: .two))
                Spacer()
                Text(viewModel.getStatusText(forPlayer: .two))
                HStack{
                    ForEach(viewModel.getAllowedMovwa(forPlayer: .two), id:\.self) {move in
                         
                        Button(action: {
                            self.viewModel.choose(move, forPlayer: .two)
                        }, label: {
                            Spacer()
                            Text(move.rawValue)
                            Spacer()
                        })
                        
                    }
                }
                }.padding(.bottom,40)
            }
            .rotationEffect(.init(degrees: 180))
            
            //retry button
            if viewModel.isGameOver() {
                Button(action: {
                    self.viewModel.resetGame()
                }, label: {
                    Text("Retry ? 🔃 ")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                })
            }
            
            ZStack {
                Color.blue
                VStack{
                    Text("Player 1")
                    Spacer()
                    Text(viewModel.getFinalMove(forPlayer: .one))
                    Spacer()
                    Text(viewModel.getStatusText(forPlayer: .one))
                    HStack{
                        ForEach(viewModel.getAllowedMovwa(forPlayer: .one), id:\.self) {move in
                             
                            Button(action: {
                                self.viewModel.choose(move, forPlayer: .one)
                            }, label: {
                                Spacer()
                                Text(move.rawValue)
                                Spacer()
                            })
                            
                        }
                    }
                }.padding(.bottom,40)
            }
            
        }.foregroundColor(.white)
        .font(.largeTitle)
        
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
