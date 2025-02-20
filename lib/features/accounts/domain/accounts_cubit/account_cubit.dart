import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_state.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';
import 'package:pbnhs/features/accounts/repository/user_account_repository.dart';

class AccountCubit extends Cubit<AccountState> {
  final UserAccountRepository _userAccountRepository;

  AccountCubit(this._userAccountRepository) : super(const AccountState());

  Future<void> createAccount(UserModel user, String password) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      await _userAccountRepository.createUserWithEmailAndPassword(
          user, password);
      final updatedUsers = await _userAccountRepository.getUsers();

      emit(state.copyWith(
          isLoading: false, isSuccess: true, users: updatedUsers));

      emit(state.copyWith(isSuccess: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> updateUser(UserModel user) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      await _userAccountRepository.saveUser(user);
      final updatedUsers = await _userAccountRepository.getUsers();

      emit(state.copyWith(
          isLoading: false, isSuccess: true, users: updatedUsers));

      // Reset isSuccess
      emit(state.copyWith(isSuccess: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> getUsers() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      List<UserModel> users = await _userAccountRepository.getUsers();

      emit(state.copyWith(isLoading: false, users: users));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> deleteUser(String uid) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      await _userAccountRepository.deleteUser(uid);
      final updatedUsers = await _userAccountRepository.getUsers();

      emit(state.copyWith(
          isLoading: false, isSuccess: true, users: updatedUsers));

      emit(state.copyWith(isSuccess: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
