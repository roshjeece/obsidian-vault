
## Write
```Java
import java.io.FileWriter;  
import java.io.IOException;  
  
public class Main {  
    public static void main(String[] args) {  
  
        try {  
            FileWriter myWriter = new FileWriter("INSTRUCTION/Files_16MAR26/src/filename.txt");  
            myWriter.write("Files in Java might be tricky, but it is fun enough!");  
            myWriter.write("another line");  
            myWriter.close();  // must close manually  
            System.out.println("Successfully wrote to the file.");  
        } catch (IOException e) {  
            System.out.println("An error occurred.");  
            e.printStackTrace();  
  
        }  
    }  
}
```
Note: You may need to specify where you want that file to go. The file will be created by default relative to my program's working directory, not necessarily Main.java.

## Related
- [[Java Course]] — course overview
- [[Shell-Terminal-Command Line]] — file manipulation from terminal complements Java file I/O