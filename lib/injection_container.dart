import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/data/datasources/auth_data_source.dart';
import 'features/auth/data/repositories/auth_repositories_impl.dart';
import 'features/auth/domain/repositories/auth_repositories.dart';
import 'features/auth/domain/usecases/create_user.dart';
import 'features/auth/domain/usecases/login.dart';
import 'features/auth/domain/usecases/logout.dart';
import 'features/auth/domain/usecases/user_change.dart';
import 'features/order/data/datasources/order_data_source.dart';
import 'features/order/data/repositories/order_repositories_impl.dart';
import 'features/order/domain/repositories/order_repositories.dart';
import 'features/order/domain/usecases/get_order.dart';
import 'features/order/domain/usecases/put_order.dart';
import 'features/order/presentation/bloc/place_order/cart_list.dart';
import 'features/product/data/datasources/product_datasource.dart';
import 'features/product/data/repositories/product_repositories_impl.dart';
import 'features/product/domain/repositories/product_domain_repositories.dart';
import 'features/product/domain/usecases/get_all_product.dart';
import 'features/product/domain/usecases/get_banner_product.dart';

GetIt getIt = GetIt.instance;

class Injection {
  static init() async {
    /// Firebase
    final _firebaseFirestore = FirebaseFirestore.instance;
    getIt.registerSingleton(_firebaseFirestore);

    final _firebaseAuth = FirebaseAuth.instance;
    getIt.registerSingleton(_firebaseAuth);

    final productDataSources = ProductDataSourcesImplement(getIt<FirebaseFirestore>());
    getIt.registerSingleton<ProductDataSources>(productDataSources);

    final productDataRepositories = ProductRepositoriesImpl(getIt<ProductDataSources>());
    getIt.registerSingleton<ProductRepositories>(productDataRepositories);

    final getAllProduct = GetAllProduct(getIt<ProductRepositories>());
    getIt.registerSingleton<GetAllProduct>(getAllProduct);

    final getBannerProduct = GetBannerProduct(getIt<ProductRepositories>());
    getIt.registerSingleton<GetBannerProduct>(getBannerProduct);

    // final productBloc = ProductBloc(getIt<GetAllProduct>());
    // getIt.registerFactory(() => productBloc);

    /// Authentication

    final AuthDatasource authDatasource = AuthDatasourceImpl(getIt<FirebaseAuth>(), getIt<FirebaseFirestore>());
    getIt.registerFactory(() => authDatasource);

    final AuthRepositories authRepositories = AuthRepositoriesImpl(getIt<AuthDatasource>());
    getIt.registerFactory(() => authRepositories);

    final CreateUser createUser = CreateUser(getIt<AuthRepositories>());
    getIt.registerFactory(() => createUser);

    final Login login = Login(getIt<AuthRepositories>());
    getIt.registerFactory(() => login);

    // final AuthSignupBloc authSignupBloc = AuthSignupBloc(getIt<CreateUser>());
    // getIt.registerFactory(() => authSignupBloc);

    // final AuthSigninBloc authSigninBloc = AuthSigninBloc(getIt<Login>());
    // getIt.registerFactory(() => authSigninBloc);

    final Logout logout = Logout(getIt<AuthRepositories>());
    getIt.registerSingleton(logout);

    final UserChanges userChanges = UserChanges(getIt<AuthRepositories>());
    getIt.registerSingleton(userChanges);

    /// Cart or Order Place-=
    final OrderDataSource orderDataSource = OrderDataSourceImpl(getIt<FirebaseFirestore>(), getIt<FirebaseAuth>());
    getIt.registerSingleton(orderDataSource);

    final OrderRepositories orderRepositories = OrderRepositoriesImpl(getIt<OrderDataSource>());
    getIt.registerSingleton(orderRepositories);

    final PutOrder putOrder = PutOrder(getIt<OrderRepositories>());
    getIt.registerSingleton(putOrder);

    final GetOrder getOrder = GetOrder(getIt<OrderRepositories>());
    getIt.registerSingleton(getOrder);

    final cartItemList = CartItemList();
    getIt.registerSingleton(cartItemList);

    // final shoppingCartBloc = ShoppingCartBloc(getIt<CartItemList>());
    // getIt.registerSingleton(shoppingCartBloc);
    // getIt.registerFactory(() => shoppingCartBloc);

    // final placeOrderBloc = PlaceOrderBloc(getIt<PutOrder>(), getIt<GetOrder>());
    // getIt.registerFactory(() => placeOrderBloc);
    // getIt.registerFactory(() => PlaceOrderBloc(getIt<PutOrder>(), getIt<GetOrder>()));
  }
}
