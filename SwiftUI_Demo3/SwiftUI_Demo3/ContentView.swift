//
//  ContentView.swift
//  SwiftUI_Demo3
//
//  Created by daniel on 13/06/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var countries = ["brazil","china","united-states","south-korea"]
    .shuffled()
    var correctAnswer = Int.random(in: 0...3)
    @State private var score = 0
    @State private var alertTitle="select country"
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0...3){number in
                    Image(self.countries[number])
                        .shadow(radius: 10)
                        .border(Color.white,width: 1).tapAction {
                            self.flagTapped(number)
                    }
                    
                    
                }
            }
            .navigationBarTitle(Text(countries[correctAnswer]
            .uppercased()))
                .presentation($showingAlert){
                    Alert(title: Text(alertTitle), message: Text("this is your country"), dismissButton: .default(Text("confirm")))
            }
            
        }

    }
    func flagTapped(_ tag:Int)  {
        if tag == correctAnswer {
            score+=1
        }else{
            score-=1
        }
        showingAlert=true
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
