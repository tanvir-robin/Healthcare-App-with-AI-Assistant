import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care_ex/src/model/dactor_model.dart';
import 'package:health_care_ex/src/theme/extention.dart';
import 'package:health_care_ex/src/theme/light_color.dart';
import 'package:health_care_ex/src/theme/text_styles.dart';

// ignore: must_be_immutable
class BookAppointmentPage extends StatefulWidget {
  BookAppointmentPage({Key? key, required this.doctor}) : super(key: key);
  DoctorModel doctor;

  @override
  _BookAppointmentPageState createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  TextEditingController dateTimeController = TextEditingController();
  DateTime? selectedDateTime;

  @override
  void dispose() {
    dateTimeController.dispose();
    super.dispose();
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          dateTimeController.text =
              "${"${pickedDate.toLocal()}".split(' ')[0]} ${pickedTime.format(context)}";
        });
      }
    }
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(color: Theme.of(context).primaryColor),
        Text(
          'Book Appointment',
          style: TextStyles.title.bold,
        ),
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: LightColor.grey,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.extraLightBlue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _appbar(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(widget.doctor.image),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Health is your property',
                          style: GoogleFonts.dancingScript(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.doctor.name,
                    style: TextStyles.title.copyWith(fontSize: 25).bold,
                  ),
                  Text(widget.doctor.type,
                      style: TextStyles.title.copyWith(fontSize: 15).bold),
                  Text(
                    widget.doctor.description,
                    style: TextStyles.bodySm.subTitleColor,
                  ),
                  const Divider(thickness: 1, color: LightColor.grey),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Details',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: LightColor.lightGrey,
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: dateTimeController,
                    decoration: InputDecoration(
                      labelText: 'Select Date & Time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: LightColor.lightGrey,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectDateTime(context),
                      ),
                    ),
                    readOnly: true,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Additional Information',
                    style: TextStyles.bodySm.subTitleColor,
                  ),
                  Text(
                    'Please arrive 10 minutes early to fill out any necessary paperwork.',
                    style: TextStyles.bodySm.subTitleColor,
                  ),
                  Text(
                    'Cancellation policy: Please notify us at least 24 hours in advance if you need to cancel or reschedule your appointment.',
                    style: TextStyles.bodySm.subTitleColor.bold,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LightColor.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyles.bodySm,
                    ),
                    onPressed: () {
                      // Handle appointment booking logic
                    },
                    child: Text(
                      'Book Appointment',
                      style: TextStyles.titleNormal.white,
                    ).p(10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
