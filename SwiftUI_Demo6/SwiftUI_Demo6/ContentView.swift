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
      @State var fruit = ""
    
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
                    self.title += String(self.currentIndex)
                    
                    
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
            } .presentation($show) { () -> Alert in
//                Alert(title: Text(self.title))
                Alert(title: Text(self.title), message: Text("内容消息"), dismissButton: .destructive(Text("确定")))
            }
      
            if show {
               Text("点击buttton的详情").color(.orange).font(.largeTitle).animation(.basic(duration: 1, curve: BasicAnimationTimingCurve.easeInOut))
//                .transition(.scale()).transition(.opacity)
                //点击只有如何改变原来Button的一些属性
            }else{
                HStack{
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
                        .animation(.spring())
                        .rotationEffect(Angle(degrees: 180))
                    
             
                }.animation(.spring()).transition(.slide)
                
            }
            TextField($fruit, placeholder: Text("请输入内容").font(.largeTitle), onEditingChanged: { (isChanged) in
                print(isChanged)
            }) {
                print("commit")
              
              
                }.background(Color.white)
            
          
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
