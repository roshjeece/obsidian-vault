---

---
**Declaring and Using Constants and Variables**

- Variable
- Data type

- Primitive type
    - A simple data type
    - Reference primitive data type graph
- Reference types
    - More complex data types
    - Graph
- 

Integer Data Types

- Byte: size 1 byte
- Short: size 2 bytes
- Int: size 4 bytes
- Long: size 8 bytes

```java
int x, y = 10;
int x = 1 ;
short y = 2 ;
double c = 3.2 ;
boolean a = true ;
char b = 'a' ;

final double PI = 3.1415 ; // if it should not be changed, all CAPS
pi = pi + 1; // will not run because of the 'final'
```

```java
{
				{
					int x = 1;
					System.out.println(x);
					// x will print because x is known
				}
		System.out.println(x);
		// x will NOT print because x is only known within its original brackets
}

```