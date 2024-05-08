import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/debt_table.dart';

class DebtFin extends StatefulWidget {
  @override
  State<DebtFin> createState() => _DebtFinState();
}

class _DebtFinState extends State<DebtFin> {
  int LoanAmount = 50000000;
  double IntRates = (4.3 % 1).toDouble();
  int Energy = 166440000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Debt Repayment Schedule",
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FixedColumnWidth(150), // Allow column 1 to flex
                  1: FixedColumnWidth(150),
                },
                children: [
                  TableRow(children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(
                        child: Text('Loan Amount',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        initialValue: LoanAmount.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300, fontSize: 14),
                        decoration: InputDecoration(border: InputBorder.none),
                        onChanged: (newValue) {
                          setState(() {
                            LoanAmount = int.parse(newValue);
                          });
                        },
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(
                        child: Text('Interest Rates',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        initialValue: IntRates.toStringAsFixed(2),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300, fontSize: 14),
                        decoration: InputDecoration(border: InputBorder.none),
                        onChanged: (newValue) {
                          setState(() {
                            IntRates = double.parse(newValue);
                          });
                        },
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(
                        child: Text('Energy',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        initialValue: Energy.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300, fontSize: 14),
                        decoration: InputDecoration(border: InputBorder.none),
                        onChanged: (newValue) {
                          setState(() {
                            Energy = int.parse(newValue);
                          });
                        },
                      ),
                    ),
                  ])
                ],
              ),
              SizedBox(
                height: 5,
              ),

              //2nd table
              Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FixedColumnWidth(80), // Allow column 1 to flex
                  1: FixedColumnWidth(80),
                  2: FixedColumnWidth(100),
                  3: FixedColumnWidth(80),
                  4: FixedColumnWidth(80),
                  5: FixedColumnWidth(100),
                  6: FixedColumnWidth(100),
                  7: FixedColumnWidth(100),
                },
                children: [
                  TableRow(children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(
                        child: Text(' Relevent \n Quarters',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(
                        child: Text('    Base \namount \n   (USD)',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(
                        child: Text('    Principle \n Repayment \n       (USD)',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(
                        child: Text('Interest\n  (USD)',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(
                        child: Text('  Balance\n Principal\n   (USD)',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(
                        child: Text(
                            '   Total Debt\n      Service\n(Million USD)',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(
                        child: Text(
                            '     Annual\n   Principle\n Repayment\n    Rs./kwh',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(
                        child: Text('Annual\nInterest\n Rs./kwh',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ]),

                  //2nd row onwards
                ],
              ),

              Tabledebt(
                  srnum1: "1",
                  base_amount1: 50000000,
                  princ_rep_sched1: 725223,
                  intrst_usd1: 531240,
                  bal_prin1: 49274778,
                  ann_prin_rep1: 2.1251,
                  ann_intrst1: 1.4985,

                  //2nd row
                  srnum2: "2",
                  base_amount2: 49274778,
                  princ_rep_sched2: 732927,
                  intrst_usd2: 523545,
                  bal_prin2: 4854185,
                  ann_prin_rep2: 2.1251,
                  ann_intrst2: 1.4985,
                  //3rd row
                  srnum3: "3",
                  base_amount3: 48541851,
                  princ_rep_sched3: 740714,
                  intrst_usd3: 515757,
                  bal_prin3: 47801137,
                  ann_prin_rep3: 2.1251,
                  ann_intrst3: 1.4985,
                  //4th row
                  srnum4: "4",
                  base_amount4: 47801137,
                  princ_rep_sched4: 748585,
                  intrst_usd4: 507887,
                  bal_prin4: 47052552,
                  ann_prin_rep4: 2.1251,
                  ann_intrst4: 1.4985),

              //2nt quarter

              Tabledebt(
                  srnum1: "5",
                  base_amount1: 47052552,
                  princ_rep_sched1: 756538,
                  intrst_usd1: 499933,
                  bal_prin1: 46296014,
                  ann_prin_rep1: 2.2168,
                  ann_intrst1: 1.4067,

                  //2nd row
                  srnum2: "6",
                  base_amount2: 46296014,
                  princ_rep_sched2: 764576,
                  intrst_usd2: 491895,
                  bal_prin2: 45531437,
                  ann_prin_rep2: 2.2168,
                  ann_intrst2: 1.4067,

                  //3rd row
                  srnum3: "7",
                  base_amount3: 45531437,
                  princ_rep_sched3: 772700,
                  intrst_usd3: 483772,
                  bal_prin3: 44758737,
                  ann_prin_rep3: 2.2168,
                  ann_intrst3: 1.4067,

                  //4th row
                  srnum4: "8",
                  base_amount4: 44758737,
                  princ_rep_sched4: 780910,
                  intrst_usd4: 475562,
                  bal_prin4: 47052552,
                  ann_prin_rep4: 2.2168,
                  ann_intrst4: 1.4067),

              // //3rd quarter
              Tabledebt(
                  srnum1: "9",
                  base_amount1: 43977827,
                  princ_rep_sched1: 789207,
                  intrst_usd1: 467264,
                  bal_prin1: 43188620,
                  ann_prin_rep1: 2.3125,
                  ann_intrst1: 1.3110,

                  //2nd Row
                  srnum2: "10",
                  base_amount2: 43188620,
                  princ_rep_sched2: 797593,
                  intrst_usd2: 458879,
                  bal_prin2: 42391028,
                  ann_prin_rep2: 2.3125,
                  ann_intrst2: 1.3110,

                  //3rd Row
                  srnum3: "11",
                  base_amount3: 42391028,
                  princ_rep_sched3: 806067,
                  intrst_usd3: 450405,
                  bal_prin3: 41584961,
                  ann_prin_rep3: 2.3125,
                  ann_intrst3: 1.3110,

                  //4th Row
                  srnum4: "12",
                  base_amount4: 41584961,
                  princ_rep_sched4: 814631,
                  intrst_usd4: 441840,
                  bal_prin4: 40770329,
                  ann_prin_rep4: 2.3125,
                  ann_intrst4: 1.3110),

              // Tabledebt(
              //     srnum: "10",
              //     base_amount: 43188620,
              //     princ_rep_sched: 797593,
              //     intrst_usd: 458879,
              //     bal_prin: 42391028,
              //     ann_prin_rep: 2.3125,
              //     ann_intrst: 1.3110),
              // Tabledebt(
              //   srnum: "11",
              //   base_amount: 42391028,
              //   princ_rep_sched: 806067,
              //   intrst_usd: 450405,
              //   bal_prin: 41584961,
              //   ann_prin_rep: 2.3125,
              //   ann_intrst: 1.3110,
              // ),
              // Tabledebt(
              //     srnum: "12",
              //     base_amount: 41584961,
              //     princ_rep_sched: 814631,
              //     intrst_usd: 441840,
              //     bal_prin: 40770329,
              //     ann_prin_rep: 2.3125,
              //     ann_intrst: 1.3110),
            ],
          ),
        ),
      ),
    );
  }
}
