import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbookapp/repository/user_repo.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  StreamSubscription? _userSub;
  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserLoading()) {
    on<GetListUser>(_onGetListUser);
    on<GetUser>(_onGetUser);
    on<AddUser>(_onAddUser);
    on<UpdateUser>(_onUpdateUser);
  }
  void _onGetListUser(GetListUser event, Emitter<UserState> emit) {
    _userSub?.cancel();
    _userSub = _userRepository.getUser().listen((user) => add(GetUser(user)));
  }

  void _onGetUser(GetUser event, Emitter<UserState> emit) {
    emit(UserListLoaded(event.user));
  }

  void _onAddUser(AddUser event, Emitter<UserState> emit) {
    emit(UserLoading());
    try {
      var user = _userRepository.registerUser(event.user);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  void _onUpdateUser(event, Emitter<UserState> emit) {
    emit(UserLoading());

    try {
      var user = _userRepository.updateUser(event.user);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
