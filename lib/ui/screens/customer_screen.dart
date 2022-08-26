import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qdesc_test/ui/bloc/customers_cubit/customer_cubit.dart';
import 'package:qdesc_test/ui/widgets/customer_list.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Image.asset(
              'assets/images/ava.png',
              height: 50,
              width: 50,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                //TODO: add customer
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: const Size(112, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.add_circle_outline),
                  Text(
                    'Add',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocProvider(
            create: (context) => CustomerCubit(),
            child: CustomerList(),
          ),
        ],
      ),
    );
  }
}
