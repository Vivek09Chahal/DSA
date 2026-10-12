let arr : [Int] = [32, 43, 45, 23, 34, 23, 54, 65, 42, 75,24, 57,67, 53, 65]
let arr2: [Int] = [1, 2, 3, 4, 5, 4, 3, 2,1]
let arr3: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]

var arr4: [Int] = [1, -1, 2, -2, 3, -3, 4, -4]
var arr5: [Int] = [0, 1, 0, 3, 12]

class Arrays {
    // valid palindrome
    func validPalindrome() -> Bool {
        var forward: Int = 0
        var backward: Int = arr2.count - 1

        while forward <= backward {
            if arr2[forward] != arr2[backward] {
                    return false
            }
            forward += 1
            backward -= 1
        }
        return true
    }

    //Two Sum II (Sorted Array)
    func twoSum(target: Int) -> [Int] {
        var forward: Int = 0
        var backward: Int = arr3.count - 1

        while forward <= backward {
            let sum = arr3[forward] + arr3[backward]
            if sum == target { 
                return [arr3[forward], arr3[backward]]
            } else if target < sum {
                backward -= 1
            } else {
                forward += 1
            }
        }
        return []
    }

    //  3Sum
    func threeSum() {
        arr4.sort()
        var result: [[Int]] = []    

        for i in 0..<arr4.count {
            if i > 0 && arr4[i] == arr4[i - 1] {
                continue
            }
            var left = i + 1
            var right = arr4.count - 1

            while left < right {
                let sum = arr4[i] + arr4[left] + arr4[right]
                if sum == 0 {
                    result.append([arr4[i], arr4[left], arr4[right]])
                    while left < right && arr4[left] == arr4[left + 1] {
                        left += 1
                    }
                    while left < right && arr4[right] == arr4[right - 1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
    }

    // move zeroes
    func moveZeroes() {
        var writerPoint = 0

        for readerPoint in 0..<arr5.count {
            if  arr5[readerPoint] != 0 {
                arr5[writerPoint] = arr5[readerPoint]
                writerPoint += 1
            }
        }

        for i in writerPoint..<arr5.count {
            arr5[i] = 0
        }
    }


    
}

let arrayObj = Arrays()

print("\(arrayObj.validPalindrome())")