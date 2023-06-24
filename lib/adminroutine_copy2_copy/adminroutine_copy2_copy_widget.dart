import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'adminroutine_copy2_copy_model.dart';
export 'adminroutine_copy2_copy_model.dart';

class AdminroutineCopy2CopyWidget extends StatefulWidget {
  const AdminroutineCopy2CopyWidget({
    Key? key,
    this.allWork,
    this.srw,
    this.routine,
    required this.user,
  }) : super(key: key);

  final DocumentReference? allWork;
  final DocumentReference? srw;
  final DocumentReference? routine;
  final DocumentReference? user;

  @override
  _AdminroutineCopy2CopyWidgetState createState() =>
      _AdminroutineCopy2CopyWidgetState();
}

class _AdminroutineCopy2CopyWidgetState
    extends State<AdminroutineCopy2CopyWidget> {
  late AdminroutineCopy2CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminroutineCopy2CopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'adminroutineCopy2Copy'});
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
            logFirebaseEvent('ADMINROUTINE_COPY2_COPY_FloatingActionBu');
            logFirebaseEvent('FloatingActionButton_navigate_to');
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed(
              'chest',
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
                    logFirebaseEvent(
                        'ADMINROUTINE_COPY2_COPY_close_rounded_IC');
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed('workout');
                  },
                ),
                title: Text(
                  'My Routine',
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
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: StreamBuilder<List<SuraWorkoutRecord>>(
                                  stream: querySuraWorkoutRecord(
                                    queryBuilder: (suraWorkoutRecord) =>
                                        suraWorkoutRecord
                                            .where('uid',
                                                isEqualTo: widget.user)
                                            .orderBy('created_at'),
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
                                    List<SuraWorkoutRecord>
                                        listViewSuraWorkoutRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewSuraWorkoutRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewSuraWorkoutRecord =
                                            listViewSuraWorkoutRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 8.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ADMINROUTINE_COPY2_COPY_Container_sbxrw1');
                                              logFirebaseEvent(
                                                  'Container_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                'adminRoutine',
                                                queryParameters: {
                                                  'userId': serializeParam(
                                                    widget.user,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'routine': serializeParam(
                                                    listViewSuraWorkoutRecord
                                                        .reference,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
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
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        60.0,
                                                                    fillColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .white,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor3,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'ADMINROUTINE_COPY2_COPY_cancel_ICN_ON_TA');
                                                                      logFirebaseEvent(
                                                                          'IconButton_backend_call');
                                                                      await listViewSuraWorkoutRecord
                                                                          .reference
                                                                          .delete();
                                                                    },
                                                                  ),
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
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            listViewSuraWorkoutRecord.routineName,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                          Text(
                                                                            listViewSuraWorkoutRecord.createdAt!.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  fontSize: 9.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
