import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/customer.dart';
import '../../../data/models/dt_status.dart';
import '../../../data/network/api_client.dart';
import '../../../data/repository/repository.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerState(status: DtStatus.initial())) {
    showCustomers();
  }

  var repo = Repository();

  Future<void> showCustomers() async {
    emit(state.copyWith(status: DtStatus.loading()));
    try {
      final customer = await repo.getCustomers();
      emit(state.copyWith(status: DtStatus.loaded(), customer: customer));
    } catch (e) {
      emit(state.copyWith(status: DtStatus.error(e.toString())));
    }
  }
}
