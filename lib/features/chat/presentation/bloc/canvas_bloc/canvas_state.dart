part of 'canvas_bloc.dart';

@immutable
abstract class CanvasState{
  const CanvasState();
}

@immutable
class CanvasInitialState extends CanvasState{}

class CanvasUpdatedState extends CanvasState {
  final List<Shape> track;
  final Shape current;
  const CanvasUpdatedState({required this.track,required this.current,});
}
