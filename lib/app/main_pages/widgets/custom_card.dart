import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: theme.colorScheme.primaryContainer,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onPrimaryContainer),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimaryContainer),
                ),
              ],
            ),
            Icon(
              icon,
              size: 30,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}


// const CustomCard(
                    //   title: "Ovulation",
                    //   subtitle: "in three days",
                    //   icon: Icons.wb_sunny,
                    // ),
                    // const SizedBox(height: 10,),
                    // const CustomCard(
                    //   title: "Next Period",
                    //   subtitle: "in 14 days",
                    //   icon: Icons.calendar_today,
                    // ),
                    // const SizedBox(height: 10,),
                    // const CustomCard(
                    //   title: "Chances of getting pregnant",
                    //   subtitle: "High",
                    //   icon: Icons.egg,
                    // ),
                    // const SizedBox(height: 10,),
                    // const CustomCard(
                    //   title: "Valentine's Day",
                    //   subtitle: "in three days",
                    //   icon: Icons.favorite,
                    // ),
