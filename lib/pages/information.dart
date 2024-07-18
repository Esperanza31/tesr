import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Information_Page extends StatefulWidget {
  const Information_Page({super.key});


  @override
  State<Information_Page> createState() => _Information_PageState();

}

class _Information_PageState extends State<Information_Page> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text('Information'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Morning Schedule for KAP MRT station to NP campus',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 10),
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(2),
                  },
                  border: TableBorder.all(),
                  children: [
                    _buildTableRow(['Trip', 'Bus A Departure Time(KAP)', 'Trip', 'Bus B Departure Time(KAP)']),
                    _buildTableRow(['1', '07:30am', '2', '07:35am']),
                    _buildTableRow(['3', '07:45am', '4', '07:50am']),
                    _buildTableRow(['5', '08:00am', '6', '08:05am']),
                    _buildTableRow(['7', '08:15am', '8', '08:20am']),
                    _buildTableRow(['9', '08:30am', '10', '08:35am']),
                    _buildTableRow(['11', '08:45am', '12', '08:50am']),
                    _buildTableRow(['13', '09:00am', '14', '09:05am']),
                    _buildTableRow(['15', '09:15am', '16', '09:20am']),
                  ],
                ),
                SizedBox(height: 50.0),
                Text(
                  'Morning Schedule for CLE MRT station to NP campus',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 10),
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  border: TableBorder.all(),
                  children: [
                    _buildTableRow(['Trip', 'Bus A Departure Time(CLE)']),
                    _buildTableRow(['1', '07:30am']),
                    _buildTableRow(['2', '08:00am']),
                    _buildTableRow(['3', '08:30am']),
                    _buildTableRow(['4', '09:00am']),
                  ],
                ),
                Text(
                  'Afternoon Schedule for KAP MRT station to NP campus',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 10),
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(2),
                  },
                  border: TableBorder.all(),
                  children: [
                    _buildTableRow(['Trip', 'Bus A Departure Time(KAP)', 'Trip', 'Bus B Departure Time(KAP)']),
                    _buildTableRow(['1', '15:30pm', '2', '15:45pm']),
                    _buildTableRow(['3', '16:00pm', '4', '16:15pm']),
                    _buildTableRow(['5', '16:30pm', '6', '16:45pm']),
                    _buildTableRow(['7', '17:00pm', '8', '17:15pm']),
                    _buildTableRow(['9', '17:30pm', '10', '17:45pm']),
                    _buildTableRow(['11', '18:00pm', ' ', '-']),
                  ],
                ),
                SizedBox(height: 50.0),
                Text(
                  'Afternoon Schedule for CLE MRT station to NP campus',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 10),
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  border: TableBorder.all(),
                  children: [
                    _buildTableRow(['Trip', 'Bus A Departure Time(CLE)']),
                    _buildTableRow(['1', '15:30pm']),
                    _buildTableRow(['2', '16:15pm']),
                    _buildTableRow(['3', '17:00pm']),
                    _buildTableRow(['4', '17:45pm']),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        )
    );
  }



  TableRow _buildTableRow(List<String> data) {
    return TableRow(
      children: data.map((item) =>
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item, textAlign: TextAlign.center),
          ),
      ).toList(),
    );
  }
}