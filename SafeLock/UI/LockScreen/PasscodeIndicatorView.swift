//
//  PasscodeIndicatorView.swift
//  SafeLock
//
//  Created by Divyesh Vekariya on 24/04/24.
//

import SwiftUI

struct PasscodeIndicatorView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var passcode: String
    let passcodeLength: Int
    var body: some View {
        HStack(spacing: 32){
            ForEach(0..<(passcodeLength), id: \.self) { index in
                Circle()
                    .fill(passcode.count > index ? .primary : Color(.clear))
                    .frame(width:20, height: 20)
                    .overlay{
                        Circle()
                            .stroke(colorScheme == .dark ? .white : .black, lineWidth: 1.0)
                    }
            }
        }
    }
}
