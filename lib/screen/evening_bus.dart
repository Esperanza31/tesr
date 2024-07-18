
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_five/pages/busdata.dart';
import 'package:mini_project_five/pages/location_service.dart';


class EveningStartPoint {
  static Widget getBusTime(List<DateTime>? busArrivalTimes, BuildContext context) {
    DateTime currentTime = DateTime.now();
    bool isAfter3pm = currentTime.hour >= 9;
    print("Current Time: $currentTime");
    double businterval = 1.5;

    List<DateTime> upcomingArrivalTimes =
    busArrivalTimes!.where((time) => time.isAfter(currentTime)).toList();

    Widget result = SizedBox(); // Initialize a default widget

      if (upcomingArrivalTimes.isEmpty && isAfter3pm) {
        print("No coming arrival times");
        result =
            Text('NO UPCOMING BUSES');
      } else if (upcomingArrivalTimes.isNotEmpty && isAfter3pm) {
        int nextBusTimeDiff =
            upcomingArrivalTimes[0].difference(currentTime).inMinutes;

        int nextNextBusTimeDiff = upcomingArrivalTimes.length > 1
            ? (upcomingArrivalTimes[1].difference(currentTime).inMinutes)
            : 0;

        result = Column(
          children: [
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Text('Bus Stop',
                style: TextStyle(
                  fontSize: 10,
                ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.32),
                Text('Upcoming bus(min)',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                SizedBox(width: 20),
                Text('Next bus(min)',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Container(height: 45, width: 5, color: Colors.white),
                Container(
                  width: MediaQuery.of(context).size.width *0.4,
                  color: Colors.lightBlue[500],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text(BusStops[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      ),
                    )
                ),
                SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  color: Colors.lightBlue[50],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text('$nextBusTimeDiff',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                ),
                SizedBox(width: 10),
                Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                  color: Colors.lightBlue[50],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text('$nextNextBusTimeDiff',
                      style: TextStyle(
                        fontSize: 18,
                      ),),
                    )
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                Container(height: 45, width: 5, color: Colors.white),
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    color: Colors.lightBlue[500],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text(BusStops[1],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                ),
                SizedBox(width: 10),
                Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    color: Colors.lightBlue[50],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text('${nextBusTimeDiff+(1.5*1)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                ),
                SizedBox(width: 10),
                Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    color: Colors.lightBlue[50],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text('${nextNextBusTimeDiff+(1.5*1)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),),
                    )
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                Container(height: 45, width: 5, color: Colors.white),
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    color: Colors.lightBlue[500],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text(BusStops[2],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                ),
                SizedBox(width: 10),
                Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    color: Colors.lightBlue[50],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text('${nextBusTimeDiff+(1.5*2)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                ),
                SizedBox(width: 10),
                Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    color: Colors.lightBlue[50],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text('${nextNextBusTimeDiff+(1.5*2)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),),
                    )
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                Container(height: 45, width: 5, color: Colors.white),
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    color: Colors.lightBlue[500],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text(BusStops[3],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                ),
                SizedBox(width: 10),
                Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    color: Colors.lightBlue[50],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text('${nextBusTimeDiff+(1.5*3)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                ),
                SizedBox(width: 10),
                Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    color: Colors.lightBlue[50],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text('${nextNextBusTimeDiff+(1.5*3)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),),
                    )
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                Container(height: 45, width: 5, color: Colors.white),
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    color: Colors.lightBlue[500],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text(BusStops[4],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                ),
                SizedBox(width: 10),
                Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    color: Colors.lightBlue[50],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text('${nextBusTimeDiff+(1.5*4)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                ),
                SizedBox(width: 10),
                Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    color: Colors.lightBlue[50],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text('${nextNextBusTimeDiff+(1.5*4)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),),
                    )
                ),
              ],
            ),
          ],
        );
      }

    return result; // Return the widget after the loop completes
  }
}


  class GetEveningBusTime extends StatelessWidget {
  final List<DateTime> busArrivalTimes;

  const GetEveningBusTime(this.busArrivalTimes);

  @override
  Widget build(BuildContext context) {
    return EveningStartPoint.getBusTime(busArrivalTimes, context);
  }
}


