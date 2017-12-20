//  FilmsController.swift
//  Created by Alex Rupérez on 7/11/17.
//  Copyright © 2017 Intelygenz. All rights reserved.

import Foundation
import Domain
import RxSwift

protocol FilmsControllerProtocol: BaseController {
    var films: [Film] { get }
    var query: String { get }
    var type: String { get }
    var page: Int { get }
    func search(_ query: String, type: String, page: Int)
    func refresh()
    func loadMore()
}

class FilmsController: FilmsControllerProtocol {
    weak var viewController: FilmsViewController?
    private(set) var films = [Film]() {
        didSet {
            viewController?.reloadData()
        }
    }
    private let filmsInteractor: FilmsInteractorProtocol = FilmsInteractor()
    private(set) var query = "Star Wars" {
        didSet {
            viewController?.title = query
        }
    }
    private(set) var type: String = "all"
    private(set) var page: Int = 1
    private var total: Int?
    private var disposeBag: DisposeBag

    required init(_ viewController: FilmsViewController) {
        self.viewController = viewController
        self.disposeBag = DisposeBag()
    }

    func load() {
        refresh()
    }

    func willDisappear(_ animated: Bool) {
        self.disposeBag = DisposeBag()
    }

    func search(_ query: String, type: String, page: Int = 1) {
        // TODO: guard filmsSearchKommand?.state != .running else { return }

        filmsInteractor.films(query, type: FilmsInteractorSearchType(rawValue: type), page: page).subscribe { event in
            switch event {
            case .next(let films, let total):
                self.query = query
                self.type = type
                self.page = page
                self.total = total
                if page == 1 {
                    self.films = films
                } else {
                    self.films.append(contentsOf: films)
                }
            case .error(let error):
                self.viewController?.showAlert(error.localizedDescription, completion: {
                    self.viewController?.reloadData()
                })
            case .completed:
                log.debug("completed")
            }
        }.disposed(by: disposeBag)
    }

    func refresh() {
        search(query, type: type)
    }

    func loadMore() {
        guard let total = total, films.count < total else {
            return
        }
        search(query, type: type, page: page + 1)
    }

}
