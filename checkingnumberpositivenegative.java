import java.util.*;
public class Main{
    public static void main(String args[]){
       Scanner scanner = new Scanner(System.in);
        try{
        int number=scanner.nextInt();
        if(number>0){
            System.out.println("The number is Positive");
        }else if(number<0){
            System.out.println("The number is Negative");
        }else{
            System.out.println("The number is Zero");
        }
        }
            catch(InputMismatchException e){
            System.out.println("The exception is handled so please enter  the numbers not characters");
            }
        finally{
            System.out.println("Program ended");
        }
    }
}
