---

---
```java
import java.util.Arrays;

public class MergeSort {
    public static void main (String[] args) {
        // create two sorted arrays
        int[] arr1 = {2, 10, 15, 17, 21};
        int[] arr2 = {6, 8, 19};
        int[] newArray = new int[arr1.length + arr2.length];
        int i = 0;
        int j = 0;


        // in O(n) time, combine these into new array

        while(i < arr1.length && j < arr2.length) {
            if (arr1[i] < arr2[j]) {
                newArray[i + j] = arr1[i++];
            }
            else {
                newArray[i + j] = arr2[j++];
            }

        }

        /* This could also be written using a ternary operator (compact if/else statement):

           while (i < arr1.length && j < arr2.length) {
                newArray[i + j] = (arr1[i] < arr2[j]) ? arr1[i++] : arr2[j++];

                // ? acts as if/else statement. the comparison is in the 'if.' else, arr2[j++].

         */

        while (i < arr1.length) {
            newArray[i + j] = arr1[i];
            i++;
        }
        while (j < arr2.length) {
            newArray[i + j] = arr2[j];
            j++;
        }
        // Need to "drain" the remaining array



        System.out.println(Arrays.toString(newArray));

    }

}


/*
 * 1. Point to arr1[0] and arr2[0], then compare
 * 2. assign arr1[0] to newArray [0]
 * 3. compare arr1[1] to arr2[0]
 * 4. assign arr2[0] to newArray[1]
 *
 *
 * */

// newArray pointer could be i + j

/*
Journal Entry:

Today I practiced merging two sorted arrays into a single sorted array using the two-pointer technique.
This is a fundamental algorithm concept commonly used in merge sort and other sorting-related problems.

Key concepts practiced:

1. Two-Pointer Technique: I used two pointers (i and j) to traverse arr1 and arr2 simultaneously,
   comparing elements at each position to determine which should be placed next in the merged array.

2. Time Complexity O(n): The algorithm runs in linear time because each element from both arrays
   is visited exactly once. The total operations are proportional to the sum of both array lengths (n + m).

3. Array Merging Logic: By comparing arr1[i] with arr2[j], I always select the smaller element,
   ensuring the result remains sorted. The index (i + j) represents the correct position in newArray.

4. Draining Remaining Elements: After one array is exhausted, I need to copy all remaining elements
   from the other array. This is handled by the two final while loops that drain whichever array
   still has elements left.

5. Ternary Operator Alternative: I learned that the comparison logic can be written more concisely
   using a ternary operator: (arr1[i] < arr2[j]) ? arr1[i++] : arr2[j++], which is a compact
   if/else statement.

This technique is essential for understanding merge sort and solving many array manipulation problems
efficiently.

 */
```