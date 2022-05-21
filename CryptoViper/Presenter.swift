//
//  Presenter.swift
//  CryptoViper
//
//  Created by Melih Yuvacı on 20.05.2022.
//

import Foundation

// Class ,Protocol
// Talks to -> Interactor,Router,View

enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor?  { get set }
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto (result: Result<[Crypto],Error>)
    
}

class CryptoPresenter : AnyPresenter{
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet{
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            // view.update
            view?.update(with: cryptos)
            print("update")
        case .failure (_):
            // view.update error
            view?.update(wiht: "Try Again Later...")
            print("error")
        }
    }
    
}

