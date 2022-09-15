import 'package:example_hack2hire/res/gaps.dart';
import 'package:example_hack2hire/widget/my_button.dart';
import 'package:example_hack2hire/widget/my_text_field.dart';
import 'package:flutter/material.dart';

class SelectedSeats extends StatefulWidget {
  const SelectedSeats({Key? key}) : super(key: key);

  @override
  State<SelectedSeats> createState() => _SelectedSeatsState();
}

class _SelectedSeatsState extends State<SelectedSeats> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f203e),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff2e3350),
        title: const Text(
          "LIST SEATS",
          style: (TextStyle(fontSize: 18, height: 1.4)),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            MyTextField(
              controller: _nameController,
              hintText: "Your name",
              border: true,
              borderRadius: BorderRadius.circular(4),
              containerPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            ),
            AppGaps.vGap12,
            MyTextField(
              hintText: "Your Phone Number",
              controller: _phoneController,
              border: true,
              borderRadius: BorderRadius.circular(4),
              containerPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            ),
            AppGaps.vGap16,
            MyButton(
              onPressed: () {},
              text: "Search",
              radius: 6,
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(top: 32),
              child: ListView.builder(
                itemBuilder: (_, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff2e3350),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Text(
                      "S00${index + 1}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
