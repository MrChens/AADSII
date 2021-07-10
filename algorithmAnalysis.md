> 描述一个算法的好坏有三个维度：
>
> - 是否正确
> - 是否高效
> - 是否容易实现

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