import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const DaliliApp());
}

class DaliliApp extends StatelessWidget {
  const DaliliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تطبيق دليلي الإداري'), backgroundColor: Colors.blue),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('مرحباً بك في دليلي 👋', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            
            // القسم 1: الوثائق
            ListTile(
              leading: const Icon(Icons.badge, color: Colors.orange),
              title: const Text('الوثائق المؤمنة'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DocumentsPage()));
              },
            ),
            
            // باقي الأقسام (يمكنك إضافة صفحات لها لاحقاً بنفس الطريقة)
            ListTile(leading: const Icon(Icons.school, color: Colors.green), title: const Text('التعليم والمنح الدراسية')),
            ListTile(leading: const Icon(Icons.gavel, color: Colors.red), title: const Text('الإجراءات القانونية')),
            ListTile(leading: const Icon(Icons.local_hospital, color: Colors.teal), title: const Text('خدمات الصحة والتأمين')),
            
            const Divider(thickness: 2),
            
            // قسم التواصل
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.blue),
              title: const Text('تواصل معنا'),
              subtitle: const Text('+222 43434223'),
              onTap: () async {
                final Uri launchUri = Uri(scheme: 'tel', path: '+22243434223');
                if (await canLaunchUrl(launchUri)) {
                  await launchUrl(launchUri);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الوثائق المؤمنة'), backgroundColor: Colors.orange),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('المستندات المطلوبة:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('1. مستخرج من السجل الوطني للسكان.\n2. شهادة إقامة.\n3. دفع الرسوم.'),
            ],
          ),
        ),
      ),
    );
  }
}