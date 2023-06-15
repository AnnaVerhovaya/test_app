import 'package:flutter/material.dart';
import 'package:flutter_application_test_my_app/services/location.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:intl/intl.dart';
import 'package:location/location.dart' as loc;

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final _locationService = LocationService();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _locationService.getCityName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AppBar(title: const Text('Loading...'));
          }
          if (snapshot.hasData) {
            return AppBar(
              title: Row(
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/images/Stroke 3.png'),
                      Positioned(
                        top: 0,
                        bottom: 3,
                        left: 0,
                        right: 1,
                        child: Image.asset('assets/images/Stroke 1.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        DateFormat("dd.MM.yyyy").format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image.asset('assets/images/Frame 578.png'),
                ),
              ],
            );
          }
          return AppBar(title: const Text(''));
        });
  }
}
