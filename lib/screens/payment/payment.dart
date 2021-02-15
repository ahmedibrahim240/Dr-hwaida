import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Payment'),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
          addCard(
            context: context,
            onTap: () {
              showSettingsPanel(
                context: context,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  children: [
                    Center(
                      child: Text(
                        'Payment Method',
                        style: AppTheme.heading.copyWith(
                          color: customColor,
                        ),
                      ),
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration:
                                conectedTextFormStyle(lableText: 'Card Number'),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: conectedTextFormStyle(lableText: 'CVV'),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                minTime: new DateTime(1900),
                                onChanged: (date) {
                                  print('change $date in time zone ' +
                                      date.timeZoneOffset.inHours.toString());
                                },
                                onConfirm: (date) {
                                  // setState(() {
                                  //   _chossenDate = "${date.day}/${date.month}/${date.year}";
                                  // });
                                  print('confirm $date');
                                },
                                currentTime: DateTime.now(),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                border: Border.all(color: customColor),
                              ),
                              child: Text(
                                'Expiry Date',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: CustomButtonWithchild(
              color: customColor,
              onPress: () {},
              child: Text(
                'Confirm',
                style: AppTheme.heading.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
