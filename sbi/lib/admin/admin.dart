import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:sbi/pages/admin/modal.dart';

final userProvider =
    StateProvider<UserData?>((ref) => null); // Define userProvider here

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access user information from the provider
    final user = context.read(userProvider).state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'User Information:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (user != null)
              Column(
                children: [
                  Text('Name: ${user.fullName}'),
                  Text('Phone Number: ${user.phoneNumber}'),
                ],
              )
            else
              Text('No user information available'),
          ],
        ),
      ),
    );
  }
}
