import java.util.*;
public class Main{
    public static void main(String args[]){
        Scanner scanner=new Scanner(System.in);
        int range=scanner.nextInt();
        int a =0,b=1;
        
        for(int i=0;i<range;i++){
            System.out.println(a+" ");
            int next=a+b;
            a=b;
            b=next;
        }
        
       
    }
}
