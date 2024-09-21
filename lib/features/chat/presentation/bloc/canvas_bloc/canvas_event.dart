part of 'canvas_bloc.dart';

@immutable
sealed class CanvasEvent {}

@immutable
class CanvasInitialEvent extends CanvasEvent{}

@immutable
class CanvasStartEvent extends CanvasEvent{
  final DragDownDetails details;  
  CanvasStartEvent({required this.details,});

}

@immutable
class CanvasUpdateEvent extends CanvasEvent{
  final DragUpdateDetails details;

  CanvasUpdateEvent({required this.details});
}

@immutable
class CanvasEndEvent extends CanvasEvent{
  final DragEndDetails details;

  CanvasEndEvent({required this.details});
}

@immutable
class CanvasUndoEvent extends CanvasEvent{  
}

@immutable
class CanvasRedoEvent extends CanvasEvent{  
}