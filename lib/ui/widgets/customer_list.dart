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
                        Text(
                          //'Customer'
                          state.customer![index].name,
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
                      buildInfoList(state, index),

                    ],
                  ),
                );
              }),
        );
      },
    );
  }

  Widget buildInfoList(state, index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Begin date',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                Text(
                  state.customer![index].beginDate.substring(0,10),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Service Plan Type',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              Text(
                state.customer![index].servicePlanType,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Account Status',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                Text(
                  state.customer![index].accountStatus,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Mobile Key Subscriber',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              Text(
                state.customer![index].modileKeysSubscriber == true
                    ? 'Yes'
                    : 'No',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'SAAS Subscriber',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                Text(
                  state.customer![index].saasSubscriber == true ? 'Yes' : 'No',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: const [
              Text(
                'Number',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'of locks',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                Text(
                  state.customer![index].ofLocks.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'of readers',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              Text(
                state.customer![index].ofReaders.toString(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'of lockers',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                Text(
                  state.customer![index].ofLockers.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
