import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_state.dart';
import 'package:pbnhs/features/accounts/repository/account_model/account_vm.dart';
import 'package:pbnhs/features/accounts/repository/user_account_repository.dart';

class AccountCubit extends Cubit<AccountState> {
  final UserAccountRepository _userAccountRepository;

  AccountCubit(this._userAccountRepository) : super(const AccountState()) {
    getUsers();
  }

  Future<void> createAccount(AccountVm user, String password) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    try {
      await _userAccountRepository.createUserWithEmailAndPassword(
        user,
        password,
      );

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
      ));
      getUsers();
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> updateUser(AccountVm user) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      await _userAccountRepository.updateUser(user);
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
      List<AccountVm> users = await _userAccountRepository.getUsers();
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
