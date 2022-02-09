import 'package:dpro_regilo/core/base_items/item_list/branch_item_list.dart';
import 'package:dpro_regilo/core/base_items/item_list/value_item_list.dart';
import 'package:dpro_regilo/core/codelines.dart';
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
        child: const MyApp()),
  );
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
          choosingType = ChoosingType.branch;
        });
        break;
      case 2:
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

enum ChoosingType { value, branch, tools, settings }
