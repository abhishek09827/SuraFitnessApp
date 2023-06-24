import '/components/text_all_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sets_copyadmin_model.dart';
export 'sets_copyadmin_model.dart';

class SetsCopyadminWidget extends StatefulWidget {
  const SetsCopyadminWidget({
    Key? key,
    this.exeName,
    this.exeNamee,
    this.routineID,
  }) : super(key: key);

  final DocumentReference? exeName;
  final DocumentReference? exeNamee;
  final DocumentReference? routineID;

  @override
  _SetsCopyadminWidgetState createState() => _SetsCopyadminWidgetState();
}

class _SetsCopyadminWidgetState extends State<SetsCopyadminWidget> {
  late SetsCopyadminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetsCopyadminModel());

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
      model: _model.textAllaminModel,
      updateCallback: () => setState(() {}),
      child: TextAllWidget(
        exeName: widget.exeNamee,
        allExe: widget.routineID,
      ),
    );
  }
}
