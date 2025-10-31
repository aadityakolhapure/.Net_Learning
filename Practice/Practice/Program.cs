class Program
{
     static int Modify(ref int number)
    {
       
       return number = number + 10;
    }

    static void Calculate(out int sum, out int product)
    {
        int a = 5, b = 10;
        sum = a + b;
        product = a * b;
    }


    static void Main(string[] args)
    {
         int value =5;
        Modify(ref value);
        Console.WriteLine(value);
        int result1, result2;
        Calculate(out result1, out result2);
        Console.WriteLine($"Sum = {result1}, Product = {result2}");
    }
}