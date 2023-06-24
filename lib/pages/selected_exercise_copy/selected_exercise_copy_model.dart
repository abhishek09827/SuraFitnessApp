import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet10_copy2_copy/bottom_sheet10_copy2_copy_widget.dart';
import '/components/bottom_sheet_abs/bottom_sheet_abs_widget.dart';
import '/components/bottom_sheet_back/bottom_sheet_back_widget.dart';
import '/components/bottom_sheet_biceps/bottom_sheet_biceps_widget.dart';
import '/components/bottom_sheet_others/bottom_sheet_others_widget.dart';
import '/components/bottom_sheet_should/bottom_sheet_should_widget.dart';
import '/components/bottom_sheet_triceps/bottom_sheet_triceps_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectedExerciseCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
