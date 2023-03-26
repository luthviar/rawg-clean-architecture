//
//  AppInjection.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 26/03/23.
//

import Foundation
import RGHome
import RGCore

final class AppInjection: NSObject {
    private let coreInjection = CoreInjection()

    func provideHome() -> HomeUseCase {
        return coreInjection.provideHome()
    }
}

