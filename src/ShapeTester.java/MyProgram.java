import java.util.Scanner;

public class MyProgram {
    
    
    public static void main(String[] args) 
    {
        Scanner scanner = new Scanner(System.in);
        boolean continueLoop = true;

        while (continueLoop) {
            System.out.println("Welcome to Shape Maker! Let's find the volume and surface area for a few shapes...");
            System.out.println("Press 1 for Box, 2 for Sphere, 3 for Pyramid, press 4 for Torus, or 0 to Exit:");
            int choice = scanner.nextInt();

        // BoOOx
        if (choice == 1) {
        System.out.println("Enter width:");
        int w = scanner.nextInt();
        System.out.println("Enter height:");
        int h = scanner.nextInt();
        System.out.println("Enter length:");
             int l = scanner.nextInt();

        // Calculaste Box
             Box b1 = new Box(l, w, h);
             System.out.println("Box Volume: " + b1.calcVol());
             System.out.println("Box Surface Area: " + b1.calcSurfArea());

            } 
            // Sphere ya
            else if (choice == 2) {
                System.out.println("Enter radius:");
                int r = scanner.nextInt();

                // Calc. Sphere
                Sphere s1 = new Sphere(r);
                System.out.println("Sphere Volume: " + s1.calcVol());
                System.out.println("Sphere Surface Area: " + s1.calcSurfArea());

            } 
            // Pyramid
            else if (choice == 3) {
                System.out.println("Enter base length:");
                int l = scanner.nextInt();
                System.out.println("Enter base width:");
                int w = scanner.nextInt();
                System.out.println("Enter height:");
                int h = scanner.nextInt();

                // Calculate Pyramid
                Pyramid p1 = new Pyramid(l, w, h);
                System.out.println("Pyramid Volume: " + p1.calcVol());
                System.out.println("Pyramid Surface Area: " + p1.calcSurfArea());
                
                
            } else if (choice == 4) {
                double R, r;
                while (true) {
                    System.out.println("Enter major radius (R):");
                    R = scanner.nextDouble();
                    System.out.println("Enter minor radius (r):");
                    r = scanner.nextDouble();

                    // Check if R > r
                    if (R > r) {
                        Torus t1 = new Torus(R, r);
                        System.out.println("Torus Volume: " + t1.calcVol());
                        System.out.println("Torus Surface Area: " + t1.calcSurfArea());
                        break; // Exit loop if valid input
                    } else {
                        System.out.println("Invalid input!!! UH OH!: make sureR > r. Please try again!!!!!!.");
                    }
                }
            } 
            // Exit
            else if (choice == 0) {
                System.out.println("Exiting program. Goodbye! >:D");
                continueLoop = false;
            } 
            // Invalid Input
            else {
                System.out.println("Invalid choice. Please select a valid option.");
            }

            // Ask if user wants to create another shape
            if (continueLoop) {
                System.out.println("Would you like to create another shape? (yes/no)");
                String response = scanner.next().toLowerCase();
                if (!response.equals("yes")) {
                    System.out.println("Exiting program. Goodbye!");
                    continueLoop = false;
                }
            }
        }
        scanner.close();
    }
}