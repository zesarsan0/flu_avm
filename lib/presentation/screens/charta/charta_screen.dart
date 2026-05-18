import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/providers/charta_provider.dart';
import 'package:flutter_application_1/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';


class ChartaScreen extends ConsumerStatefulWidget {
  const ChartaScreen({super.key});

  @override
  ConsumerState<ChartaScreen> createState() => _ChartaScreenState();
}

class _ChartaScreenState extends ConsumerState<ChartaScreen> {


CircleAnnotationManager? _circleAnnotationManager;


void _initiareCircleAnnotations(MapboxMap mapboxmap){

mapboxmap.annotations.createCircleAnnotationManager().then((manager){
  _circleAnnotationManager=manager;

  _addereVelRenovaMarker();
});
}

Future<void> _addereVelRenovaMarker() async{

final manager = _circleAnnotationManager;
if (manager == null) return;


final placed = ref.read(markerPositumProvider);

if (!placed){
  await manager.deleteAll();
  return;
}

final situs = Position(-122.467895, 37.800126);
final color = ref.read(formColorProvider);

final optiones = CircleAnnotationOptions(
geometry: Point(coordinates: situs),
circleColor: color.toARGB32(),
circleRadius: 14.0,
circleStrokeColor: Colors.white.toARGB32(),
circleStrokeWidth: 2,
isDraggable: true
);

try{
  await manager.create(optiones);
}catch (e){
  debugPrint('Error al crear el marcador: $e');
}
}

  @override
  Widget build(BuildContext context) {

    ref.listen<bool>(markerPositumProvider,(prev,next){
      if(next == true) _addereVelRenovaMarker();
    });


    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapas'),
      ),
body:Stack(
  fit: StackFit.expand,
  children: [
   MapWidget(
    key: const ValueKey('main_map'),
    // ignore: deprecated_member_use
    cameraOptions: CameraOptions(
      center:Point(
        coordinates: Position(-122.467895,37.800126),
          ),
          zoom: 14.5,
    ) ,
    styleUri: MapboxStyles.MAPBOX_STREETS,
    onMapCreated:_initiareCircleAnnotations,
   ),


      const Align (
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: ComplereForm()
          ),
      )
  ]
  )

    );
  }
}