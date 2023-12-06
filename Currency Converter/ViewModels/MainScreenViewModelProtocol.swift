import UIKit

protocol MainScreenViewModelProtocol{
    func getData(completion: @escaping (Result<Currency, NetworkError>) -> Void)
    func convertMoney(_ rate: Double, _ money: Double ) -> String
}
