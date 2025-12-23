import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // เก็บข้อมูลไว้ใน List<String>
  List<String> menuList = [];

  // ปุ่ม ➕ เพิ่มเมนูใหม่ต่อท้าย
  void addMenu() {
    setState(() {
      menuList.add('เมนูที่ ${menuList.length + 1}');
    });
  }

  // ปุ่ม ➖ ลบเมนูสุดท้าย (ถ้ามีข้อมูล)
  void removeMenu() {
    if (menuList.isNotEmpty) {
      setState(() {
        menuList.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu List'),
      ),

      // A. ListView Builder เพื่อแสดงข้อมูล
      body: ListView.builder(
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.fastfood),
            title: Text(menuList[index]),
          );
        },
      ),

      // B. FloatingActionButton 2 ปุ่ม
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: addMenu,
            heroTag: 'add',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: removeMenu,
            heroTag: 'remove',
            backgroundColor: Colors.red,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
