import 'package:flutter/material.dart';
import 'package:speechth/src/config/validationform.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/fields/drop_search_list.dart';

class Gender extends StatefulWidget {
  final TextEditingController value;

  const Gender({super.key, required this.value});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  final List<String> _genders = const ["ذكر", "انثي"];

  @override
  Widget build(BuildContext context) {

    return AppDropList(
      list: _genders,
      labelText: "النوع",
      value: widget.value.text.isEmpty ? null : widget.value.text,
      validator: ValidationForm.genderValidator,

      onChanged: (v) {
        setState(() {
          widget.value.text = v ?? '';
        });
      },
    );
  }
}
