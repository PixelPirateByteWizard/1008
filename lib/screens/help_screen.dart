import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWelcomeCard(context),
          _buildHelpSection(
            context: context,
            title: 'Shopping Lists',
            icon: Icons.shopping_cart,
            items: const [
              HelpItem(
                title: 'Creating Shopping Lists',
                description:
                    'Learn how to create and organize your family shopping lists by categories',
                route: '/help/shopping-lists/create',
              ),
              HelpItem(
                title: 'Sharing Lists',
                description:
                    'Share shopping lists with family members and update in real-time',
                route: '/help/shopping-lists/share',
              ),
              HelpItem(
                title: 'Budget Tracking',
                description:
                    'Track expenses and set budget limits for your shopping lists',
                route: '/help/shopping-lists/budget',
              ),
            ],
          ),
          _buildHelpSection(
            context: context,
            title: 'Pet Care Management',
            icon: Icons.pets,
            items: const [
              HelpItem(
                title: 'Pet Profiles',
                description:
                    'Set up detailed profiles for your pets including medical history and care instructions',
                route: '/help/pets/profiles',
              ),
              HelpItem(
                title: 'Vaccination Tracking',
                description:
                    'Monitor vaccination schedules and get reminders for upcoming shots',
                route: '/help/pets/vaccinations',
              ),
              HelpItem(
                title: 'Daily Care Schedule',
                description:
                    'Manage feeding times, medications, and exercise routines for your pets',
                route: '/help/pets/care-schedule',
              ),
              HelpItem(
                title: 'Vet Appointments',
                description:
                    'Schedule and track veterinary visits and health check-ups',
                route: '/help/pets/vet-visits',
              ),
            ],
          ),
          _buildHelpSection(
            context: context,
            title: 'Household Management',
            icon: Icons.home,
            items: const [
              HelpItem(
                title: 'Cleaning Schedule',
                description:
                    'Create and manage recurring cleaning tasks for your home',
                route: '/help/household/cleaning',
              ),
              HelpItem(
                title: 'Maintenance Tracking',
                description:
                    'Track home maintenance tasks and set up preventive maintenance schedules',
                route: '/help/household/maintenance',
              ),
              HelpItem(
                title: 'Family Task Assignment',
                description:
                    'Assign and monitor household responsibilities among family members',
                route: '/help/household/tasks',
              ),
              HelpItem(
                title: 'Inventory Management',
                description:
                    'Keep track of household supplies and get low stock alerts',
                route: '/help/household/inventory',
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildWelcomeCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Famigoletix Help',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Find answers to common questions and learn how to make the most of Famigoletix.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpSection({
    required BuildContext context,
    required String title,
    required IconData icon,
    required List<HelpItem> items,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: items
            .map((item) => ListTile(
                  leading: const Icon(Icons.article_outlined),
                  title: Text(item.title),
                  subtitle: Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => Navigator.pushNamed(context, item.route),
                ))
            .toList(),
      ),
    );
  }
}

class HelpItem {
  final String title;
  final String description;
  final String route;

  const HelpItem({
    required this.title,
    required this.description,
    required this.route,
  });
}
