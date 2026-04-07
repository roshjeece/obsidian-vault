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
  
    static char getExpectedOpener(char closer) {  
        if (closer == ')') return '(';  
        if (closer == '}') return '{';  
        return '[';  
    }  
  
    static boolean validate(String entry) {  
        // Legacy Implementation: Stack<Character> valStack = new Stack<>();  
        Deque<Character> valQueue = new ArrayDeque<>();  
  
        for (int i = 0; i < entry.length(); i++) {  
            char c = entry.charAt(i);  
            if (c == '(' || c == '{' || c == '[') {  
                valQueue.push(c);  
            } else if (c == ')' || c == '}' || c == ']') {  
                if (valQueue.isEmpty()) {  
                    return false;  
                }  
                char checked = valQueue.pop();  
                if (checked != getExpectedOpener(c)) {  
                    return false;  
                }  
            }  
  
        }  
        return valQueue.isEmpty();  
    }  
}
```