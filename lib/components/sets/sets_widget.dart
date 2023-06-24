import '/components/text_all_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sets_model.dart';
export 'sets_model.dart';

class SetsWidget extends StatefulWidget {
  const SetsWidget({
    Key? key,
    this.exeName,
    this.exeNamee,
    this.routineID,
  }) : super(key: key);

  final DocumentReference? exeName;
  final DocumentReference? exeNamee;
  final DocumentReference? routineID;

  @override
  _SetsWidgetState createState() => _SetsWidgetState();
}

class _SetsWidgetState extends State<SetsWidget> {
  late SetsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return wrapWithModel(
      model: _model.textAllModel,
      updateCallback: () => setState(() {}),
      child: TextAllWidget(
        exeName: widget.exeNamee,
        allExe: widget.routineID,
      ),
    );
  }
}
