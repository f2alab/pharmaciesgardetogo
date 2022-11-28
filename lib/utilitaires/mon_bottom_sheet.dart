import 'package:flutter/material.dart';

class MonBottomSheet extends StatefulWidget
{
  final Widget contenu;
  const MonBottomSheet({Key? key, required this.contenu}) : super(key: key);

  @override
  State<MonBottomSheet> createState() => _MonBottomSheetState();
}

class _MonBottomSheetState extends State<MonBottomSheet>
{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35)),
        color: Colors.white,
      ),
      child: widget.contenu
    );
  }
}
