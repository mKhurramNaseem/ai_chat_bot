import 'dart:async';
import 'dart:developer';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/custom_line.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/quadrilateral.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/triangle.dart';

part 'canvas_event.dart';
part 'canvas_state.dart';

class CanvasBloc extends Bloc<CanvasEvent, CanvasState> {
  ShapeType shape = ShapeType.customLine;
  Color color = AppColors.cyan;
  StrokeType stroke = StrokeType.thin;
  // To keep trash record
  List<Shape> trashStack = [];

  // To keep record of previous shapes
  List<Shape> previous = [];

  // For all other shapes
  Offset begin = Offset.zero;
  Offset end = Offset.zero;

  // For Custom Line
  Offset current = Offset.zero;
  Shape currentShape = CustomLine(
    begin: Offset.zero,
    end: Offset.zero,
    offsets: [],
  );

  CanvasBloc() : super(CanvasInitialState()) {
    on<CanvasInitialEvent>(_handleInitialEvent);
    on<CanvasStartEvent>(_handleStartEvent);
    on<CanvasUpdateEvent>(_handleUpdateEvent);
    on<CanvasEndEvent>(_handleEndEvent);
    on<CanvasUndoEvent>(_handleUndoEvent);
    on<CanvasRedoEvent>(_handleRedoEvent);
  }

  FutureOr<void> _handleStartEvent(
      CanvasStartEvent event, Emitter<CanvasState> emit) {
    if (shape == ShapeType.customLine) {
      current = event.details.globalPosition;
      currentShape = getRespectiveInstance(shape);
      (currentShape as CustomLine).offsets.add(current);
    } else {
      begin = event.details.globalPosition;
      end = event.details.globalPosition;
      currentShape = getRespectiveInstance(shape);
    }
    currentShape.color = color;
    currentShape.stroke = stroke;
    currentShape.paintingStyle = PaintingStyle.stroke;
    emit(CanvasUpdatedState(track: previous, current: currentShape));
  }

  FutureOr<void> _handleUpdateEvent(
      CanvasUpdateEvent event, Emitter<CanvasState> emit) {
    if (currentShape is CustomLine) {
      current = event.details.globalPosition;
      (currentShape as CustomLine).offsets.add(current);
    } else {
      end = event.details.globalPosition;
      currentShape.end = end;
    }
    emit(CanvasUpdatedState(track: previous, current: currentShape));
  }

  FutureOr<void> _handleEndEvent(
      CanvasEndEvent event, Emitter<CanvasState> emit) {
    previous.add(currentShape);
    if (currentShape is CustomLine) {
      current = Offset.zero;
    }
    log(previous.toString());
  }

  FutureOr<void> _handleUndoEvent(
      CanvasUndoEvent event, Emitter<CanvasState> emit) {
    if (previous.isNotEmpty) {
      Shape shape = previous.removeAt(previous.length - 1);
      trashStack.add(shape);
      emit(CanvasUpdatedState(track: previous, current: currentShape));
    }
  }

  FutureOr<void> _handleRedoEvent(
      CanvasRedoEvent event, Emitter<CanvasState> emit) {
    if (trashStack.isNotEmpty) {
      Shape shape = trashStack.removeAt(trashStack.length - 1);
      previous.add(shape);
      emit(CanvasUpdatedState(track: previous, current: currentShape));
    }
  }

  FutureOr<void> _handleInitialEvent(
      CanvasInitialEvent event, Emitter<CanvasState> emit) {
    trashStack = [];
    previous = [];
    begin = Offset.zero;
    end = Offset.zero;
    emit(CanvasUpdatedState(
        current: Line(begin: begin, end: end), track: previous));
  }

  Shape getRespectiveInstance(ShapeType shape) {
    return switch (shape) {
      ShapeType.line => Line(begin: begin, end: end),
      ShapeType.oval => Oval(begin: begin, end: end),
      ShapeType.rectangle => Rectangle(begin: begin, end: end),
      ShapeType.rRectangle => RRectangle(begin: begin, end: end),
      ShapeType.pentagon => Pentagon(begin: begin, end: end),
      ShapeType.hexagon => Hexagon(begin: begin, end: end),
      ShapeType.isocelesTriangle => Isoceles(begin: begin, end: end),
      ShapeType.customLine => CustomLine(begin: begin, end: end, offsets: []),
    };
  }
}
