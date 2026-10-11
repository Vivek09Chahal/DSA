class QuickSort {

    func sort(array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }

        let pivot = array[array.count / 2]

        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }

        return sort(array: less) + equal + sort(array: greater)   
    }
}

let sorter = QuickSort()

let numbers = [38, 27, 43, 3, 8, 82, 10]
let sortedNumbers = sorter.sort(array: numbers)

print(sortedNumbers)