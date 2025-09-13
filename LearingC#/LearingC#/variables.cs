using System;

namespace cari
{
    class VariablesKnow
    {
        private static int a;

        public static int setval(int val)
        {
            a = val;
            return a;
        }

        public static int getval()
        {
            return a;
        }
        static void Main()
        {
            VariablesKnow val1 = new VariablesKnow();
            setval(1);
            Console.WriteLine(getval());
        }
    }
}
