using System;
using System;

public class Program
{
    public static void Main()
    {
        var format = Console.ReadLine(); // $ Source

        // BAD: Uncontrolled format string.
        var x = string.Format(format, 1, 2); // $ Alert
    }
}
