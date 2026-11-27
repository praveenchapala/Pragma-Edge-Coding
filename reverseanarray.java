import java.util.Arrays;
public class Main{
    public static int[] reversearray(int arr[]){
        int n=arr.length;
        int newarr[]=new int[n];
        for(int i=0;i<n;i++){
            newarr[n-1-i]=arr[i];
        }
        return newarr;
    }
    public static void main(String args[]){
        int original[]={10,20,30,40,50};
        int result[]=reversearray(original);
        System.out.println(Arrays.toString(result));
    }
}
