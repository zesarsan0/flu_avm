import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/helpers/coloris_forma.dart';
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


Cancelable? _dragCancelable;


void _initiareCircleAnnotations(MapboxMap mapboxmap){

mapboxmap.annotations.createCircleAnnotationManager().then((manager){
  _circleAnnotationManager=manager;

_setupDragListener(manager);



  _addereVelRenovaMarker();
});
}

void _setupDragListener(CircleAnnotationManager manager){

_dragCancelable?.cancel();


final socketService = ref.read(socketServiceProvider); 


_dragCancelable = manager.dragEvents(
  onChanged: (CircleAnnotation annotation){

    final pos= annotation.geometry.coordinates;
    ref.read(coordsMarkerProvider.notifier).state = pos;

    socketService.mitterePositio(pos);
  },
onEnd: (CircleAnnotation annotation){
  final pos = annotation.geometry.coordinates;
  ref.read(coordsMarkerProvider.notifier).state = pos;
  socketService.mitterePositio(pos);

}

);

}





Future<void> _addereVelRenovaMarker() async{

final manager = _circleAnnotationManager;
if (manager == null) return;

await manager.deleteAll();


final placed = ref.read(markerPositumProvider);



if (placed){
final situs = ref.read(coordsMarkerProvider);
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

final aliiRudi = ref.read(aliiUsoresProvider).value ?? [];

final meusId = ref.read(socketServiceProvider).meusSocketId;

final alii = aliiRudi.where((u) => u.id != meusId).toList();

for(final usor in alii){
  final usorColor = adHexExColor(usor.colorhex);

  final aliaOtionen = CircleAnnotationOptions(
geometry: Point(coordinates: usor.positio),
circleColor: usorColor.toARGB32(),
circleRadius: 14.0,
circleStrokeColor: Colors.white.toARGB32(),
isDraggable: false
);

try {
await manager.create(aliaOtionen);
}catch (e){
debugPrint('Error al crear marcador de otros usuarios: $e');
}


}




}



@override
  void dispose() {
    _dragCancelable?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    ref.listen<bool>(markerPositumProvider,(prev,next){
      if(next == true) _addereVelRenovaMarker();
    });


  ref.listen(aliiUsoresProvider, (prev, next){
    _addereVelRenovaMarker();
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
        coordinates: initialistMarkerPositio,
          ),
          zoom: 14.5,
    ) ,
    styleUri: MapboxStyles.MAPBOX_STREETS,
    onMapCreated:_initiareCircleAnnotations,
   ),


     Align (
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: ref.watch(markerPositumProvider)
          ? InformaUsoris(
            nomen: ref.watch(formNomenProvider),
            positio: ref.watch(coordsMarkerProvider),
            color: ref.watch(formColorProvider)
            ) : SizedBox(),
          ),
      ),
  ]
  )

    );
  }
}