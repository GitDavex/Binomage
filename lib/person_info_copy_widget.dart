import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:binomage/chemin_fichier_provider_b.dart';
import 'card_picture.dart';
import 'package:binomage/list_provider_b.dart';
import 'dart:typed_data';

class PersonInfoCopyWidget extends StatefulWidget {
  final CListNotifierB cListNotifier;

  const PersonInfoCopyWidget(this.cListNotifier, {super.key});

  @override
  _PersonInfoCopyWidgetState createState() => _PersonInfoCopyWidgetState();
}

class _PersonInfoCopyWidgetState extends State<PersonInfoCopyWidget> {
  Uint8List _imageUrl = Uint8List(1);
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final imagePathNotifier = Provider.of<ImagePathNotifierB>(context);

    return Material(
      color: Colors.transparent,
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: MediaQuery.sizeOf(context).height * 0.6,
        decoration: BoxDecoration(
          color: const Color(0x71FFFFFF),
          borderRadius: BorderRadius.circular(21),
          border: Border.all(
            color: const Color(0xFF1C4F80),
            width: 7,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Container(
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.memory(_imageUrl, fit: BoxFit.cover),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                final pickedFile = await picker.pickImage(
                  source: ImageSource.gallery, // ou ImageSource.camera
                );

                if (pickedFile != null) {
                  final bytes = await pickedFile.readAsBytes();
                  setState(() {
                    _imageUrl = bytes;
                  });
                }
              },
              text: 'Charger image',
              options: FFButtonOptions(
                height: 40,
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: const Color(0xFF1C4F80),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                elevation: 3,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            FlutterFlowIconButton(
              borderColor: const Color(0xFF1C4F80),
              borderRadius: 20,
              borderWidth: 1,
              buttonSize: 43,
              fillColor: const Color(0xFF1C4F80),
              hoverColor: FlutterFlowTheme.of(context).secondaryBackground,
              hoverIconColor: const Color(0xFF1C4F80),
              icon: Icon(
                Icons.check_circle_outlined,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 24,
              ),
              showLoadingIndicator: true,
              onPressed: () {
                imagePathNotifier.updateImagePath(_imageUrl);
                widget.cListNotifier.addToC(
                  CardParrain(
                    imagePath: _imageUrl,
                  ),
                );
                widget.cListNotifier.share(_imageUrl);
              },
            ),
          ],
        ),
      ),
    );
  }
}
