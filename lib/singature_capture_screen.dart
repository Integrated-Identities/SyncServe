import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    if (!mounted) return;
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
            margin: EdgeInsets.fromLTRB(30, 35, 0, 35),
            color: AppStyle.appBarNavBarCardAndCanvasColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Padding(
                    padding: AppStyle.customerApprovalDoneButtonPadding,
                    child: ElevatedButton(
                      style: AppStyle.primaryCanvasElevatedButtonStyle(),
                      onPressed: () {
                        _signatureController.clear();
                      },
                      child: Text(
                        style: AppStyle.elevatedButtonText,
                        AppLocalizations.of(context)!.clearElevatedButton,
                      ),
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    style: AppStyle.headingText,
                    AppLocalizations.of(context)!.signHereText,
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Padding(
                    padding: AppStyle.customerApprovalClearButtonPadding,
                    child: ElevatedButton(
                      style: AppStyle.primaryCanvasElevatedButtonStyle(),
                      onPressed: () {
                        _saveSignature();
                      },
                      child: Text(
                        style: AppStyle.elevatedButtonText,
                        AppLocalizations.of(context)!.doneElevatedButton,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 35, 40, 35),
              child: Signature(
                controller: _signatureController,
                backgroundColor: Colors.white,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
