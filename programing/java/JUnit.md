# JUnitとは
Javaで単体テストをするやつ

## JUnitをライブラリに追加する
Project>Properties>Java Build Path>Libraries>Add Library
JUnitを選ぶ

```java:Sample.java
public class Sample{
	public static int num() {
		return 10;
	}
}
```

```java
import static org.junit.Assert.*;
import org.junit.Test;

public class SampleTest {

   @Test
   public void testNum() {
      assertEquals(10, Sample.num());
      assertEquals("10じゃない!!",10, Sample.num());
   }
}
```
