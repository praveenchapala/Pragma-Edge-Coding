import java.util.*;
public class Main{
    public static void main(String args[]){
        Scanner scanner= new Scanner(System.in);
        int number=scanner.nextInt();
        
        if (number < 0) {
            System.out.println("Not a Armstrong number");
            return;
        }
        int original=number;
        int temp=number;
        int countofdigits=0;
        while(temp>0){
            countofdigits++;
            temp/=10;
        }
        temp=number;
        int sum=0;
        while(temp>0){
            int digit=temp%10;
            sum+=Math.pow(digit,countofdigits);
            temp/=10;
        }
        System.out.println(original==sum?"Armstrong Number":"Not an Armstrong number");
    }
}
