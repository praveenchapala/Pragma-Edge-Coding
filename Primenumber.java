import java.util.*;
public class Main{
    public static void main(String args[]){
        Scanner scanner=new Scanner(System.in);
        int number=scanner.nextInt();
        boolean prime=number>1;
        for(int i=2;i<Math.sqrt(number);i++){ //number/i can also be used for safe way of checking square root boundary of a number
            if(number%i==0){
                prime=false;
                break;
            }
        }
        System.out.println(prime?"Prime":"Not Prime");
        
       
    }
}
