class Search {

    func binarySearch(arr: [Int], numb: Int) -> Bool {
        var left = 0
        var right = arr.count

        while (left <= right) {
            let mid = left + (right - left) / 2
            if (arr[mid] == numb) {
                return true
            }
            if (numb < arr[mid]) {
                right = mid - 1
            } 
            if (numb > arr[mid]) {
                left = mid + 1
            }
        }
        return false
    }
}

let obj = Search()
let numbers: [Int] = [10, 30, 40, 2, 20, 32, 43, 45, 23, 12, 32, 1 ]
let searchNum = 100
let  result = obj.binarySearch(arr: numbers, numb: searchNum)
print(result)