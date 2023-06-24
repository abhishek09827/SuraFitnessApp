import '/components/text_all_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetsCopyadminModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for textAllamin.
  late TextAllModel textAllaminModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textAllaminModel = createModel(context, () => TextAllModel());
  }

  void dispose() {
    textAllaminModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
