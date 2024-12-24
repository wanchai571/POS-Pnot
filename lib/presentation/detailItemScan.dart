import 'package:flutter/material.dart';

class DetailScanItemPage extends StatefulWidget {
  const DetailScanItemPage({super.key});

  @override
  State<DetailScanItemPage> createState() => _DetailScanItemPageState();
}

class _DetailScanItemPageState extends State<DetailScanItemPage> {
  Map<String, dynamic> detailData = {};

  @override
  void didChangeDependencies() {
    setState(() {
      var result = ModalRoute.of(context)!.settings.arguments;
      detailData = result as Map<String, dynamic>;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Scan'),
      ),
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HAWB", style: TextStyle(fontSize: 20)),
                SizedBox(width: 10),
                Text("(${detailData["hawb"]})", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(),
                  1: FixedColumnWidth(180),
                  2: FixedColumnWidth(60),
                },
                border: TableBorder.all(color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.white),
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Center(
                            child: Text(
                              "Status",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Center(
                            child: Text(
                              "Created At",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(color: Colors.white),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("พบปัญหา (DMC)"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "2024-10-10 10:51:05",
                            style: TextStyle(
                              color: Colors.green[200],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.zoom_in),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(color: Colors.white),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("เจอของ"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "2024-10-10 10:51:05",
                            style: TextStyle(
                              color: Colors.green[200],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SizedBox(height: 48)],
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(color: Colors.white),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("นำเข้าข้อมูล"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "2024-10-10 10:51:05",
                            style: TextStyle(
                              color: Colors.green[200],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 48),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

