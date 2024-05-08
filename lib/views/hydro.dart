import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepraproj/auth/auth_service.dart';
import 'package:nepraproj/views/debt.dart';
import 'package:nepraproj/views/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hydro extends StatefulWidget {
  const Hydro({super.key});

  @override
  State<Hydro> createState() => _HydroState();
}

class _HydroState extends State<Hydro> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  late SharedPreferences _prefs;
  double FixOMLocIn = 0.2155; // Default value for float
  double FixOMForIn = 0.2188;
  double ROEIn = 1.0699;
  double ROEDCIn = 0.8922;

  double VarOMForIn = 0.1044;
  double WatUseChIn = 0.2155;

  double USCpiRef = 208.49;
  double CpiLocRef = 154.72;
  double RsUsOmRef = 60;
  double RsUsEqRef = 81.50;

  double USCpiWef = 297.711;
  double CpiLocWef = 269.27;
  double RsUsOmWef = 226.9;
  double RsUsEqWef = 226.9;

  //final values
  double FixOMLocFn = 0;
  double FixOMForFn = 0;
  double ROEFn = 0;
  double ROEDCFn = 0;
  double VarOmForFn = 0;
  double WatUseChFn = 0;

  double In = 0;
  double Fn = 0;

  Future<void> _loadData() async {
    print('loading');
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      FixOMLocIn = _prefs.getDouble('FixOMLocIn') ?? 0.1255;
      FixOMForIn = _prefs.getDouble('FixOMForIn') ?? 0.2188;
      ROEIn = _prefs.getDouble('ROEIn') ?? 1.0699;
      ROEDCIn = _prefs.getDouble('ROEDCIn') ?? 0.8922;

      //Variable
      VarOMForIn = _prefs.getDouble('VarOMForIn') ?? 0.1044;
      WatUseChIn = _prefs.getDouble('WatUseChIn') ?? 0.2154;

      //Indexation
      USCpiRef = _prefs.getDouble('USCpiRef') ?? 208.49;
      CpiLocRef = _prefs.getDouble('CpiLocRef') ?? 154.72;
      RsUsOmRef = _prefs.getDouble('RsUsOmRef') ?? 60;
      RsUsEqRef = _prefs.getDouble('RsUsEqRef') ?? 81.50;

      USCpiWef = _prefs.getDouble('USCpiWef') ?? 297.711;
      CpiLocWef = _prefs.getDouble('CpiLocWef') ?? 269.27;
      RsUsOmWef = _prefs.getDouble('RsUsOmWef') ?? 226.9;
      RsUsEqWef = _prefs.getDouble('RsUsEqWef') ?? 226.9;
    });
  }

  Future<void> _saveData() async {
    print("saving");

    await _prefs.setDouble('FixOMLocIn', FixOMLocIn);
    // Use setDouble for float values
    await _prefs.setDouble('FixOMForIn', FixOMForIn);
    await _prefs.setDouble('ROEIn', ROEIn);
    await _prefs.setDouble('ROEDCIn', ROEDCIn);
    //variable
    await _prefs.setDouble('VarOMForIn', VarOMForIn);
    await _prefs.setDouble('WatUseChIn', WatUseChIn);
    //Indexation
    await _prefs.setDouble('USCpiRef', USCpiRef);
    await _prefs.setDouble('CpiLocRef', CpiLocRef);
    await _prefs.setDouble('RsUsOmRef', RsUsOmRef);
    await _prefs.setDouble('RsUsEqRef', RsUsEqRef);

    await _prefs.setDouble('USCpiWef', USCpiWef);
    await _prefs.setDouble('CpiLocWef', CpiLocWef);
    await _prefs.setDouble('RsUsOmWef', RsUsOmWef);
    await _prefs.setDouble('RsUsEqWef', RsUsEqWef);
  }

  void calculations() {
    print(CpiLocRef);
    setState(() {
      FixOMLocFn = (FixOMLocIn / CpiLocRef) * CpiLocWef;

      FixOMForFn = FixOMForIn / USCpiRef * USCpiWef / RsUsOmRef * RsUsOmWef;

      ROEFn = (ROEIn / RsUsEqRef) * RsUsEqWef;

      ROEDCFn = (ROEDCIn / RsUsEqRef) * RsUsEqWef;

      VarOmForFn = (VarOMForIn / USCpiRef) * (USCpiWef / RsUsOmRef) * RsUsOmWef;

      WatUseChFn = (WatUseChIn / CpiLocRef) * CpiLocWef;

      In = FixOMLocIn + FixOMForIn + ROEIn + ROEDCIn + VarOMForIn + WatUseChIn;

      Fn = FixOMLocFn + FixOMForFn + ROEFn + ROEDCFn + VarOmForFn + WatUseChFn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                final _auth = AuthService();
                _auth.SignOutUser();
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: Login()));
              },
              icon: Icon(Icons.logout)),
          title: Text(
            "Hydro",
            style: GoogleFonts.poppins(),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: DebtFin()));
                },
                icon: Icon(Icons.arrow_forward))
          ],
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text("Hydro Company",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text("Adjustment On Account of Quarterly Indexation",
                  style: GoogleFonts.nunito(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 8,
              ),
              // Table 1
              Flexible(
                flex: 4,
                child: Container(
                  child: Row(
                    children: [
                      Flexible(
                          child: Container(
                        child: Column(
                          children: [
                            Flexible(
                                child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Table(
                                      border: TableBorder.all(),
                                      columnWidths: {
                                        // SizedBox(height: 10),
                                        // Text(
                                        //   "Fixed Charges",
                                        //   style: GoogleFonts.poppins(
                                        //       fontSize: 18,
                                        //       fontWeight: FontWeight.bold),
                                        // ),
                                        // SizedBox(height: 5),
                                        // Set width of column 0 to 100
                                        0: FixedColumnWidth(
                                            200), // Allow column 1 to flex
                                        1: FixedColumnWidth(80),
                                        2: FixedColumnWidth(90),
                                        3: FixedColumnWidth(160),
                                      },
                                      children: [
                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                              child: Text('Name',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Rate(Ref)',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Rate(Rev)',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                'Indexation',
                                                style: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                              child: Text('Fixed Charges',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Rs/kWh',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Rs/kWh',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                '',
                                              ),
                                            ),
                                          ),
                                        ]),

                                        // second row
                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                              child: Text('Fixed O&M local',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      FixOMLocIn.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    // Handle onChanged event
                                                    setState(() {
                                                      FixOMLocIn = double.parse(
                                                          newValue);
                                                    });
                                                    print(FixOMLocIn);
                                                    _saveData();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                  FixOMLocFn.toStringAsFixed(4),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Local CPI',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),

                                        //3 row

                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                              child: Text('Fixed O&M Foreign',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      FixOMForIn.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      FixOMForIn = double.parse(
                                                          newValue);
                                                    });

                                                    _saveData();
                                                    // Handle onChanged event
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                  FixOMForFn.toStringAsFixed(4),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Rs./ US & US CPI',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),

                                        //4 row

                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                              child: Text('ROE',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      ROEIn.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    // Handle onChanged event
                                                    setState(() {
                                                      ROEIn = double.parse(
                                                          newValue);
                                                    });

                                                    _saveData();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                  ROEFn.toStringAsFixed(4),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Rs./ US',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),

                                        //4 row

                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                              child: Text('ROEDC',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      ROEDCIn.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    // Handle onChanged event
                                                    setState(() {
                                                      ROEDCIn = double.parse(
                                                          newValue);
                                                    });

                                                    _saveData();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                  ROEDCFn.toStringAsFixed(4),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Rs./ US',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                              child: Text('Variable Charges',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                '',
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                '',
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),

                                        // second row
                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                  'Variable O&M Foreign',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      VarOMForIn.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      VarOMForIn = double.parse(
                                                          newValue);
                                                    });
                                                    print(VarOMForIn);
                                                    _saveData();
                                                    // Handle onChanged event
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                  VarOmForFn.toStringAsFixed(4),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Rs./ US & US CPI',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),

                                        //3 row

                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                              child: Text('Water Use Charge',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      WatUseChIn.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    // Handle onChanged event
                                                    setState(() {
                                                      WatUseChIn = double.parse(
                                                          newValue);
                                                    });
                                                    print(WatUseChIn);
                                                    _saveData();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                  WatUseChFn.toStringAsFixed(4),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Local CPI',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                              child: Text('Total Tariff',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(In.toStringAsFixed(4),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(Fn.toStringAsFixed(4),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                                child: Text(
                                              'Indexation Values',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Ref',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('Rev',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),

                                        // second row
                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                                child: Text(
                                              'US(CPI)',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w300),
                                            )),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      USCpiRef.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      USCpiRef = double.parse(
                                                          newValue);
                                                    });
                                                    print(USCpiRef);
                                                    _saveData();
                                                    // Handle onChanged event
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      USCpiWef.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      USCpiWef = double.parse(
                                                          newValue);
                                                    });

                                                    _saveData();
                                                    // Handle onChanged event
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                  'US Labor Stats Bureau',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),

                                        //3 row
                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                                child: Text(
                                              'CPI(General) - Local',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w300),
                                            )),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      CpiLocRef.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      CpiLocRef = double.parse(
                                                          newValue);
                                                    });

                                                    _saveData();
                                                    // Handle onChanged event
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      CpiLocWef.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      CpiLocWef = double.parse(
                                                          newValue);
                                                    });

                                                    _saveData();
                                                    // Handle onChanged event
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text(
                                                  'Pakistan Stats Bureau',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),

                                        //4 row
                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                                child: Text(
                                              'Rs/US For O&M',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w300),
                                            )),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      RsUsOmRef.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      RsUsOmRef = double.parse(
                                                          newValue);
                                                    });

                                                    _saveData();
                                                    // Handle onChanged event
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      RsUsOmWef.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      RsUsOmWef = double.parse(
                                                          newValue);
                                                    });

                                                    _saveData();
                                                    // Handle onChanged event
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('NBP',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),

                                        // 5 row
                                        TableRow(children: [
                                          TableCell(
                                            child: Center(
                                                child: Text(
                                              'Rs/US For Equity',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w300),
                                            )),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      RsUsEqRef.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      RsUsEqRef = double.parse(
                                                          newValue);
                                                    });

                                                    _saveData();
                                                    // Handle onChanged event
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              height: 15,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue:
                                                      RsUsEqWef.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      RsUsEqWef = double.parse(
                                                          newValue);
                                                    });

                                                    _saveData();
                                                    // Handle onChanged event
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Center(
                                              child: Text('NBP',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 3),
                                  //   child: Table(
                                  //     border: TableBorder.all(),
                                  //     columnWidths: {
                                  //       0: FlexColumnWidth(), // Set width of column 0 to 100
                                  //       1: FixedColumnWidth(
                                  //           50), // Allow column 1 to flex
                                  //       2: FixedColumnWidth(50),
                                  //     },
                                  //     children: [

                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(height: 5),
                                  ElevatedButton(
                                      onPressed: () {
                                        calculations();
                                      },
                                      child: Text(
                                        "Calculate",
                                        style: GoogleFonts.poppins(),
                                      )),
                                ],
                              ),
                            ))
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              // Table 2 and 3
            ],
          ),
        ));
  }
}
