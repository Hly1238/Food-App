import 'package:hive/hive.dart';
// part 'trans.g.dart';

@HiveType(typeId: 0)
class Trans extends HiveObject {
  @HiveField(0)
  final String? item;
  @HiveField(1)
  final int? quantity;

  Trans({this.item, this.quantity});
}
