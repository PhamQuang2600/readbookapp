part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateUser extends UserEvent {
  final Users user;
  const UpdateUser(this.user);

  @override
  List<Object> get props => [user];
}

class GetListUser extends UserEvent {}

class GetUser extends UserEvent {
  final List<Users> user;
  const GetUser(this.user);

  @override
  List<Object> get props => [user];
}

class AddUser extends UserEvent {
  final Users user;
  const AddUser({required this.user});

  @override
  List<Object> get props => [user];
}
