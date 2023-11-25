
protocol RootViewModelProtocol {
    var didFinishFetchingData: ((_ message: String) -> Void)? { get set }
    func fetchData()
}
