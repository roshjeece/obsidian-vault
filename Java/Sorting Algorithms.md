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

## Related
- [[Recursion]] — many sorting algorithms use recursive logic
- [[Merge Sort]] — merge sort is a direct application of sorting algorithm concepts
- [[Arrays]] — sorting operates on arrays
- [[Java Course]] — course overview