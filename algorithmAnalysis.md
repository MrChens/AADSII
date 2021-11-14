> 描述一个算法的好坏有三个维度：
>
> - 是否正确
> - 是否高效
> - 是否容易实现


- 大O时间复杂度表示法:大 O 时间复杂度实际上并不具体表示代码真正的执行时间，而是`表示代码执行时间随数据规模增长的变化趋势`，所以，也叫作渐进时间复杂度（asymptotic time complexity），简称时间复杂度
  - 只关注循环执行次数最多的一段代码:我们在分析一个算法、一段代码的时间复杂度的时候，也只关注循环执行次数最多的那一段代码就可以了
  - 加法法则：总复杂度等于量级最大的那段代码的复杂度
  - 乘法法则：嵌套代码的复杂度等于嵌套内外代码复杂度的乘积
- 空间复杂度全称就是渐进空间复杂度（asymptotic space complexity），表示算法的存储空间与数据规模之间的增长关系
  - 


![Unknown1](https://user-images.githubusercontent.com/9456917/141667945-b226dea3-3167-45f7-a538-9bd42f5d8c57.png)

- 最好情况时间复杂度（best case time complexity）:在最理想的情况下，执行这段代码的时间复杂度。
- 最坏情况时间复杂度（worst case time complexity）:在最糟糕的情况下，执行这段代码的时间复杂度。
- 平均情况时间复杂度（average case time complexity）:这个值就是概率论中的加权平均值，也叫作期望值，所以平均时间复杂度的全称应该叫加权平均时间复杂度或者期望时间复杂度
- 均摊时间复杂度（amortized time complexity）:对一个数据结构进行一组连续操作中，大部分情况下时间复杂度都很低，只有个别情况下时间复杂度比较高，而且这些操作之间存在前后连贯的时序关系，这个时候，我们就可以将这一组操作放在一块儿分析，看是否能将较高时间复杂度那次操作的耗时，平摊到其他那些时间复杂度比较低的操作上。而且，在能够应用均摊时间复杂度分析的场合，一般均摊时间复杂度就等于最好情况时间复杂度

# The RAM Model of Computation

There are three desirable properties for a good algorithm. We seek algorithms that are **correct** and **efficient**, while being **easy** to implement.

The RAM Model of Computation

> Machine-independent algorithm design depends upon a hypothetical computer called the Random Access Machine or RAM.

- Each simple operation (+, *, -, =, if, call) takes exactly one time step.
- Loops and subroutines are **not** considered simple operations. Instead, they are the composition of many single-step operations. It makes no sense for **sort ** to be a single-step operation. since sorting 1,000,000 items will certainly take much longer than sorting 10 items. The time it takes to run through a loop or execute a subprogram depends upon the number of loop iterations or the specific nature of the subprogram.
- Each memory access takes exactly one time step. Further, we have as much memory as we need. The RAM model takes no notice of whether an item is in cache or on the disk.

Under the RAM model, we measure run time by counting up the number of steps an algorithm takes on a given problem instance. If we assume that our RAM executes a given number of steps per second, this operation count converts naturally to the actual running time.



- The **worst-case complexity** of the algorithm is the function defined by the maximum number of steps taken in any instance of size **n**. This represents the curve passing through the highest point in each column.
- The **best-case complexity** of the algorithm is the function defined by the minimum number of steps taken in any instance of size **n**. This represents the curve passing through the lowest point of each column.
- The **average-case complexity** of the algorithm, which is the function defined by the average number of steps over all instances of size **n**.

# The Big Oh Notation

> The best, worst, and average-case time complexities for any given algorithm are numerical functions over the size of possible problem instances. Howerer, it is very difficult to work precisely with these functions.
>
> It proves to be much easier to talk in terms of simple upper and lower bounds of time-complexity functions using the Big Oh notation. The Big Oh simplifies our analysis by ignoring levels of detail that do not impact our comparison of algorithms.
>
> The Big Oh notation igonres the difference between multiplicative constants. The functions f(n) = 2n and g(n) = n are identical in Big Oh analysis.
