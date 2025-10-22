import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DatetimeProvider with ChangeNotifier {
  String? _toDayDate;
  String? _FormateDate;
  String? get ToDayDate => _toDayDate;
  String? get FormateDate => _FormateDate;
  Date() {
    _Updatetime();
  }

  void _Updatetime() {
    DateTime Now = DateTime.now();
    _toDayDate = DateFormat("EEEE").format(Now);
    _FormateDate = DateFormat('dd MMMM').format(Now);
    notifyListeners();
  }


}
