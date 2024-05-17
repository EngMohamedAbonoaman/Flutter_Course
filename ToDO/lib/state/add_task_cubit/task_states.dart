abstract class AllAddTaskStates {}

class AddTaskInitialState extends AllAddTaskStates {}

class AddTaskLoadingState extends AllAddTaskStates {}

class AddTaskErrorState extends AllAddTaskStates {}

class AddTaskSuccessState extends AllAddTaskStates {}

class DeleteTaskLoadingState extends AllAddTaskStates {}

class DeleteTaskErrorState extends AllAddTaskStates {
  final String error;
  DeleteTaskErrorState(this.error);
}

class DeleteTaskSuccessState extends AllAddTaskStates {}
