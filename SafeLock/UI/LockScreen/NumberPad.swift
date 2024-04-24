//
//  NumberPad.swift
//  SafeLock
//
//  Created by Divyesh Vekariya on 24/04/24.
//

import SwiftUI

struct NumberPad: View {
    let onAdd: (_ value: Int) -> Void
    let onRemoveLast: () -> Void
    let onDissmis: () -> Void

    private let columns: [GridItem] = Array(repeating: .init(), count: 3)

    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(1 ... 9, id: \.self){ index in
                Button {
                    onAdd(index)
                } label:{
                    Text("\(index)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,16)
                        .contentShape(.rect)
                }
            }
            Button {
                onRemoveLast()
            } label:{
                Image(systemName: "delete.backward")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,16)
                    .contentShape(.rect)
            }
            Button {
                onAdd(0)
            } label:{
                Text("0")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,16)
                    .contentShape(.rect)
            }
            Button {
                onDissmis()
            } label:{
                Image(systemName: "keyboard.chevron.compact.down")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,16)
                    .contentShape(.rect)
            }
        }
        .foregroundStyle(.primary)
    }
}
