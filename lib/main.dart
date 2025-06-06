import 'package:canaryfarm/data/repository/auth_repository.dart';
import 'package:canaryfarm/data/repository/get_all_burung_tersedia_repository.dart';
import 'package:canaryfarm/data/repository/profile_buyer_repository.dart';
import 'package:canaryfarm/presentation/auth/bloc/get_all_burung_tersedia/get_burung_tersedia_bloc.dart';
import 'package:canaryfarm/presentation/auth/bloc/login/login_bloc.dart';
import 'package:canaryfarm/presentation/auth/bloc/register/register_bloc.dart';
import 'package:canaryfarm/presentation/buyer/profile/bloc/profile_buyer_bloc.dart';
import 'package:canaryfarm/services/service_http_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LoginBloc(authRepository: AuthRepository(ServiceHttpClient())),
        ),
        BlocProvider(
          create: (context) =>
              RegisterBloc(authRepository: AuthRepository(ServiceHttpClient())),
        ),
        BlocProvider(
          create: (context) => ProfileBuyerBloc(
            profileBuyerRepository: ProfileBuyerRepository(ServiceHttpClient()),
          ),
        ),

        BlocProvider(
          create: (context) => GetBurungTersediaBloc(
            GetAllBurungTersediaRepository(ServiceHttpClient()),
          ),
        ),
        
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Splashscreen(),
      ),
    );
  }
}