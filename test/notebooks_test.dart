import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/domain/notebook.dart';

void main() {
  group("construction", () {
    test("Can create a notebook group", () {
      expect(Notebooks(), isNotNull);
    });

    test("Can create a test notebooks", () {
      final Notebooks _notebooks = Notebooks.testDataBuilder();
      expect(_notebooks, isNotNull);
      expect(_notebooks.length, 10);
    });
  });

  group("removal", () {
    test("remove by index", () {
      final Notebook n = Notebook("test");
      final Notebooks _notebooks = Notebooks();
      _notebooks.add(n);
      expect(() => _notebooks.removeAt(0), returnsNormally);

      _notebooks.add(n);
      expect(_notebooks.removeAt(0), n);
    });
  });

  group("contents", () {
    test("length behaves correctly", () {
      final nb = Notebooks();
      final nb2 = Notebooks();
      final n = Notebook("Test");

      expect(nb.length, 0);

      nb2.add(n);

      expect(nb2.length, 1);

      nb2.remove(n);
      expect(nb2.length, 0);
    });
  });
}
