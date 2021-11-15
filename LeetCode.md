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
