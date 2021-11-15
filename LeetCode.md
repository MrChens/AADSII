70. 爬楼梯
假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
注意：给定 n 是一个正整数。

```
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
             
        if n == 2 {
            return 2
        }
        return climbStairs(n - 1) + climbStairs(n - 2)
    }
}
```

```
func climbStairs(_ n: Int) -> Int {
        if n < 2 {
            return 1
        }
        var dp :[Int] = Array(repeating:0, count: n + 1)
        dp[0] = 1
        dp[1] = 1

        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
    
        return dp[n]
    }
```


26. 删除有序数组中的重复项
给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。
不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

```
func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var fast = 1
        var slow = 0

        while fast < nums.count {
            if nums[slow] != nums[fast] {
                slow += 1
                nums[slow] = nums[fast]
            }
            fast += 1
        }
        return slow + 1
    }
```
