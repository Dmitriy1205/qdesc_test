import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qdesc_test/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:qdesc_test/ui/bloc/customers_cubit/customer_cubit.dart';
import 'package:qdesc_test/ui/screens/main_screen.dart';
import 'package:qdesc_test/ui/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child:
        // MainScreen(),
        const LoginForm(),
      ),
    );
  }
}
