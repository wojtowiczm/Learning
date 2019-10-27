import UIKit

// Concurrent map implementation based on https://talk.objc.io/episodes/S01E90-concurrent-map
extension Array {

    /// Returns an array containing the results of mapping the given closure over the sequence’s elements.
    /// The mapping operations are processed on give queue
    /// - Parameter queue: Queue on which tranform operations will be performed
    /// - Parameter transorm: A closure that accepts an element of this sequence as its argument and returns an value.
    func concurrentMap<M>(using queue: DispatchQueue, _ transform: (Element) -> M) -> [M] {
        
        var results = Array<M?>(repeating: nil, count: count)
        
        DispatchQueue.concurrentPerform(iterations: count) { index in
            let result = transform(self[index])
            queue.sync { results[index] = result }
        }
        
        return results.compactMap { $0 }
    }
}
