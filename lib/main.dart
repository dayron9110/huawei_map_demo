import 'package:flutter/material.dart';
import 'package:huawei_map/components/components.dart';
import 'package:huawei_map/map.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huawei map Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Huawei maps Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    HuaweiMapInitializer.initializeMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const HuaweiMapPage()));
              },
              child: const Text('Go to maps')),
        ));
  }
}

class HuaweiMapPage extends StatefulWidget {
  const HuaweiMapPage({Key? key}) : super(key: key);

  @override
  State<HuaweiMapPage> createState() => _HuaweiMapPageState();
}

class _HuaweiMapPageState extends State<HuaweiMapPage> {
  final LatLng _center = const LatLng(41.012959, 28.997438);
  final double _zoom = 12;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Huawei demo page'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const TextPage()));
                },
                child: const Text(
                  'Open page',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Stack(
          children: [
            HuaweiMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: true,
              rotateGesturesEnabled: false,
              tiltGesturesEnabled: false,
              mapToolbarEnabled: false,
              minMaxZoomPreference: const MinMaxZoomPreference(5, 25),
              initialCameraPosition: CameraPosition(target: _center, zoom: _zoom),
            )
          ],
        ));
  }
}

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Test page'),
      ),
    );
  }
}
