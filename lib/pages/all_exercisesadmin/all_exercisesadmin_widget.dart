import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'all_exercisesadmin_model.dart';
export 'all_exercisesadmin_model.dart';

class AllExercisesadminWidget extends StatefulWidget {
  const AllExercisesadminWidget({
    Key? key,
    this.rourineId,
    this.srwRef,
    required this.user,
  }) : super(key: key);

  final DocumentReference? rourineId;
  final DocumentReference? srwRef;
  final DocumentReference? user;

  @override
  _AllExercisesadminWidgetState createState() =>
      _AllExercisesadminWidgetState();
}

class _AllExercisesadminWidgetState extends State<AllExercisesadminWidget>
    with TickerProviderStateMixin {
  late AllExercisesadminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllExercisesadminModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'allExercisesadmin'});
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
            logFirebaseEvent('ALL_EXERCISESADMIN_FloatingActionButton_');
            logFirebaseEvent('FloatingActionButton_navigate_to');
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed(
              'adminRoutine',
              queryParameters: {
                'routine': serializeParam(
                  widget.rourineId,
                  ParamType.DocumentReference,
                ),
                'userId': serializeParam(
                  widget.user,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).customColor4,
          icon: Icon(
            Icons.arrow_forward,
            color: FlutterFlowTheme.of(context).white,
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
                  borderRadius: 0.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  fillColor: FlutterFlowTheme.of(context).white,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).black600,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'ALL_EXERCISESADMIN_arrow_back_rounded_IC');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.safePop();
                  },
                ),
                title: Text(
                  'Add Exercise',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                actions: [],
                centerTitle: true,
                elevation: 1.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 24.0),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController',
                                                    Duration(milliseconds: 500),
                                                    () => setState(() {}),
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'search',
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBtnText,
                                                    prefixIcon: Icon(
                                                      Icons.search_sharp,
                                                      color: Color(0xFF57636C),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  maxLines: null,
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp(
                                                            '[a-zA-Z0-9]'))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ALL_EXERCISESADMIN_PAGE__BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_simple_search');
                                                  await queryAllexerciseRecordOnce()
                                                      .then(
                                                        (records) => _model
                                                                .simpleSearchResults =
                                                            TextSearch(
                                                          records
                                                              .map(
                                                                (record) =>
                                                                    TextSearchItem(
                                                                        record,
                                                                        [
                                                                      record
                                                                          .name!
                                                                    ]),
                                                              )
                                                              .toList(),
                                                        )
                                                                .search(_model
                                                                    .textController
                                                                    .text)
                                                                .map((r) =>
                                                                    r.object)
                                                                .toList(),
                                                      )
                                                      .onError((_, __) => _model
                                                              .simpleSearchResults =
                                                          [])
                                                      .whenComplete(() =>
                                                          setState(() {}));

                                                  logFirebaseEvent(
                                                      'Button_update_app_state');
                                                  FFAppState().update(() {
                                                    FFAppState().showFullList =
                                                        false;
                                                  });
                                                },
                                                text: '',
                                                icon: Icon(
                                                  Icons.search,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor4,
                                                  size: 20.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 50.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumFamily),
                                                          ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ALL_EXERCISESADMIN_PAGE__BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_update_app_state');
                                                  FFAppState().update(() {
                                                    FFAppState().showFullList =
                                                        true;
                                                  });
                                                },
                                                text: '',
                                                icon: Icon(
                                                  Icons.cancel_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor4,
                                                  size: 20.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 50.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumFamily),
                                                          ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().showFullList)
                        StreamBuilder<List<AllexerciseRecord>>(
                          stream: queryAllexerciseRecord(
                            queryBuilder: (allexerciseRecord) =>
                                allexerciseRecord.orderBy('name'),
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
                            List<AllexerciseRecord>
                                listViewAllexerciseRecordList = snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewAllexerciseRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewAllexerciseRecord =
                                    listViewAllexerciseRecordList[
                                        listViewIndex];
                                return StreamBuilder<SuraWorkoutRecord>(
                                  stream: SuraWorkoutRecord.getDocument(
                                      widget.rourineId!),
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
                                    final columnSuraWorkoutRecord =
                                        snapshot.data!;
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 12.0),
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
                                                  color: Colors.white,
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
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (columnSuraWorkoutRecord
                                                            .exercisesDone
                                                            .contains(
                                                                listViewAllexerciseRecord
                                                                    .reference) ==
                                                        false)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 30.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'ALL_EXERCISESADMIN_PAGE_add_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');

                                                          await columnSuraWorkoutRecord
                                                              .reference
                                                              .update({
                                                            'exercisesDone':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              listViewAllexerciseRecord
                                                                  .reference
                                                            ]),
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');

                                                          var adminEirRecordReference =
                                                              AdminEirRecord
                                                                  .createDoc(widget
                                                                      .rourineId!);
                                                          await adminEirRecordReference
                                                              .set(
                                                                  createAdminEirRecordData(
                                                            uid: widget.user,
                                                            exId:
                                                                listViewAllexerciseRecord
                                                                    .reference,
                                                            workoutId: widget
                                                                .rourineId,
                                                          ));
                                                          _model.eIR = AdminEirRecord
                                                              .getDocumentFromData(
                                                                  createAdminEirRecordData(
                                                                    uid: widget
                                                                        .user,
                                                                    exId: listViewAllexerciseRecord
                                                                        .reference,
                                                                    workoutId:
                                                                        widget
                                                                            .rourineId,
                                                                  ),
                                                                  adminEirRecordReference);
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');

                                                          await widget
                                                              .rourineId!
                                                              .update({
                                                            'exercises':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              _model.eIR!
                                                                  .reference
                                                            ]),
                                                          });

                                                          setState(() {});
                                                        },
                                                      ),
                                                    if (columnSuraWorkoutRecord
                                                            .exercisesDone
                                                            .contains(
                                                                listViewAllexerciseRecord
                                                                    .reference) ==
                                                        true)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .minus,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'ALL_EXERCISESADMIN_PAGE_minus_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');

                                                          await columnSuraWorkoutRecord
                                                              .reference
                                                              .update({
                                                            'exercisesDone':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              listViewAllexerciseRecord
                                                                  .reference
                                                            ]),
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');

                                                          await widget
                                                              .rourineId!
                                                              .update({
                                                            'exercises':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              _model.eIR!
                                                                  .reference
                                                            ]),
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');
                                                          await _model
                                                              .eIR!.reference
                                                              .delete();
                                                        },
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  12.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child: Text(
                                                              listViewAllexerciseRecord
                                                                  .name,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor4,
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      if (!FFAppState().showFullList)
                        Builder(
                          builder: (context) {
                            final searched =
                                _model.simpleSearchResults.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: searched.length,
                              itemBuilder: (context, searchedIndex) {
                                final searchedItem = searched[searchedIndex];
                                return StreamBuilder<SuraWorkoutRecord>(
                                  stream: SuraWorkoutRecord.getDocument(
                                      widget.rourineId!),
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
                                    final columnSuraWorkoutRecord =
                                        snapshot.data!;
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 12.0),
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
                                                  color: Colors.white,
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
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (columnSuraWorkoutRecord
                                                            .exercisesDone
                                                            .contains(searchedItem
                                                                .reference) ==
                                                        false)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 30.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'ALL_EXERCISESADMIN_PAGE_add_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');

                                                          await columnSuraWorkoutRecord
                                                              .reference
                                                              .update({
                                                            'exercisesDone':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              searchedItem
                                                                  .reference
                                                            ]),
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');

                                                          var adminEirRecordReference =
                                                              AdminEirRecord
                                                                  .createDoc(widget
                                                                      .rourineId!);
                                                          await adminEirRecordReference
                                                              .set(
                                                                  createAdminEirRecordData(
                                                            uid: widget.user,
                                                            exId: searchedItem
                                                                .reference,
                                                            workoutId: widget
                                                                .rourineId,
                                                          ));
                                                          _model.eI = AdminEirRecord
                                                              .getDocumentFromData(
                                                                  createAdminEirRecordData(
                                                                    uid: widget
                                                                        .user,
                                                                    exId: searchedItem
                                                                        .reference,
                                                                    workoutId:
                                                                        widget
                                                                            .rourineId,
                                                                  ),
                                                                  adminEirRecordReference);
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');

                                                          await widget
                                                              .rourineId!
                                                              .update({
                                                            'exercises':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              _model
                                                                  .eI!.reference
                                                            ]),
                                                          });

                                                          setState(() {});
                                                        },
                                                      ),
                                                    if (columnSuraWorkoutRecord
                                                            .exercisesDone
                                                            .contains(searchedItem
                                                                .reference) ==
                                                        true)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .minus,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'ALL_EXERCISESADMIN_PAGE_minus_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');

                                                          await columnSuraWorkoutRecord
                                                              .reference
                                                              .update({
                                                            'exercisesDone':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              searchedItem
                                                                  .reference
                                                            ]),
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');

                                                          await widget
                                                              .rourineId!
                                                              .update({
                                                            'exercises':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              _model
                                                                  .eI!.reference
                                                            ]),
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');
                                                          await _model
                                                              .eI!.reference
                                                              .delete();
                                                        },
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  12.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child: Text(
                                                              searchedItem.name,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor4,
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
