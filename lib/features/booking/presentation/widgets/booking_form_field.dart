import 'package:flutter/material.dart';

class BookingFormField extends StatelessWidget {
  final String title;

  final String hint;
  final String initialValue;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  const BookingFormField({
    super.key,
    required this.title,
    required this.hint,
    required this.initialValue,
    required this.keyboardType,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 8,),
          Directionality(
            textDirection: TextDirection.rtl, 
            child: TextFormField(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              initialValue: initialValue,
              keyboardType: keyboardType,
              validator: validator,
              onSaved: onSaved,
              decoration: InputDecoration(
                hintText: hint
              ),


            ))
      ],
    );
  }
}
