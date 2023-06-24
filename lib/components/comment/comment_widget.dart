import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet10_copy2/bottom_sheet10_copy2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comment_model.dart';
export 'comment_model.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({
    Key? key,
    this.twee,
  }) : super(key: key);

  final DocumentReference? twee;

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  late CommentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentModel());

    _model.textController ??= TextEditingController();
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
      padding: EdgeInsetsDirectional.fromSTEB(30.0, 4.0, 5.0, 0.0),
      child: StreamBuilder<List<CommentsRecord>>(
        stream: queryCommentsRecord(
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
          List<CommentsRecord> commentCommentsRecordList = snapshot.data!;
          final commentCommentsRecord = commentCommentsRecordList.isNotEmpty
              ? commentCommentsRecordList.first
              : null;
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                  child: TextFormField(
                    controller: _model.textController,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Comment..',
                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).black600,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).white,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: null,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).textColor,
                borderRadius: 20.0,
                borderWidth: 0.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.send_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('COMMENT_COMP_send_sharp_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_backend_call');

                  var commentsRecordReference =
                      CommentsRecord.createDoc(currentUserReference!);
                  await commentsRecordReference.set(createCommentsRecordData(
                    name: _model.textController.text,
                    post: widget.twee,
                    createdAt: getCurrentTimestamp,
                    createdBy: currentUserReference,
                  ));
                  _model.comment = CommentsRecord.getDocumentFromData(
                      createCommentsRecordData(
                        name: _model.textController.text,
                        post: widget.twee,
                        createdAt: getCurrentTimestamp,
                        createdBy: currentUserReference,
                      ),
                      commentsRecordReference);
                  logFirebaseEvent('IconButton_backend_call');

                  await widget.twee!.update({
                    'comments':
                        FieldValue.arrayUnion([_model.comment!.reference]),
                  });
                  logFirebaseEvent('IconButton_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Color(0x00000000),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: BottomSheet10Copy2Widget(
                          comments: widget.twee,
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));

                  logFirebaseEvent('IconButton_clear_text_fields');
                  setState(() {
                    _model.textController?.clear();
                  });

                  setState(() {});
                },
              ),
              StreamBuilder<TweetsRecord>(
                stream: TweetsRecord.getDocument(widget.twee!),
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
                  final rowTweetsRecord = snapshot.data!;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          if (rowTweetsRecord.likedBy
                                  .contains(currentUserReference) ==
                              true)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'COMMENT_COMP_Icon_iapg8pny_ON_TAP');
                                logFirebaseEvent('Icon_backend_call');

                                await widget.twee!.update({
                                  'liked': FieldValue.increment(-(1)),
                                  'liked_by': FieldValue.arrayRemove(
                                      [currentUserReference]),
                                });
                              },
                              child: FaIcon(
                                FontAwesomeIcons.handsWash,
                                color:
                                    FlutterFlowTheme.of(context).customColor3,
                                size: 24.0,
                              ),
                            ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (valueOrDefault<bool>(
                            rowTweetsRecord.likedBy
                                    .contains(currentUserReference) ==
                                false,
                            true,
                          ))
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'COMMENT_COMP_Icon_u30w25ho_ON_TAP');
                                logFirebaseEvent('Icon_backend_call');

                                await widget.twee!.update({
                                  'liked': FieldValue.increment(1),
                                  'liked_by': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                });
                              },
                              child: FaIcon(
                                FontAwesomeIcons.handsWash,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
