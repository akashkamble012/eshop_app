import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/route/route.dart';
import 'core/theme/app_color.dart';
import 'features/auth/domain/usecases/create_user.dart';
import 'features/auth/domain/usecases/login.dart';
import 'features/auth/presentation/bloc/auth/siginup/auth_signup_bloc.dart';
import 'features/auth/presentation/bloc/auth/signin/auth_signin_bloc.dart';
import 'features/order/domain/usecases/get_order.dart';
import 'features/order/domain/usecases/put_order.dart';
import 'features/order/presentation/bloc/place_order/cart_list.dart';
import 'features/order/presentation/bloc/place_order/place_order_bloc.dart';
import 'features/order/presentation/bloc/shoping_cart/shopping_cart_bloc.dart';
import 'features/product/domain/usecases/get_all_product.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/pages/splash_scree.dart';
import 'injection_container.dart' show getIt;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductBloc(getIt<GetAllProduct>()),
        ),
        BlocProvider(
          create: (_) => PlaceOrderBloc(getIt<PutOrder>(), getIt<GetOrder>()),
        ),
        BlocProvider(
          create: (_) => ShoppingCartBloc(getIt<CartItemList>()),
        ),
        BlocProvider(
          create: (_) => AuthSignupBloc(getIt<CreateUser>()),
        ),
        BlocProvider(
          create: (_) => AuthSigninBloc(getIt<Login>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColor.primaryColor,
          primaryColorLight: AppColor.primaryColorLight,
          accentColor: Colors.amber,
          iconTheme: const IconThemeData(
            color: Colors.amber,
            size: 25,
          ),
          textTheme: const TextTheme(
            headline6: TextStyle(
              fontSize: 20,
            ),
            subtitle1: TextStyle(
              fontSize: 14,
            ),
            button: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        home: const SplashScreen(),
        routes: AppRoute.nameRoute,
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
