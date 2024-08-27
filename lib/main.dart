import 'package:ecom/base.dart';
import 'package:ecom/blocs/cart_bloc/bloc/cart_bloc.dart';
import 'package:ecom/blocs/product_bloc/bloc/product_bloc.dart';
import 'package:ecom/repositories/product_repository.dart';

import 'package:ecom/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(
            ProductRepository(),
          )..add(LoadProducts()),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        title: 'Demo Ecommerce',
        home: const BaseScreen(),
      ),
    );
  }
}
