import 'package:Hotelino/features/booking/presentation/booking_provider.dart';
import 'package:Hotelino/features/booking/presentation/widgets/booking_form_field.dart';
import 'package:Hotelino/features/booking/presentation/widgets/date_picker_field.dart';
import 'package:Hotelino/features/booking/presentation/widgets/number_text_field.dart';
import 'package:Hotelino/features/booking/presentation/widgets/terms_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  static final GlobalKey<_BookingScreenState> bookingScreenKey = GlobalKey<_BookingScreenState>();
  BookingScreen({Key? key}):super(key: bookingScreenKey);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  void resetForm() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _formKey.currentState?.reset();
      TermsWidget.termsKey.currentState?.resetCheckbox();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'فرم رزرو هتل ها',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Consumer<BookingProvider>(
            builder: (context, bookingProvider, child) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookingFormField(
                      title: 'نام و نام خانوادگی',
                      hint: 'نام و نام خانوادگی خود را وارد کنید...',
                      initialValue: bookingProvider.booking.fullName,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "لطفا نام خود را کامل بنویسید";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setName(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    BookingFormField(
                      title: 'مقصد',
                      hint: 'مقصد خود را وارد کنید...',
                      initialValue: bookingProvider.booking.destination,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا مقصد خود را مشخص کنید';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setDestination(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    DatePickerField(
                      title: "تاریخ اقامت",
                      hint: 'بازه زمانی اقامت را انتخاب کنید',
                      initialValue: bookingProvider.booking.checkInOutRangeDate,
                      validator: (value) {
                        if (value == null) {
                          return "لطفا بازه زمانی را مشخص کنید";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setRangeDate(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    BookingFormField(
                      title: 'تعداد نفرات',
                      hint: 'تعداد نفرات خود را وارد کنید...',
                      initialValue: bookingProvider.booking.numberOfGuests,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "لطفا تعداد نفرات را وارد کنید";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setNumberOfGuests(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    NumberFormField(
                      initialValue: bookingProvider.booking.phoneNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "لطفا شماره تماس رابه درستی وارد کنید";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setPhoneNumber(newValue);
                        }
                      },
                    ),
                    TermsWidget(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
