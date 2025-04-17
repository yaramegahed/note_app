import 'package:hive/hive.dart';

part 'home_model.g.dart';
@HiveType(typeId: 0)
class HomeModel extends HiveObject{
  @HiveField(0)
   String title;
  @HiveField(1)
   String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int color;

  HomeModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
}
