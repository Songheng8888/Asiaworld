import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertyMap extends StatefulWidget {
  final String? lat;
  final String? lon;
  const PropertyMap({required this.lat, required this.lon});

  @override
  State<PropertyMap> createState() => _PropertyMapState();
}

class _PropertyMapState extends State<PropertyMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kLake =
      CameraPosition(target: LatLng(11.5567837, 104.9088561), zoom: 11);
  double? lat;
  double? lon;
  Set<Marker> _markers = {};

  @override
  void initState() {
    lat = double.parse(widget.lat!);
    lon = double.parse(widget.lat!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return lat == null
        ? Container()
        : Scaffold(
            body: Container(
              height: 500,
              width: MediaQuery.of(context).size.width * 0.95,
              // child: GoogleMap(
              //   mapType: MapType.normal,
              //   initialCameraPosition: CameraPosition(
              //       target: LatLng(lat!, lon!), zoom: 19.151926040649414),
              //   onMapCreated: (GoogleMapController controller) {
              //     _controller.complete(controller);
              //   },
              // ),
              child: GoogleMap(
                // layoutDirection: ,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat!, lon!),
                  zoom: 10,
                ),
                markers: Set<Marker>.of(_markers),
                onMapCreated: (GoogleMapController controller) {
                  //  _controller.complete(controller);
                  setState(() {
                    _markers.add(Marker(
                        markerId: MarkerId(""),
                        position: LatLng(lat!, lon!),
                        infoWindow: InfoWindow()));
                  });
                },
              ),
            ),
            floatingActionButton: _buildFloatingButton,
          );
  }

  get _buildFloatingButton {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 30),
      height: 50,
      width: 180,
      child: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the land!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Widget get _buildBody {
    return Container(
      height: 500,
      width: 500,
      child: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
            target: LatLng(11.5567837, 104.9088561), zoom: 19.151926040649414),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
