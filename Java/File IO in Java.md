
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

Read Files
(extending the above code to read the file created):

```Java
// IMPORT FILE CLASS FOR REPRESENTING FILE PATHS ON DISK
import java.io.File;
// IMPORT EXCEPTION CLASS THROWN WHEN A FILE CANNOT BE FOUND
import java.io.FileNotFoundException;
// IMPORT FILEWRITER CLASS FOR WRITING TEXT TO A FILE
import java.io.FileWriter;
// IMPORT EXCEPTION CLASS THROWN WHEN A GENERAL I/O OPERATION FAILS
import java.io.IOException;
// IMPORT SCANNER CLASS FOR READING TEXT INPUT (FILES, CONSOLE, ETC.)
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        // ATTEMPT FILE WRITE — CATCHES IOException IF SOMETHING GOES WRONG
        try {
            // CREATE A FILEWRITER POINTED AT THE TARGET FILE (OVERWRITES IF IT EXISTS)
            FileWriter myWriter = new FileWriter("INSTRUCTION/Files_16MAR26/src/filename.txt");
            // WRITE FIRST LINE OF TEXT TO THE FILE — \n MOVES TO NEXT LINE
            myWriter.write("Files in Java might be tricky, but it is fun enough!\n");
            // WRITE SECOND LINE OF TEXT TO THE FILE
            myWriter.write("another line");
            // FLUSH AND CLOSE THE FILE — REQUIRED TO SAVE CONTENTS TO DISK
            myWriter.close();
            // CONFIRM SUCCESSFUL WRITE TO THE TERMINAL
            System.out.println("Successfully wrote to the file.");
        // CATCH ANY I/O ERRORS THAT OCCURRED DURING THE WRITE OPERATION
        } catch (IOException e) {
            // PRINT GENERIC ERROR MESSAGE TO THE TERMINAL
            System.out.println("An error occurred.");
            // PRINT FULL STACK TRACE TO HELP DIAGNOSE THE PROBLEM
            e.printStackTrace();
        }

        // CREATE A FILE OBJECT REPRESENTING THE PATH TO THE FILE WE JUST WROTE
        File myObj = new File("INSTRUCTION/Files_16MAR26/src/filename.txt");

        // Print output in terminal
        // OPEN A SCANNER ON THE FILE — AUTO-CLOSES WHEN THE TRY BLOCK EXITS
        try (Scanner myReader = new Scanner(myObj)) {
            // LOOP AS LONG AS THERE ARE MORE LINES LEFT TO READ
            while (myReader.hasNextLine()) {
                // READ THE NEXT LINE FROM THE FILE INTO A STRING
                String data = myReader.nextLine();
                // PRINT THAT LINE TO THE TERMINAL
                System.out.println(data);
            }
        // CATCH THE CASE WHERE THE FILE DOES NOT EXIST AT THE GIVEN PATH
        } catch (FileNotFoundException e) {
            // PRINT GENERIC ERROR MESSAGE TO THE TERMINAL
            System.out.println("An error occurred.");
            // PRINT FULL STACK TRACE TO HELP DIAGNOSE THE PROBLEM
            e.printStackTrace();
        }
    }
}
```


## Applied: xyz Company R/W Functionality:

Menu - Case Additions:
```Java
case 6:  
    xyz.exportEmployeeList();  
    break;  
case 7:  
    xyz.importEmployeeList();  
    break;
```

Company Class - Method Additions:
```Java
void exportEmployeeList() {  
    try {  
        FileWriter myWriter = new FileWriter("employees.txt");  
        for (Employee employee : employees) {  
            myWriter.write(employee.toFileString() + "\n");  
        };  
        myWriter.close();  
        System.out.println("Successfully wrote to file.");  
    } catch (IOException e) {  
        System.out.println("An error occurred.");  
        e.printStackTrace();  
    }  
}  
  
void importEmployeeList(){  
    File myObj = new File("employees.txt");  
  
    try (Scanner myReader = new Scanner(myObj)) {  
        while (myReader.hasNextLine()) {  
            String data = myReader.nextLine();  
            String[] parts = data.split(",");  
            String type = parts[0];  
  
            switch (type) {  
                case "SalariedFull":  
                    employees.add(  
                            new SalariedFull(  
                                    Integer.parseInt(parts[1]),  
                                    parts[2],  
                                    parts[3],  
                                    Double.parseDouble(parts[4]),  
                                    Double.parseDouble(parts[5])  
                            ));  
                    break;  
                case "HourlyFull":  
                    employees.add(  
                            new HourlyFull(  
                                    Integer.parseInt(parts[1]),  
                                    parts[2],  
                                    parts[3],  
                                    Double.parseDouble(parts[4]),  
                                    Double.parseDouble(parts[5]),  
                                    Double.parseDouble(parts[6])  
                            ));  
                    break;  
                case "PartTime":  
                    employees.add(  
                            new PartTime(  
                                    Integer.parseInt(parts[1]),  
                                    parts[2],  
                                    parts[3],  
                                    Double.parseDouble(parts[4]),  
                                    Double.parseDouble(parts[5])  
  
                            ));  
                    break;  
                default:  
                    System.out.println("Not a known employee type"); break;  
            }  
        }  
    } catch (FileNotFoundException e) {  
        // PRINT GENERIC ERROR MESSAGE TO THE TERMINAL  
        System.out.println("An error occurred.");  
        // PRINT FULL STACK TRACE TO HELP DIAGNOSE THE PROBLEM  
        e.printStackTrace();  
    }  
  
}
```

Employee Class - Method Additions:
```Java
class Employee {  
    int id;  
    String name;  
    String address;
    
    public String toFileString() {  
    return id + "," + name + "," + address;  
}

class PartTime extends Employee {  
    double hours;  
    double rate;
    
    public String toFileString() {  
    return "PartTime," + super.toFileString() + "," + hours + "," + rate;  
}

class FullTime extends Employee {  
    double benefit;
    
    public String toFileString() {  
    return super.toFileString() + "," + benefit;  
}

class SalariedFull extends FullTime {  
    double salary;
    
    public String toFileString() {  
    return "SalariedFull," + super.toFileString() + "," + salary;  
}

class HourlyFull extends FullTime {  
    double hours;  
    double rate;
    
    public String toFileString() {  
    return "HourlyFull," + super.toFileString() + "," + hours + "," + rate;  
}
```

## Related
- [[_INDEX - Java Course]] — course overview
- [[Shell-Terminal-Command Line]] — file manipulation from terminal complements Java file I/O
- [[Inheritance]] — the applied section uses a full Employee inheritance hierarchy
- [[Polymorphism]] — toFileString() is polymorphically overridden across the Employee class hierarchy