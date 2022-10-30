import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/app/app.dart';
import 'package:yomo_ecommerce/app/dependency_injection.dart';
import 'package:yomo_ecommerce/firebase_options.dart';
import 'package:yomo_ecommerce/presentation/blocs/simple_bloc_oberserver.dart';

void main() async {
  // Ensure that Flutter engine already started and binding is ok
  WidgetsFlutterBinding.ensureInitialized();

  // Register all singletons and factories
  initAppModule();

  // Observe all Blocs
  Bloc.observer = SimpleBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}
