# 基础数据结构





- 数组：在内存中划分出一些连续的空格子以备使用。内存中的每个格子都有自己的地址。
- 链表
- 栈
  - 只能在末尾（栈顶）插入数据，压栈
  - 只能读取末尾（栈顶）的数据
  - 只能移除末尾（栈顶）的数据，出栈
- 队列
  - 只能在末尾插入数据，入队
  - 只能读取开头的数据
  - 只能移除开头的数据，出队
- 哈希表/散列表，查找值的速度为O(1)，适用于检查数据的存在性。
- 树

数据结构一般都有以下4种操作：
读取:查看数据结构中某一位置上的数据。
查找:从数据结构中找出某给数据所在的位置。
插入:给数据结构增加一个数据值。
删除:从数据结构中移除一个数据值。

操作的速度，并不按时间计算，而是按步骤计算。操作的速度常被称为时间复杂度。




计算机之所以在读取数组中某个索引指向的值时，能直接跳到那个位置上，是因为它具备以下条件。
1. 计算机可用一步就跳到任意一个内存地址上。（比如你知道大街123号在哪，就可以直奔过去。只不过需要点时间，但电脑很快）
2. 数组本身会记有的一个格子的内存地址，因此，计算机知道这个数组的开头在哪里。
3. 数组的索引从0算起。


集合：一种不允许元素重复的数据结构，在插入的时候很费时，因为需要遍历一遍看是否有重复的地方。（这里指的是使用数组作为集合的实现底层）

散列表的效率取决于以下因素：
- 要存多少数据
- 有多少可用的格子
- 用什么样的散列函数

使用散列表时所需要权衡的：既要避免冲突，又要节省空间
可使用计算机科学家研究出的黄金法则：每增加7个元素，就增加10个格子。
数据量与格子数的比值称为负载因子，理想的负载因子是0.7（7个元素/10个格子）




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
