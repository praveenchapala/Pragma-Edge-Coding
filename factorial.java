import java.util.*;
public class Main{
    public static void main(String args[]){
        Scanner scanner=new Scanner(System.in);
        int number=scanner.nextInt();
        if(number<0){
            System.out.println("Invalid input");
            return;
        }
        int fact=1;
        for(int i=1;i<=number;i++){
            fact*=i;
        }
        System.out.println(fact);
    }
}
