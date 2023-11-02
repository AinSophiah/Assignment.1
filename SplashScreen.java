public class SplashScreen {
    public void display() {
        // Create the splash screen layout
        System.out.println("Welcome to Loan Calculator");
        System.out.println("Press Enter to continue...");

        // Wait for the user to press Enter
        try {
            System.in.read();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
