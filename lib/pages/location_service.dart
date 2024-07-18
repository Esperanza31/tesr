import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math' as math;
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'dart:async';

class LocationService {
  Future<LatLng?> getCurrentLocation() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting current location: $e');
      return null;
    }
  }

  void initCompass(Function(double) updateHeading) {
    FlutterCompass.events?.listen((CompassEvent event) {
      updateHeading(event.heading ?? 0.0);
    });
  }

  Widget buildCompass(double heading, LatLng currentLocation) {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        // Check if the data is null or heading is null
        if (snapshot.data == null || snapshot.data!.heading == null) {
          return Center(
            child: Text("Device does not have sensors or sensor data is null!"),
          );
        }

        return Stack(
          children: [
            MarkerLayer(
              markers: [
                Marker(
                  point: currentLocation,
                  child: CustomPaint(
                    size: Size(200, 200),
                    painter: CompassPainter(
                      direction: heading,
                      arcStartAngle: 0, // Adjust as needed
                      arcSweepAngle: 360,
                    ),
                  ),
                ),
                for (int i = 0; i < busStops.length; i++)
                  Marker(
                    point: busStopCoordinates[i],
                    width: 100,
                    height: 60,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          busStops[i],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.directions_bus_filled_outlined,
                          color: Colors.red,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class CompassPainter extends CustomPainter {
  final double direction;
  final double arcStartAngle;
  final double arcSweepAngle;

  CompassPainter({
    required this.direction,
    required this.arcStartAngle,
    required this.arcSweepAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    // Draw the blue arc indicating the direction
    Paint paint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      _toRadians(arcStartAngle),
      _toRadians(arcSweepAngle),
      false,
      paint,
    );

    // Draw the arrow indicating the exact direction
    Paint arrowPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    double arrowLength = radius * 1.5;
    double arrowAngle = _toRadians(direction);
    Offset arrowBase = Offset(
      centerX + arrowLength * math.cos(arrowAngle),
      centerY + arrowLength * math.sin(arrowAngle),
    );

    double arrowTipLength = radius * 0.1;
    double arrowTipAngle = _toRadians(direction - 180);
    Offset arrowTip = Offset(
      centerX + arrowTipLength * math.cos(arrowTipAngle),
      centerY + arrowTipLength * math.sin(arrowTipAngle),
    );

    double arrowWidth = 10;
    canvas.drawLine(arrowBase, arrowTip, arrowPaint);
    canvas.drawCircle(arrowTip, arrowWidth / 2, arrowPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double _toRadians(double degrees) {
    return degrees * math.pi / 180;
  }
}

final List<String> busStops = [
  'ENT',
  'B23',
  'SPT',
  'SIT',
  'B44',
  'B37',
  'MAP',
  'HSC',
  'LCT',
  'B72',
];

final List<LatLng> busStopCoordinates =[
  LatLng(1.3327930713846318, 103.77771893587253),
  LatLng(1.3339219201675242, 103.77574132061896),
  LatLng(1.3350826567868576, 103.7754223503998),
  LatLng(1.3343686930989717, 103.77435631203087),
  LatLng(1.3329522845882348, 103.77145520892851),
  LatLng(1.3327697559194817, 103.77323977064727),
  LatLng(1.3324019134469306, 103.7747380910866),
  LatLng(1.3298012679376835, 103.77465550100018),
  LatLng(1.3311533369747423, 103.77490110804173),
  LatLng(1.3312394356934057, 103.77644173403719)
];
