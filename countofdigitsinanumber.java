import java.util.*;
public class Main{
    public static void main(String args[]){
        Scanner scanner = new Scanner(System.in);
        int number = scanner.nextInt();
        int count=0;
        if(number==0){
            count=1;
        }else{
        
        while(number>0){
            int digit=number%10;
            count++;
            number/=10;
        }
        }
        
        System.out.println(count);
    }
}
