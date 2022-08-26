part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final DtStatus? status;

  const AuthState({
    this.status,
  });

  @override
  List<Object?> get props => [
        status,
      ];

  AuthState copyWith({
    DtStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
    );
  }
}
