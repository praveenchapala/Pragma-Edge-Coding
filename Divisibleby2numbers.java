import java.util.*;
public class Main{
    public static void main(String args[]){
        Scanner scanner= new Scanner(System.in);
        int number=scanner.nextInt();
        if(number%3==0 and number%5==0){
            System.out.println("Divisible by both 3 and 5");
        }else{
            System.out.println("Not divisible by both 3 and 5");
        }
    }
}
