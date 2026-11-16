import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('MyPortfolio smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.text('Selamat datang di MyPortfolio Mobile!'), findsOneWidget);
    expect(find.text('Adinda Madya Aliyah'), findsOneWidget);
    expect(find.text('2506656362'), findsOneWidget);
    expect(find.text('PBP C'), findsOneWidget);
    expect(find.text('Lihat Edukasi'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
    expect(find.text('Tambah Edukasi'), findsOneWidget);
  });
}
