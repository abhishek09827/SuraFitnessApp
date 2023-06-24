import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_copy_copy_model.dart';
export 'text_copy_copy_model.dart';

class TextCopyCopyWidget extends StatefulWidget {
  const TextCopyCopyWidget({Key? key}) : super(key: key);

  @override
  _TextCopyCopyWidgetState createState() => _TextCopyCopyWidgetState();
}

class _TextCopyCopyWidgetState extends State<TextCopyCopyWidget> {
  late TextCopyCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextCopyCopyModel());

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

    return Container();
  }
}
