import java.util.Scanner;

public class MainCalculator {
    public void calculateLoan() {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Loan Amount ($):");
        double loanAmount = scanner.nextDouble();

        System.out.println("Loan Term (months):");
        int loanTerm = scanner.nextInt();

        System.out.println("Interest Rate (%):");
        double interestRate = scanner.nextDouble();

        double monthlyInterestRate = interestRate / 1200;
        double monthlyPayment = (loanAmount * monthlyInterestRate) / (1 - Math.pow(1 + monthlyInterestRate, -loanTerm));

        System.out.printf("Monthly Payment: $%.2f%n", monthlyPayment);
    }
}
