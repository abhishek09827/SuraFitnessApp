import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet_biceps/bottom_sheet_biceps_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextBicepsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for set widget.
  TextEditingController? setController;
  String? Function(BuildContext, String?)? setControllerValidator;
  // State field(s) for rep widget.
  TextEditingController? repController;
  String? Function(BuildContext, String?)? repControllerValidator;
  // State field(s) for kgs widget.
  TextEditingController? kgsController;
  String? Function(BuildContext, String?)? kgsControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WBicepsRecord? chetsWork;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    setController?.dispose();
    repController?.dispose();
    kgsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
