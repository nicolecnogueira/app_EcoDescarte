import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _HomeMapScreenState();
}

class _HomeMapScreenState extends State<MapPage> {
  // Coordenadas iniciais para o mapa (Ex: Centro de Natal, RN)
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-5.79447, -35.21099),
    zoom: 14.0,
  );

  // Lista de marcadores no mapa. Para o MVP, podemos começar com dados fixos.
  final Set<Marker> _markers = {
    Marker(
      markerId: const MarkerId('ponto_coleta_1'),
      position: const LatLng(-5.7971, -35.2082), // Posição do ponto de coleta
      infoWindow: const InfoWindow(
        title: 'Ecocentro Potengi',
        snippet: 'Ponto de coleta de recicláveis e eletrônicos.',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    )
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
      ),
    );
  }
}