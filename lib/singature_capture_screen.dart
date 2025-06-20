import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:syncserve/theme/styles.dart';

class SingatureCaptureScreen extends StatefulWidget {
  const SingatureCaptureScreen({super.key});

  @override
  State<SingatureCaptureScreen> createState() => _SingatureCaptureScreenState();
}

class _SingatureCaptureScreenState extends State<SingatureCaptureScreen> {
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
  );

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  Future<void> _saveSignature() async {
    final image = await _signatureController.toPngBytes();
    if (image != null) {
      Navigator.pop(context, image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 120, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        _signatureController.clear();
                      },
                      child: Text(
                        'Clear',
                      ),
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    style: AppStyle.headingText,
                    'Sign Here',
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        _saveSignature();
                      },
                      child: Text(
                        'Done',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Signature(
              controller: _signatureController,
              backgroundColor: Colors.grey,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
