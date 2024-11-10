import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'ai_chat_page_widget.dart' show AiChatPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AiChatPageModel extends FlutterFlowModel<AiChatPageWidget> {
  ///  Local state fields for this page.

  bool isTyping = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ChatColumn widget.
  ScrollController? chatColumn;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (chatWithGPT)] action in TextField widget.
  ApiCallResponse? apiResultz0r;
  // Stores action output result for [Backend Call - API (chatWithGPT)] action in Icon widget.
  ApiCallResponse? apiResultz0rCopy;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    chatColumn = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    chatColumn?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
