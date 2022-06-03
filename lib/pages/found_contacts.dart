import 'package:flutter/material.dart';
import '../widgets/jedny_textfield.dart';

class FoundContact extends StatefulWidget {
  const FoundContact({Key? key}) : super(key: key);

  @override
  State<FoundContact> createState() => _FoundContactState();
}

class _FoundContactState extends State<FoundContact> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        title: Transform(
          transform: Matrix4.translationValues(0.0, 0.0, 0.0),
          child: const Text(
            "معلومات الاتصال",
            style: TextStyle(),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 300,
                  child: Text(
                    'نقوم باعلامك عبر اشعارات التطبيق وعبر رقم الهاتف الذي تدخله عند وجود أي معلومات أو تحديثات جديدة عن الشخص المفقود',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ],
            ),
            JednyTextField(
              hint_value: 'الاسم',
              icon: const Icon(
                Icons.person,
                size: 36.0,
                color: Colors.black54,
              ),
            ),
            JednyTextField(
              hint_value: 'رقم الهاتف',
              icon: const Icon(
                Icons.phone,
                size: 36.0,
                color: Colors.black54,
              ),
            ),
            JednyTextField(
              hint_value: 'العلاقة بالشخص المفقود',
              icon: const Icon(
                Icons.people,
                size: 36.0,
                color: Colors.black54,
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('تأكيد البلاغ'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
