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
import 'text_all_copy_model.dart';
export 'text_all_copy_model.dart';

class TextAllCopyWidget extends StatefulWidget {
  const TextAllCopyWidget({
    Key? key,
    this.allExe,
    this.exeName,
    required this.user,
  }) : super(key: key);

  final DocumentReference? allExe;
  final DocumentReference? exeName;
  final DocumentReference? user;

  @override
  _TextAllCopyWidgetState createState() => _TextAllCopyWidgetState();
}

class _TextAllCopyWidgetState extends State<TextAllCopyWidget> {
  late TextAllCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextAllCopyModel());

    _model.setController ??= TextEditingController();
    _model.repController ??= TextEditingController();
    _model.kgsController ??= TextEditingController();
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: TextFormField(
                  controller: _model.setController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Set',
                    hintStyle: FlutterFlowTheme.of(context).bodySmall,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).white,
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).white,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.number,
                  validator: _model.setControllerValidator.asValidator(context),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: TextFormField(
                  controller: _model.repController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Reps',
                    hintStyle: FlutterFlowTheme.of(context).bodySmall,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).white,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.number,
                  validator: _model.repControllerValidator.asValidator(context),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: TextFormField(
                  controller: _model.kgsController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Kgs',
                    hintStyle: FlutterFlowTheme.of(context).bodySmall,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).white,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.number,
                  validator: _model.kgsControllerValidator.asValidator(context),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-0.05, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('TEXT_ALL_COPY_COMP__BTN_ON_TAP');
                          logFirebaseEvent('Button_backend_call');

                          var adminSrwRecordReference =
                              AdminSrwRecord.createDoc(widget.allExe!);
                          await adminSrwRecordReference
                              .set(createAdminSrwRecordData(
                            uid: widget.user,
                            set: valueOrDefault<int>(
                              int.tryParse(_model.setController.text),
                              1,
                            ),
                            reps: valueOrDefault<int>(
                              int.tryParse(_model.repController.text),
                              0,
                            ),
                            kg: valueOrDefault<int>(
                              int.tryParse(_model.kgsController.text),
                              0,
                            ),
                            eirId: widget.exeName,
                            done: false,
                          ));
                          _model.srw = AdminSrwRecord.getDocumentFromData(
                              createAdminSrwRecordData(
                                uid: widget.user,
                                set: valueOrDefault<int>(
                                  int.tryParse(_model.setController.text),
                                  1,
                                ),
                                reps: valueOrDefault<int>(
                                  int.tryParse(_model.repController.text),
                                  0,
                                ),
                                kg: valueOrDefault<int>(
                                  int.tryParse(_model.kgsController.text),
                                  0,
                                ),
                                eirId: widget.exeName,
                                done: false,
                              ),
                              adminSrwRecordReference);
                          logFirebaseEvent('Button_backend_call');

                          await widget.exeName!.update({
                            ...createAdminEirRecordData(
                              uid: widget.user,
                            ),
                            'setRep':
                                FieldValue.arrayUnion([_model.srw!.reference]),
                          });

                          setState(() {});
                        },
                        text: '',
                        icon: Icon(
                          Icons.fitness_center_sharp,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: 50.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).white,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
