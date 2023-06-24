import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/sets/sets_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'routine_model.dart';
export 'routine_model.dart';

class RoutineWidget extends StatefulWidget {
  const RoutineWidget({
    Key? key,
    this.routine,
    this.eirID,
  }) : super(key: key);

  final DocumentReference? routine;
  final DocumentReference? eirID;

  @override
  _RoutineWidgetState createState() => _RoutineWidgetState();
}

class _RoutineWidgetState extends State<RoutineWidget> {
  late RoutineModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoutineModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'routine'});
    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).white,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            logFirebaseEvent('ROUTINE_FloatingActionButton_4uuz68c0_ON');
            logFirebaseEvent('FloatingActionButton_navigate_to');
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed(
              'allExercise',
              queryParameters: {
                'rourineId': serializeParam(
                  widget.routine,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.rightToLeft,
                ),
              },
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).black600,
          icon: Icon(
            Icons.add,
          ),
          elevation: 8.0,
          label: Container(),
        ),
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).white,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 20.0,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('ROUTINE_PAGE_close_rounded_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed('workout');
                  },
                ),
                title: Text(
                  'Create Routine',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<WorkoutsRecord>(
                          stream: WorkoutsRecord.getDocument(widget.routine!),
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
                            final columnWorkoutsRecord = snapshot.data!;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  StreamBuilder<WorkoutsRecord>(
                                    stream: WorkoutsRecord.getDocument(
                                        widget.routine!),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 60.0,
                                            icon: Icon(
                                              Icons.not_started_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 25.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ROUTINE_not_started_rounded_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                'routineStart',
                                                queryParameters: {
                                                  'routine': serializeParam(
                                                    rowWorkoutsRecord.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
                                                },
                                              );
                                            },
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 60.0,
                                            icon: Icon(
                                              Icons.save,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 25.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ROUTINE_PAGE_save_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_backend_call');

                                              await rowWorkoutsRecord.reference
                                                  .update(
                                                      createWorkoutsRecordData(
                                                routineName:
                                                    _model.textController.text,
                                                uid: currentUserReference,
                                              ));
                                              logFirebaseEvent(
                                                  'IconButton_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                'workoutCopy2',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 20.0, 20.0, 20.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Routine Title',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: StreamBuilder<
                                        List<ExercisesInRoutineRecord>>(
                                      stream: queryExercisesInRoutineRecord(
                                        parent: columnWorkoutsRecord.reference,
                                        queryBuilder:
                                            (exercisesInRoutineRecord) =>
                                                exercisesInRoutineRecord
                                                    .where('workoutId',
                                                        isEqualTo:
                                                            widget.routine)
                                                    .where('uid',
                                                        isEqualTo:
                                                            currentUserReference),
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
                                        List<ExercisesInRoutineRecord>
                                            listViewExercisesInRoutineRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewExercisesInRoutineRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewExercisesInRoutineRecord =
                                                listViewExercisesInRoutineRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  AllexerciseRecord>(
                                                future: AllexerciseRecord
                                                    .getDocumentOnce(
                                                        listViewExercisesInRoutineRecord
                                                            .exId!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        child:
                                                            SpinKitFadingFour(
                                                          color:
                                                              Color(0xFF023960),
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final containerAllexerciseRecord =
                                                      snapshot.data!;
                                                  return Material(
                                                    color: Colors.transparent,
                                                    elevation: 5.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              StreamBuilder<
                                                                  ExercisesInRoutineRecord>(
                                                                stream: ExercisesInRoutineRecord
                                                                    .getDocument(
                                                                        listViewExercisesInRoutineRecord
                                                                            .reference),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        child:
                                                                            SpinKitFadingFour(
                                                                          color:
                                                                              Color(0xFF023960),
                                                                          size:
                                                                              40.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final columnExercisesInRoutineRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 30.0,
                                                                                borderWidth: 1.0,
                                                                                buttonSize: 60.0,
                                                                                fillColor: FlutterFlowTheme.of(context).white,
                                                                                icon: Icon(
                                                                                  Icons.cancel,
                                                                                  color: FlutterFlowTheme.of(context).customColor3,
                                                                                  size: 20.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('ROUTINE_PAGE_cancel_ICN_ON_TAP');
                                                                                  logFirebaseEvent('IconButton_backend_call');
                                                                                  await columnExercisesInRoutineRecord.reference.delete();
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      containerAllexerciseRecord.name,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 27.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('ROUTINE_PAGE_Icon_uumqny73_ON_TAP');
                                                                                  logFirebaseEvent('Icon_bottom_sheet');
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.white,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                          child: Container(
                                                                                            height: MediaQuery.of(context).size.height * 0.3,
                                                                                            child: SetsWidget(
                                                                                              exeNamee: columnExercisesInRoutineRecord.reference,
                                                                                              exeName: containerAllexerciseRecord.reference,
                                                                                              routineID: widget.routine,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.add,
                                                                                  color: Colors.black,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      if (columnExercisesInRoutineRecord
                                                                              .setRep
                                                                              .length !=
                                                                          0)
                                                                        StreamBuilder<
                                                                            List<SetRepRecord>>(
                                                                          stream:
                                                                              querySetRepRecord(
                                                                            parent:
                                                                                currentUserReference,
                                                                            queryBuilder: (setRepRecord) =>
                                                                                setRepRecord.where('eirId', isEqualTo: columnExercisesInRoutineRecord.reference).where('workoutId', isEqualTo: widget.routine),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<SetRepRecord>
                                                                                listViewSetRepRecordList =
                                                                                snapshot.data!;
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewSetRepRecordList.length,
                                                                              itemBuilder: (context, listViewIndex) {
                                                                                final listViewSetRepRecord = listViewSetRepRecordList[listViewIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      Text(
                                                                                        listViewSetRepRecord.set.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                      Text(
                                                                                        listViewSetRepRecord.reps.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                      Text(
                                                                                        listViewSetRepRecord.kg.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                      FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 30.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 50.0,
                                                                                        icon: Icon(
                                                                                          Icons.delete,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 25.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('ROUTINE_PAGE_delete_ICN_ON_TAP');
                                                                                          logFirebaseEvent('IconButton_backend_call');
                                                                                          await listViewSetRepRecord.reference.delete();
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
