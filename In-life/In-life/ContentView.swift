//
//  ContentView.swift
//  In-life
//
//  Created by Gianmarco Lugaresi on 08/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State var date = Date(timeIntervalSinceNow: 0)
    @State var isClicked = false
    @State var x: Int = 7
    @State var text = ""
    @State private var Invest = Array(repeating: "0" , count: 100)
    @State private var date1 = Array(repeating: "", count: 100)
    @State private var profit = Array(repeating: "0", count: 100)
    @State private var tot = Array(repeating: "", count: 100)
    
    var body: some View {
        
        VStack{
            if(isClicked){
                DatePicker("", selection: $date)
                    .datePickerStyle(FieldDatePickerStyle())
                    .padding(10)
            }
            
            VStack{
                HStack{
                    Button("Date") {
                        isClicked = !isClicked
                    }
                    .position(CGPoint(x: 710, y: -23))
                    Button("Reset"){
                        x = 7
                        for i in 0..<7{
                            tot[i] = ""
                            Invest[i] = ""
                            profit[i] = ""
                            date1[i] = ""
                        }
                    }
                    .position(CGPoint(x: -365, y: -23))
                }
                HStack{
                    Text("In-Life")
                        .position(CGPoint(x: 200, y: 35))
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .background(Color.orange)
                .cornerRadius(8)
                .padding(0)
                .frame(width: 400,height: 70)
                .position(CGPoint(x: 350, y: -40.0))
                
                ScrollView{
                    Text("")
                    Text("")
                    Text("")
                    VStack(spacing: 30){
                        Text("")
                        ForEach(0..<x, id: \.self) { index in
                            HStack{
                                Text("                ")
                                
                                Button("+"){
                                    x = x + 1
                                    print(Invest[index])
                                }
                                
                                
                                Text("   ")
                                
                                
                                TextField("Invest", text: $Invest[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .onChange(of: Invest[index]) { newValue, _ in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.Invest[index] = filtered
                                        }
                                    }
                                
                                TextField("Date", text: $date1[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                TextField("Profit", text: $profit[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .onChange(of: profit[index]) { newValue, _ in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.profit[index] = filtered
                                        }
                                    }
                                TextField("Profit", text: $tot[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                
                                
                                
                                Text("   ")
                                
                                
                                
                                Button("-"){
                                    print(index)
                                    for i in index+1..<x{
                                        Invest[i-1] = Invest[i]
                                        date1[i-1] = date1[i]
                                        profit[i-1] = profit[i]
                                        tot[i-1] = tot[i]
                                        
                                    }
                                    x = x-1
                                }
                                
                                
                                Text("                ")
                                
                            }
                            
                        }
                        
                    }
                    
                    
                }
                .position(CGPoint(x: 350, y: 130))
                .frame(width: 700 , height: 330)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(14)
                
                HStack{
                    
                    Text(date, format: .dateTime.day().month().year())
                    
                }
                
            }
            .padding(50)
            .frame(width:800, height: 550)
            .background(Color.white)
            .environment(\.colorScheme, .light)
            .cornerRadius(10)
            
        }
        .frame(width:800, height:self.isClicked ? CGFloat(600): CGFloat(550))
        
    }
    
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
