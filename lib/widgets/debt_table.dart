import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabledebt extends StatefulWidget {
  String srnum1;
  int base_amount1;
  int princ_rep_sched1;
  int intrst_usd1;
  int bal_prin1;
  double ann_prin_rep1;
  double ann_intrst1;
  //2nd row
  String srnum2;
  int base_amount2;
  int princ_rep_sched2;
  int intrst_usd2;
  int bal_prin2;
  double ann_prin_rep2;
  double ann_intrst2;
  //3rd row
  String srnum3;
  int base_amount3;
  int princ_rep_sched3;
  int intrst_usd3;
  int bal_prin3;
  double ann_prin_rep3;
  double ann_intrst3;
  //4th row
  String srnum4;
  int base_amount4;
  int princ_rep_sched4;
  int intrst_usd4;
  int bal_prin4;
  double ann_prin_rep4;
  double ann_intrst4;

  Tabledebt({
    required this.srnum1,
    required this.base_amount1,
    required this.princ_rep_sched1,
    required this.intrst_usd1,
    required this.bal_prin1,
    required this.ann_prin_rep1,
    required this.ann_intrst1,
    //2nd row
    required this.srnum2,
    required this.base_amount2,
    required this.princ_rep_sched2,
    required this.intrst_usd2,
    required this.bal_prin2,
    required this.ann_prin_rep2,
    required this.ann_intrst2,
    //3rd row
    required this.srnum3,
    required this.base_amount3,
    required this.princ_rep_sched3,
    required this.intrst_usd3,
    required this.bal_prin3,
    required this.ann_prin_rep3,
    required this.ann_intrst3,
    //4 row
    required this.srnum4,
    required this.base_amount4,
    required this.princ_rep_sched4,
    required this.intrst_usd4,
    required this.bal_prin4,
    required this.ann_prin_rep4,
    required this.ann_intrst4,
  });

  @override
  State<Tabledebt> createState() => _TabledebtState();
}

