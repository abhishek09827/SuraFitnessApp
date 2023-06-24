import '/components/chat2/chat2_widget.dart';
import '/components/post/post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyTweetsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for chat2 component.
  late Chat2Model chat2Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chat2Model = createModel(context, () => Chat2Model());
  }

  void dispose() {
    chat2Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
