import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qdesc_test/core/icons/app_icon.dart';
import 'package:qdesc_test/ui/bloc/customers_cubit/customer_cubit.dart';

class CustomerList extends StatelessWidget {
  CustomerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, CustomerState>(
      builder: (context, state) {
        if (state.status!.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status!.isError) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 150),
            child: SizedBox(
              child: Center(
                child: Text('Problem with fetching data'),
              ),
            ),
          );
        }
        return Flexible(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.customer!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: ExpansionTile(
                    trailing: IconButton(
                      onPressed: () {
                        //TODO: delete item
                      },
                      icon: const Icon(
                        AppIcon.garb,
                        size: 18,
                        color: Colors.red,
                      ),
                    ),
                    textColor: Colors.green[500],
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Customer'
                            // state.customer?[index].name,
                            ),
                        IconButton(
                          onPressed: () {
                            //TODO: edit item
                          },
                          icon: const Icon(
                            AppIcon.pen,
                            size: 17,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    children: [
                      buildList(),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }

  Widget buildList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  Text(
                    list[index],
                    style: TextStyle(color: Colors.green[600]),
                  ),
                  // Text(item.toString()),
                ],
              ),
            );
          }),
    );
  }

  var list = <String>[
    'Begin date',
    'Service Plan Type',
    'Account Status',
    'Mobile Key Subscriber',
    'SAAS Subscriber',
    'Number',
    'of locks',
    'of readers',
    'of lockers',
  ];
}
