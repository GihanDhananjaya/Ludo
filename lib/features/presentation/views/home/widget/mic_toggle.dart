import 'package:flutter/material.dart';

import '../../../../../utils/app_images.dart';

class MicToggle extends StatefulWidget {
  String title1;
  String title2;


  MicToggle({required this.title1, required this.title2});

  @override
  State<MicToggle> createState() => _MicToggleState();
}

class _MicToggleState extends State<MicToggle> {
  bool isMicOpen = true;

  void toggleMic() {
    setState(() {
      isMicOpen = !isMicOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: toggleMic,
              child: const Icon(Icons.chevron_left, color: Colors.white)),
          const SizedBox(width: 8),
          Text(
            isMicOpen ? widget.title1 : widget.title2,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(width: 8),
          GestureDetector(
              onTap: toggleMic,
              child: const Icon(Icons.chevron_right, color: Colors.white)),
        ],
      ),
    );
  }
}
