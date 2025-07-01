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
            margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
            color: AppStyle.appBarNavBarCardAndCanvasColor,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                      child: SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          style: AppStyle.primaryElevatedButtonStyle(),
                          onPressed: () {
                            _signatureController.clear();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.clear,
                          ),
                        ),
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: AppStyle.headingText,
                      AppLocalizations.of(context)!.signHereText,
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          style: AppStyle.primaryElevatedButtonStyle(),
                          onPressed: () {
                            _saveSignature();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.done,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Signature(
                controller: _signatureController,
                backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
