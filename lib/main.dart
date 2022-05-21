import 'package:dpro_regilo/core/base_items/item_list/branch_item_list.dart';
import 'package:dpro_regilo/core/base_items/item_list/value_item_list.dart';
import 'package:dpro_regilo/core/codelines.dart';
import 'package:dpro_regilo/draw_engine/main_wrapper.dart';
import 'package:dpro_regilo/output/output_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ja'),
          Locale('ja', 'JP'),
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        child: TestApp()),
  );
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        // 使用CustomPaint
        painter: MainWrapper(),
      ),
    );
  }
}

class PP extends CustomPainter {
  late Paint _gridPint; // 画笔
  final double step = 20; // 小格边长
  final double strokeWidth = .5; // 线宽
  final Color color = Colors.grey; // 线颜色

  PP() {
    _gridPint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
  }
  @override
  void paint(Canvas canvas, Size size) {
    // 画布起点移到屏幕中心
    canvas.translate(size.width / 2, size.height / 2);
    _drawGrid(canvas, size);
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    // canvas.drawCircle(const Offset(0, 0), 50, paint);
    // canvas.drawLine(
    //     const Offset(20, 20),
    //     const Offset(50, 50),
    //     paint
    //       ..color = Colors.red
    //       ..strokeWidth = 5
    //       ..strokeCap = StrokeCap.round
    //       ..style = PaintingStyle.stroke);
  }

  void _drawGrid(Canvas canvas, Size size) {
    _drawBottomRight(canvas, size);
    canvas.save();
    canvas.scale(1, -1); //沿x轴镜像
    _drawBottomRight(canvas, size);
    canvas.drawCircle(const Offset(130, 130), 10, Paint());
    canvas.restore();
    canvas.drawCircle(const Offset(130, 130), 10, Paint());

    canvas.translate(-size.width / 2, -size.height / 2);
    canvas.drawCircle(const Offset(130, 130), 10, Paint());
    canvas.drawLine(Offset(0, size.height - 20),
        Offset(size.width, size.height - 20), Paint());
    // canvas.save();
    // canvas.scale(-1, 1); //沿y轴镜像
    // _drawBottomRight(canvas, size);
    // canvas.restore();

    // canvas.save();
    // canvas.scale(-1, -1); //沿原点镜像
    // _drawBottomRight(canvas, size);
    // canvas.restore();
  }

  void _drawBottomRight(Canvas canvas, Size size) {
    canvas.save();
    for (int i = 0; i < size.height / 2 / step; i++) {
      canvas.drawLine(const Offset(0, 0), Offset(size.width / 2, 0), _gridPint);
      canvas.translate(0, step);
    }
    canvas.restore();

    canvas.save();
    for (int i = 0; i < size.width / 2 / step; i++) {
      canvas.drawLine(
          const Offset(0, 0), Offset(0, size.height / 2), _gridPint);
      canvas.translate(step, 0);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  CodeLines _codeLines = CodeLines();

  ChoosingType choosingType = ChoosingType.value;

  Widget getChoosingWidgetList() {
    switch (choosingType) {
      case ChoosingType.value:
        return ValueItemList();
      case ChoosingType.calculate:
        return ValueItemList();
      case ChoosingType.branch:
        return BranchItemList();
      default:
        return ValueItemList();
    }
  }

  int currentIndex = 0;
  Future onButtomTap(int index) async {
    currentIndex = index;
    switch (index) {
      case 0:
        setState(() {
          choosingType = ChoosingType.value;
        });
        break;
      case 1:
        setState(() {
          choosingType = ChoosingType.calculate;
        });
        break;
      case 2:
        setState(() {
          choosingType = ChoosingType.branch;
        });
        break;
      case 3:
        setState(() {
          choosingType = ChoosingType.tools;
        });
        break;
      default:
        setState(() {
          choosingType = ChoosingType.settings;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dpro-Regilo(Alpha)"),
        leading: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              _codeLines = CodeLines();
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OutputPage(
                  codeLines: _codeLines,
                );
              }));
            },
            icon: const Icon(Icons.arrow_forward),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onButtomTap,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.paid_outlined),
            label: 'value'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calculate),
            label: 'calculate'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_tree_outlined),
            label: 'branch'.tr(),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service_outlined),
            label: 'tools',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'settings',
          ),
        ],
      ),
      body: Container(
        color: Colors.green,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 2,
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Container(
                  alignment: Alignment.topLeft,
                  color: Colors.green[100],
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _codeLines,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Container(
                  color: Colors.blue[200],
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: getChoosingWidgetList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ChoosingType { value, branch, calculate, tools, settings }
