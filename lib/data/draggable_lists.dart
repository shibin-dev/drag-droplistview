import '../model/draggable_list.dart';

List<DraggableList> allLists =  [
  DraggableList(
    header: 'To Do',
    items: [
      DraggableListItem(
        title: 'Orange',
      ),
    ],
  ),
  DraggableList(
    header: 'OnProgress',
    items: [],
  ),
  DraggableList(
    header: 'Completed',
    items: [],
  ),
];
