//
//  home.swift
//  Rabbit
//
//  Created by HUSSAM on 05/06/1444 AH.
//

import SwiftUI

struct home: View {
    
    //text field
    @State var isShow :Bool = false
    @State var moveDown :Bool = false
    @State var isShowtxt :Bool = true
    @State var text: String = "";
    @State var todos: [String] = [];
    @State var ShowThing : Bool = false
    
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.black, Color("bl")]), startPoint: .bottomTrailing, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            ScrollView{
                VStack{
                    Image("slay2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 320, height: 350)
                        .offset(y: -5)
                        .scaleEffect(isShow ? 1 : 0.5)
                        .animation(.interpolatingSpring(stiffness: 5, damping: 2),  value: isShow)
                    
                    
                    ZStack{
                        HStack{
                            TextField("", text: self.$text, prompt: Text(" Add Task").foregroundColor(.black.opacity(0.6)))
                                .frame(width: 340, height: 50)
                            
                                .background(Color.white)
                                .foregroundColor(Color.black)
                                .cornerRadius(60)
                                .shadow(color: .white, radius: 15)
                                .padding(20)
                                .offset(y:-50)
                        }
                        ZStack{
                            
                            Button {
                                self.todos.append(self.text)
                                self.text = ""
                                withAnimation{
                                    self.ShowThing.toggle()
                                }
                            }label: {
                                Text("Add!")
                                
                            }
                            
                            .padding(10)
                            .background(Color("bl"))
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .shadow(color: Color.white.opacity(0.25), radius: 6)
                            .offset(x: 140, y:-50)
                            .animation(.default, value: ShowThing)
                        }
                    }
                    ZStack{
                        VStack{
                            ForEach (self.todos, id: \.self){ todo in
                                Todoitem(todo: todo)
                                
                                
                                    .onLongPressGesture{
                                        
                                        if let index = todos.firstIndex(of: todo) {
                                            todos.remove(at: index)
                                        }
                                        
                                    }
                                    .transition(AnyTransition.opacity.combined(with: .slide))
                                    .foregroundColor(.white)
                                Divider()
                                    .overlay(Color.blue.opacity(0.5))
                                
                                
                                
                                
                            }
                            
                        }
                       
                        Spacer()
                        
                    }
                    
                    
                    
                    
                }
                .onAppear(perform: {
                    isShow = true })
            }
        }
        
    }
    
    struct CheckBox: View {
        @Binding var checked: Bool
        var body: some View {
            Button(action:{
                self.checked.toggle()
            }) {
                Image(systemName: self.checked ? "checkmark.circle" : "circle")
                    .resizable()
                    .foregroundColor(.white)
                
            }.buttonStyle(PlainButtonStyle())
        }
        
        
    }
    
    struct Todoitem: View{
        @State var todo: String
        @State var checked = false;
        var body: some View {
            
            CheckBox(checked: $checked)
                .frame(width: 25, height: 25)
            Text(self.todo)
            
        }
    }
    
    struct home_Previews: PreviewProvider {
        static var previews: some View {
            home()
            
        }
    }
}
