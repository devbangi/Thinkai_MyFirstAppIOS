//
//  ContentView.swift
//  Thinkai
//
//  Created by Angi on 6/17/22.
//

import SwiftUI
import FBSDKLoginKit
import UIKit

struct ContentView: View {
    var body: some View {
        
        VStack{
            Group{
                Label("THINKAI", systemImage: "bolt.fill").frame(width: 550, height: 40).background(Color.mint).lineLimit(300).font(.custom("Times New Roman", size: 27)).position(x: 205.0, y: 0.0).frame(width: 422.0 , height: 31.0)
                Image("pete").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).frame(height: 100.0).position(x: 205.9, y: 31.0).aspectRatio(contentMode: .fit)
                Spacer()
                Group{
                    Button (action: {}, label: {
                        HStack{
                            Image("fb").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25)
                            Text("Sign in with Facebook")
                        }
                    })
                    Spacer()
                    Button (action: {}, label: {
                        HStack{
                            Image("google").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25)
                            Text("Sign in with Google")
                        }
                    })
                    Spacer()
                    Button (action: {}, label: {
                        HStack{
                            Image("email").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25)
                            Text("Sign in with Email")
                        }
                    })
                    Spacer()
                    Button (action:
                                {
                        //func handlePresentingVC(_ sender: UIButton) {
                               // let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                               // let secondVc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                            
                        //UIApplication.shared.keyWindow?.rootViewController?//.present(secondVc, animated: true)
                         // }
                    }
                        , label: {
                        HStack{
                            Text("Sign in").accentColor(Color.black).background(Color.mint)                 }
                    })
                    
                }
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
