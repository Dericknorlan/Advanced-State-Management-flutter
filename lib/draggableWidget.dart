import 'package:flutter/material.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class MyDraggableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DragItemWidget provides the content for the drag (DragItem).
    return DragItemWidget(
      dragItemProvider: (request) async {
        // DragItem represents the content being dragged.
        final item = DragItem(
          localData: {'x': 3, 'y': 4},
        );
        item.add(Formats.plainText('Plain Text Data'));
        item.add(Formats.htmlText.lazy(() => '<b>HTML generated on demand</b>'));
        return item;
      },
      allowedOperations: () => [DropOperation.copy],
      child: const DraggableWidget(
        child: Text('This widget is draggable'),
      ),
    );
  }
}

class MyDropRegion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropRegion(
      formats: Formats.standardFormats,
      hitTestBehavior: HitTestBehavior.opaque,
      onDropOver: (event) {
        final item = event.session.items.first;
        if (item.localData is Map) {
          print('Dropped within the app with custom local data.');
        }
        if (item.canProvide(Formats.plainText)) {
          print('This item contains plain text.');
        }
        if (event.session.allowedOperations.contains(DropOperation.copy)) {
          return DropOperation.copy;
        } else {
          return DropOperation.none;
        }
      },
      onDropEnter: (event) {
        print('Drag entered the drop region.');
      },
      onDropLeave: (event) {
        print('Drag left the drop region.');
      },
      onPerformDrop: (event) async {
        final item = event.session.items.first;
        final reader = item.dataReader!;

        if (reader.canProvide(Formats.plainText)) {
          reader.getValue<String>(Formats.plainText, (value) {
            if (value != null) {
              print('Dropped plain text: $value');
            }
          }, onError: (error) {
            print('Error reading plain text: $error');
          });
        }

        if (reader.canProvide(Formats.png)) {
          reader.getFile(Formats.png, (file) {
            final stream = file.getStream(); // Get the stream for large files
            stream.listen(
              (data) {
                print('Received chunk of PNG data: ${data.length} bytes');
              },
              onDone: () {
                print('PNG file streaming completed.');
              },
              onError: (error) {
                print('Error reading PNG stream: $error');
              },
            );
          }, onError: (error) {
            print('Error reading PNG file: $error');
          });
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text('Drop items here'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Drag and Drop Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyDraggableWidget(),
          SizedBox(height: 50),
          MyDropRegion(),
        ],
      ),
    ),
  ));
}
