import java.util.*;
public class Main{
    public static void main(String args[]){
        Scanner scanner = new Scanner(System.in);
        String a=scanner.nextLine();
        String b=scanner.nextLine();
        char x[]=a.toCharArray();
        char y[]=b.toCharArray();
        Arrays.sort(x);
        Arrays.sort(y);
        if(Arrays.equals(x,y)){
            System.out.println("Anagrams");
        }else{
            System.out.println("Not Anagrams");
        }
    }
}
