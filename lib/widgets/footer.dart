import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  // Helper to launch URLs
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      // You can handle errors better here
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final bgColor = isDark ? Colors.grey[900] : Colors.grey[200];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      color: bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About Us text
          Text(
            'About Us',
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          ),
          const SizedBox(height: 6),
          Text(
            'We build modern mobile apps that are fast, scalable, and user-friendly.',
            style: TextStyle(color: textColor),
          ),
          const SizedBox(height: 16),

          // Contact info
          Text(
            'Contact',
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          ),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: () => _launchURL('mailto:support@ecommerce.com'),
            child: const Text(
              'Email: support@ecommerce.com',
              style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ),
          GestureDetector(
            onTap: () => _launchURL('tel:+919876543210'),
            child: const Text(
              'Phone: +91 98765 43210',
              style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(height: 16),

          // Social icons row
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.blue),
                onPressed: () => _launchURL('https://facebook.com'),
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.purple),
                onPressed: () => _launchURL('https://instagram.com'),
              ),
              IconButton(
                icon: const Icon(Icons.language, color: Colors.lightBlue),
                onPressed: () => _launchURL('https://twitter.com'),
              ),
            ],
          ),

          const Divider(),

          // Copyright centered
          Center(
            child: Text(
              '© 2025 Vishesha Inc.',
              style: TextStyle(color: textColor.withOpacity(0.7), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
