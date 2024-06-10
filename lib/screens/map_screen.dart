// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:grad_project_last_v/services/get_location.dart';
//
// class MapScreen extends StatefulWidget {
//   static String routeName = 'map screen';
//   const MapScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   Completer<GoogleMapController> _controller = Completer();
//   CameraPosition? _cameraPosition;
//   @override
//   void initState() {
//     _init();
//     super.initState();
//   }
//
//   _init() {
//     _cameraPosition = CameraPosition(
//         target: LatLng(location['latitude'], location['longitude']), zoom: 15);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildBody(),
//     );
//   }
//
//   Widget _buildBody() {
//     return _getMap();
//   }
//
//   Widget _getMap() {
//     return GoogleMap(
//       initialCameraPosition: _cameraPosition!,
//       mapType: MapType.normal,
//       onMapCreated: (GoogleMapController controller) {
//         if (!_controller.isCompleted) {
//           _controller.complete(controller);
//         }
//       },
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grad_project_last_v/componentes/student_component.dart';
import 'package:grad_project_last_v/services/get_location.dart';

class MapScreen extends StatefulWidget {
  static String routeName = 'map screen';
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition? _cameraPosition;
  bool _locationAvailable = true; // Flag to check if location is available

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    try {
      var locationVar =
          location; // Assuming this function gets the location data
      if (locationVar != null &&
          location.containsKey('latitude') &&
          location.containsKey('longitude')) {
        setState(() {
          _cameraPosition = CameraPosition(
              target: LatLng(location['latitude'], location['longitude']),
              zoom: 15);
          StudentView studentView = StudentView('', '', '', '', '', '');
          studentView.initLocation();
        });
      } else {
        setState(() {
          _locationAvailable = false;
        });
      }
    } catch (e) {
      setState(() {
        _locationAvailable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (!_locationAvailable) {
      return const Center(
        child: Text('Location not available'),
      );
    }

    if (_cameraPosition == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return _getMap();
  }

  // Widget _getMap() {
  //   return GoogleMap(
  //     initialCameraPosition: _cameraPosition!,
  //     mapType: MapType.normal,
  //     onMapCreated: (GoogleMapController controller) {
  //       if (!_controller.isCompleted) {
  //         _controller.complete(controller);
  //       }
  //     },
  //   );
  // }
  Widget _getMap() {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _cameraPosition!,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            if (!_controller.isCompleted) {
              _controller.complete(controller);
            }
          },
        ),

        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: _getMarker(),
          ),
        )
      ],
    );
  }

  Widget _getMarker() {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 3),
                spreadRadius: 4,
                blurRadius: 6)
          ]),
      child: ClipOval(
        child: Image.asset('assets/images/location.png'),
      ),
    );
  }
}
