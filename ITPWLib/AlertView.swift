//
//  AlertView.swift
//  ITPWLib
//
//  Created by Permyakov Vladislav on 23.03.2022.
//

import SwiftUI

internal struct AlertView: View {
    @State var text: String
    var close: ()->()
    private func removeView(){
        withAnimation {
            offset = -300
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                close()
            }
        }
    }
    @State private var offset = -300.0
    
    var body: some View {
        VStack{
            Text(text)
                .padding()
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
                .offset(x: 0, y: offset)
                .animation(.easeInOut)
                .onTapGesture {
                   removeView()
                }
            Spacer()
        }
        .onAppear(perform: {
            withAnimation {
                offset = 0
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    offset = -300
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.close()
                }
            }
        })
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(text: "BigText", close: {print("cuck")})
    }
}