import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet_should/bottom_sheet_should_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_shoulder_model.dart';
export 'text_shoulder_model.dart';

class TextShoulderWidget extends StatefulWidget {
  const TextShoulderWidget({
    Key? key,
    this.shoulders,
  }) : super(key: key);

  final DocumentReference? shoulders;

  @override
  _TextShoulderWidgetState createState() => _TextShoulderWidgetState();
}

class _TextShoulderWidgetState extends State<TextShoulderWidget> {
  late TextShoulderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextShoulderModel());

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
                  validator: _model.kgsControllerValidator.asValidator(context),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: Theme(
                data: ThemeData(
                  checkboxTheme: CheckboxThemeData(
                    shape: CircleBorder(),
                  ),
                  unselectedWidgetColor:
                      FlutterFlowTheme.of(context).customColor4,
                ),
                child: Checkbox(
                  value: _model.checkboxValue ??= false,
                  onChanged: (newValue) async {
                    setState(() => _model.checkboxValue = newValue!);
                  },
                  activeColor: FlutterFlowTheme.of(context).customColor1,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional(-0.05, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('TEXT_SHOULDER_COMP__BTN_ON_TAP');
                      logFirebaseEvent('Button_backend_call');

                      var wShouldersRecordReference =
                          WShouldersRecord.collection.doc();
                      await wShouldersRecordReference
                          .set(createWShouldersRecordData(
                        uid: currentUserReference,
                        set: int.tryParse(_model.setController.text),
                        reps: int.tryParse(_model.repController.text),
                        kg: int.tryParse(_model.kgsController.text),
                        done: _model.checkboxValue,
                        createdAt: getCurrentTimestamp,
                        shoulders: widget.shoulders,
                      ));
                      _model.chetsWork = WShouldersRecord.getDocumentFromData(
                          createWShouldersRecordData(
                            uid: currentUserReference,
                            set: int.tryParse(_model.setController.text),
                            reps: int.tryParse(_model.repController.text),
                            kg: int.tryParse(_model.kgsController.text),
                            done: _model.checkboxValue,
                            createdAt: getCurrentTimestamp,
                            shoulders: widget.shoulders,
                          ),
                          wShouldersRecordReference);
                      logFirebaseEvent('Button_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Color(0x00000000),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: BottomSheetShouldWidget(
                              chestWorkout: _model.chetsWork!.reference,
                              shoulders: widget.shoulders,
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));

                      logFirebaseEvent('Button_clear_text_fields');
                      setState(() {
                        _model.setController?.clear();
                        _model.repController?.clear();
                        _model.kgsController?.clear();
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
    );
  }
}
