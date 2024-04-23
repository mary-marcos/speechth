import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Functions{
  static Future<String> pickDate(BuildContext context)async{
    String? formattedDate;
    int selectedDate = DateTime.now().year - 1;
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(selectedDate),
        firstDate: DateTime(selectedDate - 15),

        lastDate: DateTime(selectedDate));

    if (pickedDate != null) {
       formattedDate = DateFormat('dd/MM/yyyy', 'en').format(pickedDate);
    }
    return formattedDate??"";
    }
}