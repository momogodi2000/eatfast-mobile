import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/personalization.dart';

class PersonalizedRecommendationsCard extends ConsumerWidget {
  final List<SmartRecommendation> recommendations;
  final Function(RecommendedItem item)? onItemTap;
  final Function(SmartRecommendation recommendation)? onRecommendationTap;

  const PersonalizedRecommendationsCard({
    super.key,
    required this.recommendations,
    this.onItemTap,
    this.onRecommendationTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (recommendations.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.primary,
                        theme.colorScheme.secondary,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommandations personnalisées',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Basées sur vos préférences',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => _showAllRecommendations(context),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 280,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: recommendations.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final recommendation = recommendations[index];
                  return _RecommendationSection(
                    recommendation: recommendation,
                    onItemTap: onItemTap,
                    onSectionTap: onRecommendationTap,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAllRecommendations(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.auto_awesome),
                    const SizedBox(width: 8),
                    const Text(
                      'Toutes vos recommandations',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: recommendations.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final recommendation = recommendations[index];
                    return _DetailedRecommendationCard(
                      recommendation: recommendation,
                      onItemTap: onItemTap,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecommendationSection extends StatelessWidget {
  final SmartRecommendation recommendation;
  final Function(RecommendedItem item)? onItemTap;
  final Function(SmartRecommendation recommendation)? onSectionTap;

  const _RecommendationSection({
    required this.recommendation,
    this.onItemTap,
    this.onSectionTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: _getTypeColor(recommendation.type).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _getTypeColor(recommendation.type).withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getTypeColor(recommendation.type),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        recommendation.type.displayName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${(recommendation.confidence * 100).toInt()}%',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  recommendation.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  recommendation.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: recommendation.items.take(3).length,
              separatorBuilder: (context, index) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                final item = recommendation.items[index];
                return _RecommendedItemTile(
                  item: item,
                  onTap: onItemTap != null ? () => onItemTap!(item) : null,
                );
              },
            ),
          ),
          if (recommendation.items.length > 3)
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                onPressed: onSectionTap != null ? () => onSectionTap!(recommendation) : null,
                style: TextButton.styleFrom(
                  foregroundColor: _getTypeColor(recommendation.type),
                  minimumSize: const Size.fromHeight(32),
                ),
                child: Text(
                  'Voir ${recommendation.items.length - 3} autres',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _getTypeColor(RecommendationType type) {
    switch (type) {
      case RecommendationType.personalFavorites:
        return Colors.purple;
      case RecommendationType.trendingItems:
        return Colors.orange;
      case RecommendationType.weatherBased:
        return Colors.blue;
      case RecommendationType.timeBased:
        return Colors.green;
      case RecommendationType.locationBased:
        return Colors.red;
      case RecommendationType.similarUsers:
        return Colors.teal;
      case RecommendationType.complementItems:
        return Colors.indigo;
      case RecommendationType.seasonalSpecial:
        return Colors.amber;
    }
  }
}

class _RecommendedItemTile extends StatelessWidget {
  final RecommendedItem item;
  final VoidCallback? onTap;

  const _RecommendedItemTile({
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: theme.colorScheme.primaryContainer,
          backgroundImage: item.imageUrl != null ? NetworkImage(item.imageUrl!) : null,
          child: item.imageUrl == null
              ? Icon(
                  Icons.restaurant,
                  size: 16,
                  color: theme.colorScheme.onPrimaryContainer,
                )
              : null,
        ),
        title: Text(
          item.itemName,
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.restaurantName,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                fontSize: 10,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 10,
                  color: Colors.amber,
                ),
                const SizedBox(width: 2),
                Text(
                  '${item.rating.toStringAsFixed(1)} (${item.reviewCount})',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Text(
          '${item.price.toStringAsFixed(0)} FCFA',
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.primary,
            fontSize: 10,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

class _DetailedRecommendationCard extends StatelessWidget {
  final SmartRecommendation recommendation;
  final Function(RecommendedItem item)? onItemTap;

  const _DetailedRecommendationCard({
    required this.recommendation,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getTypeColor(recommendation.type),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    recommendation.type.displayName,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${(recommendation.confidence * 100).toInt()}% de confiance',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              recommendation.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              recommendation.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            if (recommendation.reasons.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: recommendation.reasons.map((reason) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      reason,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: recommendation.items.length,
              itemBuilder: (context, index) {
                final item = recommendation.items[index];
                return _RecommendedItemTile(
                  item: item,
                  onTap: onItemTap != null ? () => onItemTap!(item) : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _getTypeColor(RecommendationType type) {
    switch (type) {
      case RecommendationType.personalFavorites:
        return Colors.purple;
      case RecommendationType.trendingItems:
        return Colors.orange;
      case RecommendationType.weatherBased:
        return Colors.blue;
      case RecommendationType.timeBased:
        return Colors.green;
      case RecommendationType.locationBased:
        return Colors.red;
      case RecommendationType.similarUsers:
        return Colors.teal;
      case RecommendationType.complementItems:
        return Colors.indigo;
      case RecommendationType.seasonalSpecial:
        return Colors.amber;
    }
  }
}