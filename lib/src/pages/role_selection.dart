import 'package:flutter/material.dart';
import 'package:health_care_ex/src/pages/doctor_form.dart';
import 'package:health_care_ex/src/pages/patient_form.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Role'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PatientFormScreen(),
                ));
              },
              child: const Text('Patient'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DoctorFormScreen(),
                ));
              },
              child: const Text('Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}
