import 'package:json_annotation/json_annotation.dart';

part 'blog.g.dart';

@JsonSerializable()
class Blog {
  String? title;
  String? body;

  Blog({this.title, this.body});

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);
}
