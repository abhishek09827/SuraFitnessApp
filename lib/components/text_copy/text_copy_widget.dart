import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_copy_model.dart';
export 'text_copy_model.dart';

class TextCopyWidget extends StatefulWidget {
  const TextCopyWidget({
    Key? key,
    this.exeId,
    this.routineId,
    this.srwRef,
  }) : super(key: key);

  final DocumentReference? exeId;
  final DocumentReference? routineId;
  final DocumentReference? srwRef;

  @override
  _TextCopyWidgetState createState() => _TextCopyWidgetState();
}

class _TextCopyWidgetState extends State<TextCopyWidget> {
  late TextCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextCopyModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 8.0),
      child: StreamBuilder<AllexerciseRecord>(
        stream: AllexerciseRecord.getDocument(widget.exeId!),
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
          final containerAllexerciseRecord = snapshot.data!;
          return Container(
            width: 409.3,
            decoration: BoxDecoration(
              color: Color(0xFF101213),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 1.0),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: Color(0xFF22282F),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowWebView(
                  content: widget.exeId!.id,
                  bypass: false,
                  height: 200.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    containerAllexerciseRecord.name,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleMediumFamily),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                  child: Text(
                    containerAllexerciseRecord.description,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF95A1AC),
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                  ),
                ),
                Container(
                  width: 452.0,
                  height: 42.1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).customColor4,
                  ),
                  child: StreamBuilder<WorkoutsRecord>(
                    stream: WorkoutsRecord.getDocument(widget.routineId!),
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
                      final rowWorkoutsRecord = snapshot.data!;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TEXT_COPY_COMP_Text_j2bx2hwe_ON_TAP');
                              logFirebaseEvent('Text_backend_call');

                              var exercisesInRoutineRecordReference =
                                  ExercisesInRoutineRecord.createDoc(
                                      widget.routineId!);
                              await exercisesInRoutineRecordReference.set({
                                ...createExercisesInRoutineRecordData(
                                  uid: currentUserReference,
                                  exId: widget.exeId,
                                ),
                                'srw': [widget.srwRef],
                              });
                              _model.eIR =
                                  ExercisesInRoutineRecord.getDocumentFromData({
                                ...createExercisesInRoutineRecordData(
                                  uid: currentUserReference,
                                  exId: widget.exeId,
                                ),
                                'srw': [widget.srwRef],
                              }, exercisesInRoutineRecordReference);
                              logFirebaseEvent('Text_backend_call');

                              await widget.routineId!.update({
                                'exercises': FieldValue.arrayUnion(
                                    [_model.eIR!.reference]),
                              });

                              setState(() {});
                            },
                            child: Text(
                              'Choose Workout',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TEXT_COPY_COMP_Text_qefp7v2m_ON_TAP');
                              logFirebaseEvent('Text_backend_call');
                              await _model.eIR!.reference.delete();
                              logFirebaseEvent('Text_backend_call');

                              await widget.routineId!.update({
                                'exercises': FieldValue.arrayRemove(
                                    [_model.eIR!.reference]),
                              });
                            },
                            child: Text(
                              'Remove',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
