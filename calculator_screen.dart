import 'package:flutter/material.dart';
import 'dart:math'; // Import the math library

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double loanAmount = 0.0;
  int loanTerm = 0;
  double interestRate = 0.0;

  double calculateMonthlyPayment() {
    double monthlyInterestRate = interestRate / 1200;
    num denominator = 1 - pow(1 + monthlyInterestRate, -loanTerm);
    double monthlyPayment = (loanAmount * monthlyInterestRate) / denominator;
    return monthlyPayment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  loanAmount = double.parse(value);
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Loan Amount (\$)'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  loanTerm = int.parse(value);
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Loan Term (months)'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  interestRate = double.parse(value);
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Interest Rate (%)'),
            ),
            ElevatedButton(
              onPressed: () {
                double monthlyPayment = calculateMonthlyPayment();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Monthly Payment'),
                      content: Text(
                          'Monthly Payment: \$${monthlyPayment.toStringAsFixed(2)}'),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
