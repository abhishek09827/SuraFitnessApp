import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'routine_start_model.dart';
export 'routine_start_model.dart';

class RoutineStartWidget extends StatefulWidget {
  const RoutineStartWidget({
    Key? key,
    this.allWork,
    this.srw,
    this.routine,
    this.eirID,
  }) : super(key: key);

  final DocumentReference? allWork;
  final DocumentReference? srw;
  final DocumentReference? routine;
  final DocumentReference? eirID;

  @override
  _RoutineStartWidgetState createState() => _RoutineStartWidgetState();
}

class _RoutineStartWidgetState extends State<RoutineStartWidget> {
  late RoutineStartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoutineStartModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'routineStart'});
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
        floatingActionButton: StreamBuilder<WorkoutsRecord>(
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
            final floatingActionButtonWorkoutsRecord = snapshot.data!;
            return FloatingActionButton.extended(
              onPressed: () async {
                logFirebaseEvent('ROUTINE_START_FloatingActionButton_tre7b');
                logFirebaseEvent('FloatingActionButton_backend_call');

                await floatingActionButtonWorkoutsRecord.reference.update({
                  ...createWorkoutsRecordData(
                    countUp: _model.timerMilliseconds.toDouble(),
                  ),
                  'donOn': FieldValue.arrayUnion([getCurrentTimestamp]),
                });
                logFirebaseEvent('FloatingActionButton_navigate_to');
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed(
                  'workoutCopy2',
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
                Icons.save,
              ),
              elevation: 8.0,
              label: Container(),
            );
          },
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
                    logFirebaseEvent('ROUTINE_START_close_rounded_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed('workout');
                  },
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
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowTimer(
                                initialTime: _model.timerMilliseconds,
                                getDisplayTime: (value) =>
                                    StopWatchTimer.getDisplayTime(value,
                                        milliSecond: false),
                                timer: _model.timerController,
                                updateStateInterval:
                                    Duration(milliseconds: 500),
                                onChanged: (value, displayTime, shouldUpdate) {
                                  _model.timerMilliseconds = value;
                                  _model.timerValue = displayTime;
                                  if (shouldUpdate) setState(() {});
                                },
                                textAlign: TextAlign.start,
                                style:
                                    FlutterFlowTheme.of(context).headlineLarge,
                              ),
                              Row(
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
                                      Icons.timer,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ROUTINE_START_PAGE_timer_ICN_ON_TAP');
                                      logFirebaseEvent('IconButton_timer');
                                      _model.timerController.onExecute
                                          .add(StopWatchExecute.start);
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.stop,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ROUTINE_START_PAGE_stop_ICN_ON_TAP');
                                      logFirebaseEvent('IconButton_timer');
                                      _model.timerController.onExecute
                                          .add(StopWatchExecute.stop);
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.restore,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ROUTINE_START_PAGE_restore_ICN_ON_TAP');
                                      logFirebaseEvent('IconButton_timer');
                                      _model.timerController.onExecute
                                          .add(StopWatchExecute.reset);
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: StreamBuilder<
                                    List<ExercisesInRoutineRecord>>(
                                  stream: queryExercisesInRoutineRecord(
                                    parent: widget.routine,
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
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewExercisesInRoutineRecord =
                                            listViewExercisesInRoutineRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 8.0),
                                          child:
                                              FutureBuilder<AllexerciseRecord>(
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
                                                    child: SpinKitFadingFour(
                                                      color: Color(0xFF023960),
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
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                            MainAxisSize.max,
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
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    child:
                                                                        SpinKitFadingFour(
                                                                      color: Color(
                                                                          0xFF023960),
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (columnExercisesInRoutineRecord
                                                                          .setRep
                                                                          .length !=
                                                                      0)
                                                                    StreamBuilder<
                                                                        List<
                                                                            SetRepRecord>>(
                                                                      stream:
                                                                          querySetRepRecord(
                                                                        parent:
                                                                            currentUserReference,
                                                                        queryBuilder: (setRepRecord) => setRepRecord.where('eirId', isEqualTo: columnExercisesInRoutineRecord.reference).where(
                                                                            'workoutId',
                                                                            isEqualTo:
                                                                                widget.routine),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              listViewSetRepRecordList.length,
                                                                          itemBuilder:
                                                                              (context, listViewIndex) {
                                                                            final listViewSetRepRecord =
                                                                                listViewSetRepRecordList[listViewIndex];
                                                                            return Row(
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
                                                                                Theme(
                                                                                  data: ThemeData(
                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                      shape: CircleBorder(),
                                                                                    ),
                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).customColor3,
                                                                                  ),
                                                                                  child: Checkbox(
                                                                                    value: _model.checkboxValueMap[listViewSetRepRecord] ??= listViewSetRepRecord.done,
                                                                                    onChanged: (newValue) async {
                                                                                      setState(() => _model.checkboxValueMap[listViewSetRepRecord] = newValue!);
                                                                                      if (newValue!) {
                                                                                        logFirebaseEvent('ROUTINE_START_Checkbox_3lznlcou_ON_TOGGL');
                                                                                        logFirebaseEvent('Checkbox_backend_call');

                                                                                        await listViewSetRepRecord.reference.update(createSetRepRecordData(
                                                                                          done: _model.checkboxValueMap[listViewSetRepRecord],
                                                                                        ));
                                                                                      }
                                                                                    },
                                                                                    activeColor: FlutterFlowTheme.of(context).customColor1,
                                                                                  ),
                                                                                ),
                                                                              ],
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final chest = FFAppState().chest.toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: chest.length,
                                      itemBuilder: (context, chestIndex) {
                                        final chestItem = chest[chestIndex];
                                        return Container(
                                            width: 100,
                                            height: 100,
                                            color: Colors.green);
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 20.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Routine Title',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
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
                                    focusedErrorBorder: UnderlineInputBorder(
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
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
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
