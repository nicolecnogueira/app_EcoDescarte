import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'point_details_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-5.79447, -35.21099),
    zoom: 14.0,
  );
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _createMarkers();
  }

  void _createMarkers() {
    final marker = Marker(
      markerId: const MarkerId('ponto_coleta_1'),
      position: const LatLng(-5.7971, -35.2082),
      infoWindow: const InfoWindow(
        title: 'Ecocentro Potengi',
        snippet: 'Toque para ver detalhes e agendar.',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      onTap: () {
        if (_scaffoldKey.currentContext != null) {
          Navigator.push(
            _scaffoldKey.currentContext!,
            MaterialPageRoute(builder: (context) => const PointDetailsPage()),
          );
        }
      },
    );

    setState(() {
      _markers.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
      ),
    );
  }
}