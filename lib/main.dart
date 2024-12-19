import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/PrepareSeamlessNumberInstance.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const SetDeclarativeScreenInstance());
}

class SetDeclarativeScreenInstance extends StatelessWidget {
  const SetDeclarativeScreenInstance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TrainPermanentSliderHandler(),
    );
  }
}