class _TabledebtState extends State<Tabledebt> {
  @override
  Widget build(BuildContext context) {
    return Table(
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
              child: Text(
                widget.srnum1,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: TextFormField(
              textAlign: TextAlign.center,
              initialValue: widget.base_amount1.toString(),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300, fontSize: 14),
              decoration: InputDecoration(border: InputBorder.none),
              onChanged: (newValue) {
                setState(() {
                  print("changing");
                  int temp = int.parse(newValue);
                  widget.intrst_usd1 = (temp * 4.25 / 100 / 4).toInt();
                  widget.princ_rep_sched1 = 1256472 - widget.intrst_usd1;
                  widget.bal_prin1 = temp - widget.princ_rep_sched1;
                  // int sum1 = widget.princ_rep_sched1 +
                  //     widget.princ_rep_sched2 +
                  //     widget.princ_rep_sched3 +
                  //     widget.princ_rep_sched4;
                  // widget.ann_prin_rep1 = sum1 * 120 / 166440000;

                  // int sum2 = widget.intrst_usd1 +
                  //     widget.intrst_usd2 +
                  //     widget.intrst_usd3 +
                  //     widget.intrst_usd4;
                  // widget.ann_intrst1 = sum2 * 120 / 166440000;

                  int temp2 = widget.bal_prin1;
                  widget.base_amount2 = temp2;

                  widget.intrst_usd2 =
                      (widget.base_amount2 * 4.25 / 100 / 4).toInt();
                  widget.princ_rep_sched2 = 1256472 - widget.intrst_usd2;
                  widget.bal_prin2 =
                      widget.base_amount2 - widget.princ_rep_sched2;

                  int temp3 = widget.bal_prin2;
                  widget.base_amount3 = temp3;
                  widget.intrst_usd3 =
                      (widget.base_amount3 * 4.25 / 100 / 4).toInt();
                  widget.princ_rep_sched3 = 1256472 - widget.intrst_usd3;
                  widget.bal_prin3 =
                      widget.base_amount3 - widget.princ_rep_sched3;

                  int temp4 = widget.bal_prin3;
                  widget.base_amount4 = temp4;
                  widget.intrst_usd4 =
                      (widget.base_amount4 * 4.25 / 100 / 4).toInt();
                  widget.princ_rep_sched4 = 1256472 - widget.intrst_usd4;
                  widget.bal_prin4 =
                      widget.base_amount4 - widget.princ_rep_sched4;

                  int sum3 = widget.princ_rep_sched1 +
                      widget.princ_rep_sched2 +
                      widget.princ_rep_sched3 +
                      widget.princ_rep_sched4;
                  widget.ann_prin_rep1 = sum3 * 120 / 166440000;

                  int sum4 = widget.intrst_usd1 +
                      widget.intrst_usd2 +
                      widget.intrst_usd3 +
                      widget.intrst_usd4;
                  widget.ann_intrst1 = sum4 * 120 / 166440000;
                });
              },
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.princ_rep_sched1.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.intrst_usd1.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.bal_prin1.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text('1256472', style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.ann_prin_rep1.toStringAsFixed(4),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.ann_intrst1.toStringAsFixed(4),
                  style: GoogleFonts.poppins()),
            ),
          ),
        ]),

        //2nd row
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(
                widget.srnum2,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Center(
                child: Text(widget.base_amount2.toString(),
                    style: GoogleFonts.poppins()),
              )

              // verticalAlignment: TableCellVerticalAlignment.middle,
              // child: TextFormField(
              //   textAlign: TextAlign.center,
              //   initialValue: widget.base_amount2.toString(),
              //   style: GoogleFonts.poppins(
              //       fontWeight: FontWeight.w300, fontSize: 14),
              //   decoration: InputDecoration(border: InputBorder.none),
              //   onChanged: (newValue) {
              //     setState(() {
              //       print("changing");
              //       int temp = int.parse(newValue);
              //       widget.intrst_usd2 = (temp * 4.25 / 100 / 4).toInt();
              //       widget.princ_rep_sched2 = 1256472 - widget.intrst_usd2;
              //       widget.bal_prin2 = temp - widget.princ_rep_sched2;
              //       int sum1 = widget.princ_rep_sched1 +
              //           widget.princ_rep_sched2 +
              //           widget.princ_rep_sched3 +
              //           widget.princ_rep_sched4;
              //       widget.ann_prin_rep1 = sum1 * 120 / 166440000;

              //       int sum2 = widget.intrst_usd1 +
              //           widget.intrst_usd2 +
              //           widget.intrst_usd3 +
              //           widget.intrst_usd4;
              //       widget.ann_intrst1 = sum2 * 120 / 166440000;
              //     });
              //   },
              // ),
              ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.princ_rep_sched2.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.intrst_usd2.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.bal_prin2.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text('1256472', style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.ann_prin_rep1.toStringAsFixed(4),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.ann_intrst1.toStringAsFixed(4),
                  style: GoogleFonts.poppins()),
            ),
          ),
        ]),

        //3rd row
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(
                widget.srnum3,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.base_amount3.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.princ_rep_sched3.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.intrst_usd3.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.bal_prin3.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text('1256472', style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.ann_prin_rep1.toStringAsFixed(4),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.ann_intrst1.toStringAsFixed(4),
                  style: GoogleFonts.poppins()),
            ),
          ),
        ]),

        //4th row
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(
                widget.srnum4,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.base_amount4.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.princ_rep_sched4.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.intrst_usd4.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.bal_prin4.toString(),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text('1256472', style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.ann_prin_rep1.toStringAsFixed(4),
                  style: GoogleFonts.poppins()),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(widget.ann_intrst1.toStringAsFixed(4),
                  style: GoogleFonts.poppins()),
            ),
          ),
        ]),
      ],
    );
  }
}
