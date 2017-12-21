//
//  ServiceTaskProtocol+Rx.swift
//  Core
//
//  Created by Juan on 20/12/17.
//  Copyright © 2017 Intelygenz. All rights reserved.
//

import Foundation
import RxSwift
import Net

// TODO: generics
extension Reactive where Base: ServiceTask {

    func response() -> Observable<Any> {

        guard let request = self.base.requestBuilder?.build() else {
            return Observable.error(ServiceTaskError.netError(message: "Service task request missing.", underlying: nil))
        }

        let task = ServiceTask.net.data(request)
        task.rx.response().map { response in
            do {
                try parse(response)
            } catch {
                let serviceTaskError = error as? ServiceTaskError ?? ServiceTaskError.parserError(message: "Parser error.", underlying: error)
                return Observable.error(serviceTaskError)
            }
        }
    }
}
