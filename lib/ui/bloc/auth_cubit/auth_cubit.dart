import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qdesc_test/data/network/api_client.dart';
import 'package:qdesc_test/data/repository/repository.dart';

import '../../../data/models/dt_status.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(status: DtStatus.initial()));
  var repo = Repository();

  Future<void> login(String email, String password) async {
    try {
      await repo.getToken(email, password);
      emit(state.copyWith(status: DtStatus.loaded()));
    } catch (e) {
      emit(state.copyWith(status: DtStatus.error(e.toString())));
    }
  }
}
