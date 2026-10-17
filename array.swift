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

    // Maximum Subarray Sum of Size K
    func maxSubArraySumOfSizeK(k: Int) -> Int {
        guard arr.count >= k else { return 0 }
        
        var currentSum = 0

        for i in 0..<k {
            currentSum += arr[i]
        }
        var maxSum = currentSum

        for i in k..<arr.count {
            currentSum += arr[i] - arr[i - k]
            maxSum = max(maxSum, currentSum)
        }
        return maxSum
    }

    // contain duplicate
    func containDuplicate() -> Bool {
        var seen: Set<Int> = Set()

        for num in arr {
            if seen.contains(num) {
                return true
            }
            seen.insert(num)
        }
        return false
    }
 
    // contain duplicate II
    func containDuplicateII(k: Int) -> Bool {
        var seen: [Int: Int] = [:]

        for (i, num) in arr.enumerated() {
            if let lastIndex = seen[num], i - lastIndex <= k {
                return true
            }
            seen[num] = i
        }
        return false
    }

    // longest substring without repeating characters
    func longestSubstring(_ s: String) -> Int {
        let chars = Array(s)

        var left = 0
        var maxLength = 0
        var seen: Set<Character> = []

        for right in 0..<chars.count {
            while seen.contains(chars[right]) {
                seen.remove(chars[left])
                left += 1
            }
            seen.insert(chars[right])
            maxLength = max(maxLength, right - left + 1)
        }
        return maxLength
    }

    // minimum window substring
    func minWindowSubstring() {
        
    }

    // longest string()
    func longestString(_ s: String, _ k: Int) -> Int {
        let chars = Array(s)

        var left = 0
        var maxLength = 0
        var maxFreq = 0
        var count: [Character: Int] = [:]

        for right in  0..<chars.count {
            count[chars[right], default: 0] += 1

            maxFreq = max(maxFreq, count[chars[right]]!)

            while (right - left + 1) - maxFreq > k {
                count[chars[left]]! -= 1
                left += 1
            }

            maxLength = max(maxLength, right - left + 1)
        }
        return maxLength
    }

    // Permutation in String
    func stringPermutation(s1: String, s2: String) -> Bool {
        guard s1.count <= s2.count else { return false}

        let s1Arr = Array(s1)
        let s2Arr = Array(s2)

        var s1Count = Array(repeating: 0, count: 26)
        var s2Count = Array(repeating: 0, count: 26)
        let asciiA = Int(Character("a").asciiValue!)

        for i in 0..<s1Arr.count {
            s1Count[Int(s1Arr[i].asciiValue!) - asciiA] += 1
            s2Count[Int(s2Arr[i].asciiValue!) - asciiA] += 1
        }

        if s1Count == s2Count { return true }

        for i in s1Arr.count..<s2Arr.count {
            s2Count[Int(s2Arr[i].asciiValue!) - asciiA] += 1
            s2Count[Int(s2Arr[i - s1Arr.count].asciiValue!) - asciiA] -= 1

            if s1Count == s2Count { return true }
        }

        return false
    }

    //Minimum Window Substring 
    func minWindowSubString() {
        
    }
    
}

let arrayObj = Arrays()

print("\(arrayObj.validPalindrome())")