import UIKit

class NetworkManager: NetworkManagerProtocol {
    
    private let session: URLSession
    private let timeout: Double = 5
    private let retryAfterSecond: Double = 3
    private let maxRetries: Int = 5
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    
    func call(with request: URLRequest, attempt: Int = 0, completion: @escaping(Result<Currency, NetworkError>) -> Void) {
        
        var inProgress: Bool = true
        
        let task = session.dataTask(with: request) { data, response, error in
            
            inProgress = false
            
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
                return
            }
            
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let currency = try decoder.decode(Currency.self, from: data)
                    completion(.success(currency))
                    
                } catch let error {
                    completion(.failure(.invalidURL()))
                    print(error)
                }
            }
            else {
                if attempt < self.maxRetries {
                    self.setTimeout(self.retryAfterSecond) {
                        self.call(with: request, attempt: attempt + 1, completion: completion)
                    }
                } else {
                    completion(.failure(.connectionFailure()))
                }
            }
        }
        task.resume()
        
        setTimeout(timeout) {
            if inProgress {
                task.cancel()
                if attempt < self.maxRetries {
                    self.call(with: request, attempt: attempt + 1, completion: completion)
                } else {
                    completion(.failure(.timedOut()))
                }
            }
        }
    }
     func setTimeout(_ seconds: Double, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
