import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/note.dart';

void main() {
  group("construction", () {
    test("Can create a notebook", () {
      expect(Notebook("test"), isNotNull);
    });
  });

  group("removal", () {
    test("remove by index", () {
      final Note n = Note("hola");
      final Notebook _notebook = Notebook("test");
      _notebook.add(n);
      expect(() => _notebook.removeAt(0), returnsNormally);

      _notebook.add(n);
      expect(_notebook.removeAt(0), n);
    });
  });

  group("contents", () {
    test("length behaves correctly", () {
      final nb = Notebook("test");
      final nb2 = Notebook("test");
      final n = Note("Lorem Ipsum");

      expect(nb.length, 0);

      nb2.add(n);

      expect(nb2.length, 1);

      nb2.remove(n);
      expect(nb2.length, 0);
    });
  });
}
