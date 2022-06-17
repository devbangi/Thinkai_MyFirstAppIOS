//
//  ContentView.swift
//  Thinkai
//
//  Created by Angi on 6/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Group{
                Label("THINKAI", systemImage: "bolt.fill").frame(width: 550, height: 40).background(Color.mint).lineLimit(300).font(.custom("Times New Roman", size: 27)).position(x: 205.0, y: 0.0).frame(width: 422.0 , height: 31.0)
                Image("pete").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).frame(height: 100.0).position(x: 205.9, y: 31.0).aspectRatio(contentMode: .fit)
                Spacer()
                Group{
                Button("Sing in with Facebook") {
                    
                }
                Spacer()
                Button("Sing in with Google") {
            
                }
                Spacer()
                Button("Sing in with Email") {
                     /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }}
                Spacer()
                Image("background").resizable().aspectRatio(contentMode: .fit)
                Label("", systemImage: "bolt.fill").padding().frame(width: 550, height: 20).background(Color.mint).lineLimit(300).font(.custom("Times New Roman", size: 20))
                            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
