//
//  ContentView.swift
//  Rabbit
//
//  Created by HUSSAM on 04/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State var isShow :Bool = false
    
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color("bl")]), startPoint: .bottomTrailing, endPoint: .topTrailing)
                    .ignoresSafeArea()
                VStack  {
                    
                    Image("Slay1")
                        .resizable()
                        .imageScale(.large)
                        .position(x:222, y: 210)
                        .scaledToFill()
                        .frame(width: 420, height: 22)
                        .scaleEffect(isShow ? 1 : 0.5)
                        .animation(.interpolatingSpring(stiffness: 100, damping: 500),  value: isShow)
                
                    VStack{
                    Text("THE BEST PLACE TODOLIST 🥂 ")
                            .font(.title)
                        .offset(y:220)
                       .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .scaleEffect(isShow ? 1 : 0.7)
                        .animation(.interpolatingSpring(stiffness: 30, damping: 100), value: isShow)
                        .transition(.move(edge: .trailing))
                        
                        NavigationLink(destination: home()) {
                            
                            Text("GET START ")
            
                                .frame(minWidth: 0, maxWidth: 300)
                                .padding()
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [Color("bl"), Color("bl")]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                                .font(.title)
                            
                        }.offset(y:230)
                    }
                }
                .onAppear(perform: {
                    isShow = true })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
