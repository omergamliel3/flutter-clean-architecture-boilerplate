import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Entity extends Equatable {
  final String name;
  const Entity({
    @required this.name,
  });

  @override
  List<Object> get props => [name];
}
