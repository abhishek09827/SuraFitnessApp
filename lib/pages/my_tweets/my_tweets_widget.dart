import '/components/chat2/chat2_widget.dart';
import '/components/post/post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_tweets_model.dart';
export 'my_tweets_model.dart';

class MyTweetsWidget extends StatefulWidget {
  const MyTweetsWidget({Key? key}) : super(key: key);

  @override
  _MyTweetsWidgetState createState() => _MyTweetsWidgetState();
}

class _MyTweetsWidgetState extends State<MyTweetsWidget> {
  late MyTweetsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyTweetsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'myTweets'});
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).lineColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('MY_TWEETS_FloatingActionButton_uiah3blv_');
          logFirebaseEvent('FloatingActionButton_bottom_sheet');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Color(0x00000000),
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: PostWidget(),
              );
            },
          ).then((value) => setState(() {}));
        },
        backgroundColor: FlutterFlowTheme.of(context).gray600,
        elevation: 8.0,
        child: Icon(
          Icons.create_rounded,
          color: Colors.white,
          size: 24.0,
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
                borderColor: FlutterFlowTheme.of(context).white,
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
                  logFirebaseEvent('MY_TWEETS_arrow_back_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed('chat_page');
                },
              ),
              title: Text(
                'My Posts',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            )
          : null,
      body: wrapWithModel(
        model: _model.chat2Model,
        updateCallback: () => setState(() {}),
        child: Chat2Widget(),
      ),
    );
  }
}
