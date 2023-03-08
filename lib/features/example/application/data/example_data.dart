
import 'package:freezed_annotation/freezed_annotation.dart';


part 'example_data.freezed.dart';


@freezed
class ExampleData with _$ExampleData {
  const factory ExampleData({
    String? exampleText,
    int ? exampleInt,
     double? exampleDouble,
    List<String>? listString
  }) = _ExampleData;

  factory ExampleData.empty() => ExampleData();



}
