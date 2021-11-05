import 'dart:async';

import 'package:flutter/services.dart';


Stream<String> fileFromAssets(String assetsPath) async* {
  yield await rootBundle.loadString(assetsPath).then((file) => file.toString());
}