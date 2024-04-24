//
//  LAContext+Extension.swift
//  SafeLock
//
//  Created by Divyesh Vekariya on 24/04/24.
//

import LocalAuthentication

extension LAContext {
    enum BiometricType: String {
        case none
        case touchID
        case faceID
        case opticID
    }

    var biometricType: BiometricType {
        var error: NSError?

        guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .none
        }

        if #available(iOS 11.0, *) {
            switch self.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touchID
            case .faceID:
                return .faceID
            default:
                if #available(iOS 17.0, *) {
                    if self.biometryType == .opticID {
                        return .opticID
                    } else {
                        return .none
                    }
                }
            }
        }

        return  self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchID : .none
    }
}
