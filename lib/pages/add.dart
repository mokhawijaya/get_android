import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  @override
  _InsertDataState createState() => _InsertDataState();
}

class Manusia {
  int ID, Umur, Tinggi;
  String Nama;

  Manusia(this.ID, this.Nama, this.Umur, this.Tinggi);
}

class _InsertDataState extends State<InsertData> {
  static const String BOT_URL = "http://127.0.0.1:5000";
  TextEditingController queryController = TextEditingController();
  
  int SelectedPageIndex = 0;
  bool IsRailExtended = false;

  List<Manusia> DaftarAnak = <Manusia>[Manusia(1, "Laeli Nurafiah", 21, 156)];

  final formKey = new GlobalKey<FormState>();
  var ID_Controller = new TextEditingController();
  var Name_Controller = new TextEditingController();
  var Age_Controller = new TextEditingController();
  var Hight_Controller = new TextEditingController();
  var lastID = 2;

  @override
  void initState() {
    super.initState();
    lastID++;
    ID_Controller.text = lastID.toString();
  }

  refreshList() {
    setState(() {
      ID_Controller.text = lastID.toString();
    });
  }

  validate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();

      String ID = ID_Controller.text;
      String N = Name_Controller.text;
      String A = Age_Controller.text;
      String H = Hight_Controller.text;

      Manusia baru = Manusia(int.parse(ID), N, int.parse(A), int.parse(H));
      DaftarAnak.add(baru);
      lastID++;
      refreshList();
      Name_Controller.text = "";
      Age_Controller.text = "";
      Hight_Controller.text = "";
    }
  }

  bool NotIntCheck(var N) {
    final V = int.tryParse(N);

    if (V == null) {
      print("Bukan Angka");
      return true;
    } else {
      print("Angka");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Anak"),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("No:"),
                  TextField(
                    controller: ID_Controller,
                    enabled: false,
                  ),
                  Text("Nama:"),
                  TextFormField(
                    controller: Name_Controller,
                    keyboardType: TextInputType.text,
                    validator: (val) =>
                        val?.length == 0 ? 'Masukan Nama' : null,
                  ),
                  Text("Umur : (dalam bulan)"),
                  TextFormField(
                    controller: Age_Controller,
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        NotIntCheck(val) ? 'Masukan Umur' : null,
                  ),
                  Text("Tinggi Badan :"),
                  TextFormField(
                    controller: Hight_Controller,
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        NotIntCheck(val) ? 'Masukan Tinggi Badan' : null,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        'Tambah Data',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: validate,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  Text(
                    "Daftar Anak",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text("No"),
                  ),
                  DataColumn(
                    label: Text("Nama"),
                  ),
                  DataColumn(
                    label: Text("Umur"),
                  ),
                  DataColumn(
                    label: Text("Tinggi Badan"),
                  ),
                ],
                rows: DaftarAnak.map(
                  (p) => DataRow(cells: [
                    DataCell(
                      Text(p.ID.toString()),
                    ),
                    DataCell(
                      Text(p.Nama),
                    ),
                    DataCell(
                      Text(p.Umur.toString()),
                    ),
                    DataCell(
                      Text(p.Tinggi.toString()),
                    ),
                  ]),
                ).toList(),
              ))
        ],
      ),
    );
  }
}
