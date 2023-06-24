import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'icon_model.dart';
export 'icon_model.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({Key? key}) : super(key: key);

  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  late IconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconModel());

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

    return Stack(
      children: [
        if (FFAppState().iconClick == false)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
            child: StreamBuilder<List<TweetsRecord>>(
              stream: queryTweetsRecord(
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: SpinKitFadingFour(
                        color: Color(0xFF023960),
                        size: 40.0,
                      ),
                    ),
                  );
                }
                List<TweetsRecord> iconTweetsRecordList = snapshot.data!;
                final iconTweetsRecord = iconTweetsRecordList.isNotEmpty
                    ? iconTweetsRecordList.first
                    : null;
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('ICON_COMP_Icon_lqmu3fzy_ON_TAP');
                    logFirebaseEvent('Icon_backend_call');

                    await iconTweetsRecord!.reference.update({
                      'liked': FieldValue.increment(1),
                      'liked_by': FieldValue.arrayUnion([currentUserReference]),
                    });
                  },
                  child: FaIcon(
                    FontAwesomeIcons.handsWash,
                    color: valueOrDefault<Color>(
                      iconTweetsRecord!.likedBy.contains(currentUserReference)
                          ? FlutterFlowTheme.of(context).customColor3
                          : FlutterFlowTheme.of(context).black600,
                      FlutterFlowTheme.of(context).black600,
                    ),
                    size: 28.0,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
