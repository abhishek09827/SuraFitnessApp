import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chats/chats_widget.dart';
import '/components/post/post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatPageCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for chats component.
  late ChatsModel chatsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chatsModel = createModel(context, () => ChatsModel());
  }

  void dispose() {
    chatsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
