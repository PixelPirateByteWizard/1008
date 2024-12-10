import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Contact & Support',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildContactCard(
              context,
              title: 'Customer Support',
              subtitle: 'We\'re here to help you 24/7',
              items: [
                ContactItem(
                  icon: Icons.email_outlined,
                  title: 'Email Support',
                  subtitle: 'support@Ember.com',
                  description: 'Response within 24 hours',
                  color: const Color(0xFF3498DB),
                  onTap: () => _copyToClipboard(
                    context,
                    'support@Ember.com',
                    'Email address copied',
                  ),
                ),
                ContactItem(
                  icon: Icons.phone_outlined,
                  title: 'Support Hotline',
                  subtitle: '+1 (888) 888-8888',
                  description: 'Available Mon-Fri, 9AM-6PM EST',
                  color: const Color(0xFF2ECC71),
                  onTap: () => _copyToClipboard(
                    context,
                    '+18888888888',
                    'Phone number copied',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildContactCard(
              context,
              title: 'Social Media',
              subtitle: 'Follow us for the latest updates',
              items: [
                ContactItem(
                  icon: Icons.facebook,
                  title: 'Facebook',
                  subtitle: '@Emberofficial',
                  description: 'Join our community of 100K+ followers',
                  color: const Color(0xFF3B5998),
                  onTap: () => _copyToClipboard(
                    context,
                    '@Emberofficial',
                    'Facebook handle copied',
                  ),
                ),
                ContactItem(
                  icon: Icons.alternate_email,
                  title: 'Twitter',
                  subtitle: '@Ember',
                  description: 'Real-time updates and announcements',
                  color: const Color(0xFF1DA1F2),
                  onTap: () => _copyToClipboard(
                    context,
                    '@Ember',
                    'Twitter handle copied',
                  ),
                ),
                ContactItem(
                  icon: Icons.camera_alt_outlined,
                  title: 'Instagram',
                  subtitle: '@Ember.official',
                  description: 'Behind the scenes and style inspiration',
                  color: const Color(0xFFE1306C),
                  onTap: () => _copyToClipboard(
                    context,
                    '@Ember.official',
                    'Instagram handle copied',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildContactCard(
              context,
              title: 'Business Inquiries',
              subtitle: 'Partner with us',
              items: [
                ContactItem(
                  icon: Icons.business,
                  title: 'Business Development',
                  subtitle: 'business@Ember.com',
                  description: 'For partnerships and collaborations',
                  color: const Color(0xFFE67E22),
                  onTap: () => _copyToClipboard(
                    context,
                    'business@Ember.com',
                    'Business email copied',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildWorkingHours(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get in Touch',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E50),
              height: 1.2,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'We\'d love to hear from you. Our team is always here to help and answer any questions you may have.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF7F8C8D),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required List<ContactItem> items,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Divider(),
          ...items.map((item) => _buildContactItem(context, item)).toList(),
        ],
      ),
    );
  }

  Widget _buildContactItem(BuildContext context, ContactItem item) {
    return ListTile(
      leading: Icon(
        item.icon,
        color: item.color,
      ),
      title: Text(item.title),
      subtitle: Text(item.subtitle),
      trailing: const Icon(Icons.content_copy),
      onTap: item.onTap,
    );
  }

  Widget _buildWorkingHours(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Working Hours',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildTimeRow(context, 'Monday-Friday', '09:00 - 18:00'),
            const SizedBox(height: 8),
            _buildTimeRow(context, 'Saturday-Sunday', '10:00 - 16:00'),
            const SizedBox(height: 8),
            _buildTimeRow(context, 'Public Holidays', '10:00 - 16:00'),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeRow(BuildContext context, String day, String time) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            day,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Text(
          time,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  void _copyToClipboard(BuildContext context, String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        width: 200,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class ContactItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const ContactItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
    required this.onTap,
  });
}
