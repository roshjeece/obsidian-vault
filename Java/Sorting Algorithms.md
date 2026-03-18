---

---
Bubble Sort

- Pushing largest number to right
- $O(n^2)$

Implementation:

```java
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {

        // Create my array:
        int[] unsortedArray = {10, 5, 7, 12, 3};

        // If [0] > [1], swap
        for (int x = 0; x < unsortedArray.length - 1; x++){ // number of passes (one less than length)
            for (int y = 0; y < unsortedArray.length - 1 - x; y++){ // compare neighbors
                    if (unsortedArray[y] > unsortedArray[y+1]) { // are they in order?
                        int temp = unsortedArray[y]; // assign left value to temp
                        unsortedArray[y] = unsortedArray[y+1]; // assign right value to left
                        unsortedArray[y+1] = temp; // reassign temp value to right
                    }
                }
            }
        System.out.print(Arrays.toString(unsortedArray));
        }
    }

```



---

## Merge Sort

- Divide and conquer approach
- Split arrays, sort each half, merge back together
- $O(n \log n)$ time complexity
- $O(n)$ space complexity

**Two-Pointer Merge Implementation:**
```java
import java.util.Arrays;

public class MergeSort {
    public static void main (String[] args) {
        int[] arr1 = {2, 10, 15, 17, 21};
        int[] arr2 = {6, 8, 19};
        int[] newArray = new int[arr1.length + arr2.length];
        int i = 0;
        int j = 0;

        while(i < arr1.length && j < arr2.length) {
            if (arr1[i] < arr2[j]) {
                newArray[i + j] = arr1[i++];
            }
            else {
                newArray[i + j] = arr2[j++];
            }
        }

        // Drain remaining elements from whichever array is not exhausted
        while (i < arr1.length) { newArray[i + j] = arr1[i++]; }
        while (j < arr2.length) { newArray[i + j] = arr2[j++]; }

        System.out.println(Arrays.toString(newArray));
    }
}
```

Key concepts: two-pointer technique, draining remaining elements, ternary operator alternative.

---

## Algorithm Comparison

| Algorithm | Time Complexity | Space | Use Case |
|---|---|---|---|
| Bubble Sort | O(n²) | O(1) | Learning only |
| Merge Sort | O(n log n) | O(n) | Large datasets |

---

## Related
- [[Recursion]] — many sorting algorithms use recursive logic
- [[Sorting Algorithms]] — merge sort is a direct application of sorting algorithm concepts
- [[Arrays]] — sorting operates on arrays