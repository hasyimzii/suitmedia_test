part of 'name_cubit.dart';

class NameState extends Equatable {
  final String name;

  const NameState({this.name = ''});

  @override
  List<Object> get props => [name];
}
