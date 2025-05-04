import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/app_colors.dart';
import 'package:flutter_guess_the_number/background_view.dart';
import 'package:flutter_guess_the_number/game.dart';
import 'package:flutter_guess_the_number/slider_widget.dart';
import 'package:flutter_guess_the_number/test_view.dart';
import 'package:flutter_guess_the_number/view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
        home: Scaffold(
          body: Stack(children: [const BackgroundView(), const ContentView()]),
        ),
      ),
    );
  }
}

class ContentView extends StatefulWidget {
  const ContentView({super.key});

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  double _value = 50;
  final double _MIN_VALUE = 1.0;
  final double _MAX_VALUE = 100.0;
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ViewModel>(); 
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("🎯🎯🎯🎯", style: Theme.of(context).textTheme.headlineMedium),
          Text(
            "${appState.targetValue}",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              letterSpacing: -1,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SliderWidget(
              value: _value,
              onChanged: _onChanged,
              min: _MIN_VALUE,
              max: _MAX_VALUE,
            ),
          ),
          //Text("$_value"),
          ElevatedButton(
            onPressed: _onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(48, 48),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
            ),
            child: Text(
              "TRY",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
          ),
          
          // Historial de intentos
          if (appState.attempts.isNotEmpty) ...[
            const SizedBox(height: 20),
            Text(
              "Últimos intentos:",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 120, // Altura fija para el contenedor
              width: 300, // Ancho fijo para el contenedor
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: appState.attempts.length,
                itemBuilder: (context, index) {
                  final attempt = appState.attempts[index];
                  return Card(
                    color: Colors.white.withOpacity(0.1),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Valor: ${attempt['value']}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "Puntos: ${attempt['points']}",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  void _onPressed() {
    var appState = Provider.of<ViewModel>(context, listen: false);
    appState.calculatePoints(_value);
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Congralutations"),
            content: Text("Your points are: ${appState.points}"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    appState.reset();
                  });
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }
}
