import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  static const Color basicColor = Color.fromARGB(255, 0, 106, 113);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textScale = width / 375;

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 16,
              bottom: 16,
              left: 20,
              right: 20,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: basicColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'حول التطبيق',
                  style: TextStyle(
                    fontSize: 20 * textScale,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: width * 0.15,
                    backgroundColor:Static.basiccolor,
                    child: Icon(
                      Icons.medical_services,
                      size: width * 0.15,
                      color: basicColor,
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildCard(
                    context: context,
                    icon: Icons.info_outline,
                    title: 'عن التطبيق',
                    content:
                        'تطبيق مخصص لمساعدة المرضى الذين يتوجهون إلى كلية طب الأسنان في جامعة دمشق. '
                        'يوفر إمكانية حجز المواعيد والتواصل مع طلاب الكلية لتلقي العلاج مجاناً بطريقة منظمة وسهلة الاستخدام.',
                    textScale: textScale,
                  ),
                  _buildCard(
                    context: context,
                    icon: Icons.warning_amber_rounded,
                    title: 'ملاحظة هامة',
                    content:
                        'يجب على كل مريض التوجه إلى قسم الأشعة الموجود في مجمع الكليات في المزة قبل بدء العلاج.',
                    textScale: textScale,
                    iconColor: Colors.red[700],
                    cardColor: Colors.red.shade50,
                  ),
                  _buildCard(
                    context: context,
                    icon: Icons.group_outlined,
                    title: 'فريق العمل',
                    content: '''
باك إند (Laravel):
- تقى نوح
- روان الحلاق

فرونت إند - تطبيق موبايل (Flutter):
- أريج محفوظ
- غالية عجينة

فرونت إند - موقع ويب (React):
- حازم أبو زيد
''',
                    textScale: textScale,
                  ),
                  _buildCard(
                    context: context,
                    icon: Icons.contact_mail_outlined,
                    title: 'اتصل بنا',
                    content:
                        'لأي استفسارات أو ملاحظات، يمكنكم التواصل معنا عبر صفحة "اتصل بنا" في التطبيق.',
                    textScale: textScale,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String content,
    required double textScale,
    Color? cardColor,
    Color? iconColor,
  }) {
    return Card(
      color: cardColor ?? Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: iconColor ?? basicColor),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * textScale,
                      color: iconColor ?? basicColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 14 * textScale,
                      height: 1.5,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
