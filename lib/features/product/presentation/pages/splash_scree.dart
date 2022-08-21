import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import 'Product_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      BlocProvider.of<ProductBloc>(context).add(const GetProduct());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is LoadedProduct) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                ProductHomeScreen.routeName, (route) => false);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                child: Icon(
                  Icons.flash_on,
                  size: 100,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
