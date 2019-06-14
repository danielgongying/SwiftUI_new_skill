//
//  ContentView.swift
//  SwiftUI_Demo6
//
//  Created by daniel on 14/06/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import SwiftUI
import Combine
struct ContentView : View {
    @State var show = false
    @State var title = "fsdfd"
    @State var backColor = Color.purple
      @State var rating = 0.5
       @State var value = 0
    @State var items = (0..<5).map { "Seg \($0)" }
    @State var currentIndex = 0
    @ObjectBinding var server = DateServer()
    var body: some View {
    
        VStack {
            Text(title)
            //slider
            Slider(value: $rating)
                .padding(30)
            //stepper
            Stepper(value: $value, step: 2, onEditingChanged: { c in
                print(c)
            }) {
                Text("Stepper Value: \(self.value)")
                }.padding(50).background(Color.green
            )
            
            
            //datePicker
            DatePicker(
                $server.date,
                minimumDate: Calendar.current.date(byAdding: .year,
                                                   value: 0,
                                                   to: server.date),
                maximumDate: Calendar.current.date(byAdding: .year,
                                                   value: 1,
                                                   to: server.date),
                displayedComponents: .date
            ).background(Color.purple)
            .cornerRadius(10)
    
            
               //圆形 .overlay(Circle().stroke(Color.white,lineWidth: 4))
           //矩形 .overlay(Rectangle().stroke(Color.red,lineWidth: 3))
            
            //SegmentedControl
            SegmentedControl(selection: $currentIndex) {
                ForEach(0..<items.count) { index in
                    Text(self.items[index]).tag(index)
                }
                }.tapAction {
                    print("currentIndex: \(self.currentIndex)")
            }
            .background(Color.purple)
            
            //button
            Button(action: {
                self.title += "💝"
                self.show.toggle()
                
                
            }) {
                Text(title).font(.largeTitle)
                    .color(.red)
                    .background(backColor)
                    .lineLimit(nil)
          
                
                    .cornerRadius(5).border(Color.black, width: 1).padding(.leading,10).padding(.trailing,10)
            }
            if show {
               Text("fdfdsfs")
                //点击只有如何改变原来Button的一些属性
            }else{
                
                Image("headphone").resizable()
                    .frame(width: 90, height: 90, alignment: .bottom)
                    .clipShape(Circle()).clipped()
                .animation(.basic(duration: 1, curve: .easeInOut))
                Image("headphone").resizable()
                    .frame(width: 90, height: 90, alignment: .bottom)
                    .clipShape(Circle()).clipped()
                    .animation(.spring(mass: 1, stiffness: 2, damping: 1, initialVelocity: 5))
                Image("headphone").resizable()
                    .frame(width: 90, height: 90, alignment: .bottom)
                    .clipShape(Circle()).clipped()
                    .animation(.basic(duration: 2, curve: .linear))
                .rotationEffect(Angle(degrees: 180))
                
            }
        }
    }
}
class DateServer: BindableObject {
    
    var didChange = PassthroughSubject<DateServer,Never>()
    var date: Date = Date() {
        didSet {
            didChange.send(self)
            print("Date Changed: \(date)")
        }
    }
}
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
