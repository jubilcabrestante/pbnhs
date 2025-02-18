import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_state.dart';
import 'package:pbnhs/core/models/user_model/user_model.dart';
import 'package:pbnhs/features/accounts/repository/user_account_repository.dart';

class AccountCubit extends Cubit<AccountState> {
  final UserAccountRepository _userRepository;

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

  Future<void> getUsers() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      List<UserModel> users = await _userRepository.getUsers();

      emit(state.copyWith(isLoading: false, users: users));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> updateUser(UserModel user) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await _userRepository.saveUser(user);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> deleteUser(String uid) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await _userRepository.deleteUser(uid);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
