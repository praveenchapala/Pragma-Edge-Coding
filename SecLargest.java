public class Main {
    public static void main(String[] args) {
        int[] arr = {10, 40, 20, 50, 50};

        int first = Integer.MIN_VALUE;
        int second = Integer.MIN_VALUE;

        for (int num : arr) {
            if (num > first) {
                second = first;
                first = num;
            } else if (num > second && num < first) {
                second = num;
            }
        }

        if (second == Integer.MIN_VALUE) {
            System.out.println("No second-largest distinct element");
        } else {
            System.out.println(second);
        }
    }
}
