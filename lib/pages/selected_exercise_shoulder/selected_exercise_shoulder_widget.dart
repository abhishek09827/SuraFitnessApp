import '/backend/backend.dart';
import '/components/bottom_sheet_should/bottom_sheet_should_widget.dart';
import '/components/text_shoulder/text_shoulder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'selected_exercise_shoulder_model.dart';
export 'selected_exercise_shoulder_model.dart';

class SelectedExerciseShoulderWidget extends StatefulWidget {
  const SelectedExerciseShoulderWidget({
    Key? key,
    this.chestWork,
  }) : super(key: key);

  final DocumentReference? chestWork;

  @override
  _SelectedExerciseShoulderWidgetState createState() =>
      _SelectedExerciseShoulderWidgetState();
}

class _SelectedExerciseShoulderWidgetState
    extends State<SelectedExerciseShoulderWidget> {
  late SelectedExerciseShoulderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectedExerciseShoulderModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'selectedExerciseShoulder'});
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
            logFirebaseEvent('SELECTED_EXERCISE_SHOULDER_FloatingActio');
            logFirebaseEvent('FloatingActionButton_drawer');
            scaffoldKey.currentState!.openDrawer();
          },
          backgroundColor: FlutterFlowTheme.of(context).black600,
          icon: Icon(
            Icons.add,
          ),
          elevation: 8.0,
          label: Container(),
        ),
        drawer: Drawer(
          elevation: 16.0,
          child: Align(
            alignment: AlignmentDirectional(-0.2, 0.15),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.82,
                        height: 49.0,
                        decoration: BoxDecoration(),
                        child: Text(
                          'Add Exercise',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).black600,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineLargeFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.1, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SELECTED_EXERCISE_SHOULDER_CHEST_BTN_ON_');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'chest',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'Chest',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              textStyle:
                                  FlutterFlowTheme.of(context).titleLarge,
                              elevation: 5.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.1, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SELECTED_EXERCISE_SHOULDER_TRICEPS_BTN_O');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'triceps',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'Triceps',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              textStyle:
                                  FlutterFlowTheme.of(context).titleLarge,
                              elevation: 5.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.1, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 4.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SELECTED_EXERCISE_SHOULDER_ABS_BTN_ON_TA');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'abs',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'Abs',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              textStyle:
                                  FlutterFlowTheme.of(context).titleLarge,
                              elevation: 5.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.1, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SELECTED_EXERCISE_SHOULDER_BICEPS_BTN_ON');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'biceps',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'Biceps',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              textStyle:
                                  FlutterFlowTheme.of(context).titleLarge,
                              elevation: 5.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.1, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SELECTED_EXERCISE_SHOULDER_SHOULDER_BTN_');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'shoulders',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'Shoulder',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              textStyle:
                                  FlutterFlowTheme.of(context).titleLarge,
                              elevation: 5.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.1, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SELECTED_EXERCISE_SHOULDER_BACK_BTN_ON_T');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'back',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'Back',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              textStyle:
                                  FlutterFlowTheme.of(context).titleLarge,
                              elevation: 5.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.1, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SELECTED_EXERCISE_SHOULDER_LEGS_BTN_ON_T');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'Legs',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'Legs',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              textStyle:
                                  FlutterFlowTheme.of(context).titleLarge,
                              elevation: 5.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.1, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SELECTED_EXERCISE_SHOULDER_OTHERS_BTN_ON');
                              logFirebaseEvent('Button_navigate_to');
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                'others',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'Others',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              textStyle:
                                  FlutterFlowTheme.of(context).titleLarge,
                              elevation: 5.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
                    logFirebaseEvent(
                        'SELECTED_EXERCISE_SHOULDER_close_rounded');
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed('workout');
                  },
                ),
                title: Text(
                  'Shoulder Workouts',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Lottie.asset(
                    'assets/lottie_animations/68997-elmejorgym-icon.json',
                    height: 340.0,
                    fit: BoxFit.cover,
                    animate: true,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(290.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).lineColor,
                          borderRadius: 30.0,
                          borderWidth: 2.0,
                          buttonSize: 44.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.refresh_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'SELECTED_EXERCISE_SHOULDER_startTimer_ON');
                            logFirebaseEvent('startTimer_timer');
                            _model.timerController.onExecute
                                .add(StopWatchExecute.reset);
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 32.0, 0.0, 24.0),
                        child: FlutterFlowTimer(
                          initialTime: _model.timerMilliseconds,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                          ),
                          timer: _model.timerController,
                          onChanged: (value, displayTime, shouldUpdate) {
                            _model.timerMilliseconds = value;
                            _model.timerValue = displayTime;
                            if (shouldUpdate) setState(() {});
                          },
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).white,
                        borderRadius: 30.0,
                        borderWidth: 2.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.pause_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'SELECTED_EXERCISE_SHOULDER_pauseTimer_ON');
                          logFirebaseEvent('pauseTimer_timer');
                          _model.timerController.onExecute
                              .add(StopWatchExecute.stop);
                        },
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 30.0,
                        borderWidth: 2.0,
                        buttonSize: 60.0,
                        fillColor: FlutterFlowTheme.of(context).background,
                        icon: Icon(
                          Icons.play_arrow_rounded,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          size: 36.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'SELECTED_EXERCISE_SHOULDER_startTimer_ON');
                          logFirebaseEvent('startTimer_timer');
                          _model.timerController.onExecute
                              .add(StopWatchExecute.start);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final shoulders = FFAppState().shoulders.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: shoulders.length,
                                itemBuilder: (context, shouldersIndex) {
                                  final shouldersItem =
                                      shoulders[shouldersIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 8.0),
                                    child: FutureBuilder<ShouldersRecord>(
                                      future: ShouldersRecord.getDocumentOnce(
                                          shouldersItem),
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
                                        final containerShouldersRecord =
                                            snapshot.data!;
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SELECTED_EXERCISE_SHOULDER_Container_yos');
                                            logFirebaseEvent(
                                                'Container_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0x00000000),
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        BottomSheetShouldWidget(),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 5.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      30.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      60.0,
                                                                  fillColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .white,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .cancel,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor3,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SELECTED_EXERCISE_SHOULDER_cancel_ICN_ON');
                                                                    logFirebaseEvent(
                                                                        'IconButton_update_app_state');
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                          .removeFromShoulders(
                                                                              shouldersItem);
                                                                    });
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          containerShouldersRecord
                                                                              .name,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SELECTED_EXERCISE_SHOULDER_Icon_pa9t2e5d');
                                                                    logFirebaseEvent(
                                                                        'Icon_navigate_to');
                                                                    if (Navigator.of(
                                                                            context)
                                                                        .canPop()) {
                                                                      context
                                                                          .pop();
                                                                    }
                                                                    context
                                                                        .pushNamed(
                                                                      'edshoulders',
                                                                      queryParameters:
                                                                          {
                                                                        'docRef':
                                                                            serializeParam(
                                                                          containerShouldersRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        kTransitionInfoKey:
                                                                            TransitionInfo(
                                                                          hasTransition:
                                                                              true,
                                                                          transitionType:
                                                                              PageTransitionType.rightToLeft,
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .solidArrowAltCircleRight,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextShoulderWidget(
                                                                  key: Key(
                                                                      'Keych7_${shouldersIndex}_of_${shoulders.length}'),
                                                                  shoulders:
                                                                      containerShouldersRecord
                                                                          .reference,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
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
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
