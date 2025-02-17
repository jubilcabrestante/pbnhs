import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/repository/user_repository.dart';
import 'package:pbnhs/features/accounts/cubit/account_state.dart';
import 'package:pbnhs/core/models/user_model/user_model.dart';

class AccountCubit extends Cubit<AccountState> {
  final UserRepository _userRepository;

  AccountCubit(this._userRepository) : super(const AccountState());

  Future<void> createAccount(UserModel user, String password) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await _userRepository.createUserWithEmailAndPassword(user, password);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
