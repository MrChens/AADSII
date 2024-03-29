# 基础算法

算法：
递归：函数调用自身
基准情形：不在递归的情形

1. 找出基准情形
2. 看该函数在到达基准情形下会做什么
3. 看该函数在到达基准情形的前一步会做什么
4. 就这样往前推，看每一步都在做什么

计算机用栈来记录每个调用中的函数，这个栈就叫做调用栈。
func(1)
.
.
.
func(n-2)
func(n-1)
func(n)

无限递归的程序会一直将同一个方法加到调用栈上，直到计算机的内存空间不足，最终导致栈溢出的错误。

对有序数组可使用的查找方法：
线性查找：从左到右，逐个格子检查，直到找到。
二分查找：没错都找中间值，以排除掉剩余数字的一半。数据增加一倍，二分查找的步数只会增加1.

对于长度太小的有序数组，二分查找并不比线性查找好多少。

大O记法：一般都是指最坏情况下，查找效率的表现。

- O(1):常数时间，不论多大的数据量，其步数总是相同的。
- O(N):线性时间，当数据增加一个时，步数增加一步。
- O(log N)：其实指的是O(log2 n),对数时间，处理N个数据需要log2 N步。相当于将N不断除以2，多少次才能得到1.二分数据直至元素剩余1个的次数。


