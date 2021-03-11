import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodmarket/models/models.dart';
import 'package:foodmarket/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn({String email, String password}) async {
    ApiReturnValue result = await UserServices.signIn(
      email: email,
      password: password,
    );

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadFailed(result.message));
    }
  }
}
