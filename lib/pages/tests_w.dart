import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestWPage extends StatelessWidget {
  const TestWPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        width: 375.w,
        child: Container(
          width: 325.w,
          height: 100.h,
          padding: EdgeInsets.all(20.0),
          child: RichText(
            maxLines: 5,
            text: const TextSpan(
              text: "To make this RichText Selectable, "
                  "the RichText needs to be in the subtree of a SelectionArea"
                  " or SelectableRegion and a SelectionRegistrar needs to "
                  "be assigned to the RichText.selectionRegistrar. "
                  "One can use SelectionContainer.maybeOf to get the "
                  "SelectionRegistrar from a context. This enables users to "
                  "select the text in RichTexts with mice or touch events.",
              style: TextStyle(
                color: Colors.black,
                
              ),
            ),

          ),
        ),
      ),
    );
  }
}