![1*j8FHj5GEC1rnMCS-rZ5W3g](https://user-images.githubusercontent.com/9456917/133919779-df182e71-e79f-4484-9424-195bb52f412b.png)

https://cooervo.github.io/Algorithms-DataStructures-BigONotation/big-O-notation.html

https://www.bigocheatsheet.com

<img width="793" alt="Screen Shot 2021-09-19 at 6 01 57 PM" src="https://user-images.githubusercontent.com/9456917/133923410-44423211-8524-4396-a694-9f6dbf2cab5b.png">

常用排序算法
- 冒泡排序O(N²)：一轮比较相邻的，然后交换（n-1次），从第一个元素开始，比较2个数哪个更大，交换2个数的位置以使它们按顺序排列。(N-1)+(N-2)+(N-3)+...+1次比较.处理N个元素，需要n²步（比较+交换）。
- 选择排序O(N²/2)-->O(N²)：一轮比较全部的，然后交换（1次），从第一个元素开始，逐次与后面的对比大小，直到最后一个元素，期间第一轮找到的最小元素与索引0交换，然后从第二元素开始找最小元素并与交换索引1。直到最后一个元素。(N-1)+(N-2)+(N-3)+...+1次比较,但是每轮交换最多只有1次
- 插入排序O(N²+N)-->O(N²)：对于未排序数据，在已排序序列中依次从后向前扫描，直到找到该数字大于已排序的位置并插入
- 快速排序：
- 快速选择：总体思路与快速排序一致，选择一个元素作为基准来对元素进行分区，将小于和大于基准的元素分在基准左边和右边的两个区域。不同的是，快速选择并不递归访问双边，而是只递归进入一边的元素中继续寻找。这降低了平均时间复杂度，从O(n log n)至O(n)，不过最坏情况仍然是O(n2)


快速排序依赖于一个名为分区的概念。

分区
1. 左指针逐个格子向右移动，当遇到大于或等于轴的值时，就停下来。
2. 右指针逐个格子向左移动，当遇到小于或等于轴的值时，就停下来。
3. 将两指针所指的值交换位置。
4. 重复上述步骤，直至两指针重合，或左指针移到右指针的右边。
5. 将轴与左指针所指的值交换位置。
当分区完成时，在轴左侧的那些值肯定比轴要小，在轴右侧的那些值肯定比轴要大。因此轴的位置也就确定了，虽然其他值的位置还没有完全确定。

快速排序严重依赖于分区
1. 把数组分区。使轴到正确的位置上去。
2. 对轴左右的两个子数组递归地重复第1，2步，也就是说，两个子数组都各自分区，并形成各自的轴以及由轴分隔的更小的子数组。然后也对这些子数组分区，以此类推。
3. 当分出的子数组长度为0或1时，即达到基准情形，无须进一步操作。

快排是一个经典的排序算法，其时间复杂度为O(nlogn), 其基本流程如下，对于以个数组 nums：
- 首先选定一个轴心值 p。
- 将数组中小于 p 的值移到数组左端，其他移动到数组右端。
- 递归分别处理数组中 p 左右两边的子数组。


```
快速选择复杂度
平均時間複雜度	O(n)
最坏时间复杂度	О(n2)
最优时间复杂度	О(n)
空間複雜度	O(1)
快速选择是一种从无序列表找到第k小元素的高效选择算法。它从原理上来说与快速排序有关。具有很好的平均时间复杂度，然而最坏时间复杂度则不理想。
```

常见的例子是求数组的第 k 小的数，运用快速选择算法的基本流程如下：
O(nlogn) 时间复杂度的问题

- 首先选定一个轴心值 p。
- 将数组中小于 p 的值移到数组左端，其他移动到数组右端。
- 计算轴心左端的数 (包括轴心自己) 有多少，记为 count
- 如果 count 正好为 k，则返回此时轴心值，此值即为第 k 小的数。
- 如果左端的数 count 大于 k，说明在左端，所以只递归左边即可。
- 如果不在左端，只递归在右边寻找

```
             最好情况       平均情况       最坏情况
插入排序      O(N)             O(N²)        O(N²)  

快速排序      O(N*log N)     O(N*log N)    O(N²)
```
```
冒泡排序
void bubbleSort (int arr[], int len)
{

	int i, j,temp;
	_Bool exchanged = true;
	
	for (i=0; exchanged && i<len-1; i++){  /* 外迴圈為排序趟數，len個數進行len-1趟,只有交換過,exchanged值為true才有執行迴圈的必要,否則exchanged值為false不執行迴圈 */
        exchanged = false;
		for (j=0; j<len-1-i; j++) 
		{                                    /* 內迴圈為每趟比較的次數，第i趟比較len-i次  */
			if (arr[j] > arr[j+1])
			{                                  /* 相鄰元素比較，若逆序則互換（升序為左大於右，逆序反之） */
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
				exchanged = true;                /*只有數值互換過, exchanged才會從false變成true,否則數列已經排序完成,exchanged值仍然為false,沒必要排序 */
			}
       }
    }
}
```

```
选择排序
void selection_sort(int a[], int len) 
{
    int i,j,temp;

	for (i = 0 ; i < len - 1 ; i++) 
    {
		int min = i;
		for (j = i + 1; j < len; j++)     //走訪未排序的元素
		{
			if (a[j] < a[min])    //找到目前最小值
			{
				min = j;    //紀錄最小值
			}
		}
		if(min != i)
		{
		  temp=a[min];  //交換兩個變數
		  a[min]=a[i];
		  a[i]=temp;
		}
	   	/* swap(&a[min], &a[i]);  */   //做交換
	}
}

```

```
插入排序
void insertion_sort(int arr[], int len){
        int i,j,key;
        for (i=1;i!=len;++i){
                key = arr[i];
                j=i-1;
                while((j>=0) && (arr[j]>key)) {
                        arr[j+1] = arr[j];
                        j--;
                }
                arr[j+1] = key;
        }
}
```
```
快速排序
template <typename T>
void quick_sort_recursive(T arr[], int start, int end) {
    if (start >= end)
        return;
    T mid = arr[end];
    int left = start, right = end - 1;
    while (left < right) { //在整个范围内搜寻比枢纽元值小或大的元素，然后将左侧元素与右侧元素交换
        while (arr[left] < mid && left < right) //试图在左侧找到一个比枢纽元更大的元素
            left++;
        while (arr[right] >= mid && left < right) //试图在右侧找到一个比枢纽元更小的元素
            right--;
        std::swap(arr[left], arr[right]); //交换元素
    }
    if (arr[left] >= arr[end])
        std::swap(arr[left], arr[end]);
    else
        left++;
    quick_sort_recursive(arr, start, left - 1);
    quick_sort_recursive(arr, left + 1, end);
}
template <typename T> //整數或浮點數皆可使用,若要使用物件(class)時必須設定"小於"(<)、"大於"(>)、"不小於"(>=)的運算子功能
void quick_sort(T arr[], int len) {
    quick_sort_recursive(arr, 0, len - 1);
}
```
```
快速选择
function quickSelection(nums, s, e, k) {
    let i = s, j = e;
    // move random chosen value to index s.
    const rk = Math.floor(s + Math.random() * (e - s + 1));
    [nums[s], nums[rk]] = [nums[rk], nums[s]];
    const p = nums[s]; 
    // start move i, j until i >= j, and after loop, i will be filled with p value.
    while (i < j) {
        while (i < j && nums[j] >= p) j--;
        nums[i] = nums[j];
        while (i < j && nums[i] <= p) i++;
        nums[j] = nums[i];
    }
    nums[i] = p;
    const pk = i - s + 1;
    if (pk == k) return nums[i];
    if (pk > k) return quickSelection(nums, s, i - 1, k);
    else return quickSelection(nums, i + 1, e, k - pk);
}
```
