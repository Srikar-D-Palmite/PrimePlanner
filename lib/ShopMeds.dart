import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'shop_meds_model.dart';
export 'shop_meds_model.dart';

class ShopMedsWidget extends StatefulWidget {
  const ShopMedsWidget({Key? key}) : super(key: key);

  @override
  _ShopMedsWidgetState createState() => _ShopMedsWidgetState();
}

class _ShopMedsWidgetState extends State<ShopMedsWidget> {
  late ShopMedsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopMedsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: Color(0xFFF4F4F4),
          automaticallyImplyLeading: true,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Color(0xFF070000),
              size: 38,
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Text(
              'Shop Medication',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Open Sans',
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 4,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, -0.11),
                child: Container(
                  width: 400,
                  height: 173,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.02, -0.54),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                  child: Text(
                    'Click Link below to shop:',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF15161E),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -0.74),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Choose PDF',
                    options: FFButtonOptions(
                      width: 300,
                      height: 55,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.04, -0.77),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 16, 10),
                  child: Text(
                    'Select pdf file to upload',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF606A85),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -0.88),
                child: Text(
                  'Upload Prescriptions',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Noto Sans',
                        fontSize: 30,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
