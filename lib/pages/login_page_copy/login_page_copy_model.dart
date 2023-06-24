import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress-login widget.
  TextEditingController? emailAddressLoginController;
  String? Function(BuildContext, String?)? emailAddressLoginControllerValidator;
  String? _emailAddressLoginControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for password-login widget.
  TextEditingController? passwordLoginController1;
  String? Function(BuildContext, String?)? passwordLoginController1Validator;
  String? _passwordLoginController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password-login widget.
  TextEditingController? passwordLoginController2;
  String? Function(BuildContext, String?)? passwordLoginController2Validator;
  String? _passwordLoginController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button-Login widget.
  FutureCustRecord? fcust;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailAddressLoginControllerValidator =
        _emailAddressLoginControllerValidator;
    passwordLoginController1Validator = _passwordLoginController1Validator;
    passwordLoginController2Validator = _passwordLoginController2Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailAddressLoginController?.dispose();
    passwordLoginController1?.dispose();
    passwordLoginController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
