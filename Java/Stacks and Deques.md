FIFO Concep
- First In, First Out

Stacks and Deques are similiar
- Stacks are legacy
- Deques are better

###### Implementation of a Stack/ArrayDeque that works with either
- Classic Stack Problem
- Building a balanced brackets validator

```Java
import java.util.ArrayDeque;  
import java.util.Deque;  
import java.util.Stack;  
  
public class Main {  
    public static void main(String[] args) {  
  
        String valid = "{[(abc)]}";  
        String invalid1 = "{[(])}";  
        String invalid2 = "{[()";  
        String invalid3 = ")(";  
  
        System.out.println(validate(valid) ? "Balanced." : "Not balanced.");  
  
    }  
  
    // Handle all openers in one method  
    static char getExpectedOpener(char closer) {  
        if (closer == ')') return '(';  
        if (closer == '}') return '{';  
        return '[';  
    }  
  
    // separate logic from output, main will handle printing  
    static boolean validate(String entry) {  
        // Legacy Implementation: Stack<Character> valStack = new Stack<>();  
        Deque<Character> valQueue = new ArrayDeque<>();  
  
        // iterating through each character in the string  
        for (int i = 0; i < entry.length(); i++) {  
            char c = entry.charAt(i);  
            // pushing all the different openers to the queue  
            if (c == '(' || c == '{' || c == '[') {  
                valQueue.push(c);  
            } else if (c == ')' || c == '}' || c == ']') {  
                // if there is nothing left in the queue to match, it's unbalanced  
                if (valQueue.isEmpty()) {  
                    return false;  
                }  
                char checked = valQueue.pop();  
                if (checked != getExpectedOpener(c)) {  
                    // if it's the opener and closer don't match, it's unbalanced  
                    return false;  
                }  
            }  
  
        }  
        // if all matched and the queue is now empty, it's balanced  
        return valQueue.isEmpty();  
    }  
}
```

