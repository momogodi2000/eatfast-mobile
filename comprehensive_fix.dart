import 'dart:io';

void main() async {
  print('🔧 Starting comprehensive automated fixes...\n');

  // Fix 1: Add getRestaurantStats to repository
  await fixRepository();
  
  // Fix 2: Export new models
  await exportModels();
  
  // Fix 3: Fix driver stats type issues
  await fixDriverStats();
  
  print('\n✅ All automated fixes completed!');
  print('Run: flutter analyze');
}

Future<void> fixRepository() async {
  print('📝 Fixing restaurant repository...');
  final repoFile = File('lib/modules/restaurant_manager_module/providers/domain/repositories/restaurant_owner_repository.dart');
  if (!repoFile.existsSync()) {
    print('⚠️  Repository file not found');
    return;
  }

  var content = repoFile.readAsStringSync();
  
  // Check if getRestaurantStats exists
  if (!content.contains('getRestaurantStats')) {
    // Find the last method and add after it
    final lines = content.split('\n');
    final lastBrace = lines.lastIndexWhere((line) => line.trim() == '}');
    
    if (lastBrace > 0) {
      lines.insert(lastBrace, '''
  /// Get restaurant statistics
  Future<RestaurantStats> getRestaurantStats(String restaurantId);
''');
      repoFile.writeAsStringSync(lines.join('\n'));
      print('✓ Added getRestaurantStats method');
    }
  } else {
    print('✓ getRestaurantStats already exists');
  }
}

Future<void> exportModels() async {
  print('📝 Exporting new models...');
  final menuMgmtFile = File('lib/modules/restaurant_manager_module/providers/domain/models/menu_management.dart');
  
  if (menuMgmtFile.existsSync()) {
    var content = menuMgmtFile.readAsStringSync();
    if (!content.contains('menu_item_details.dart')) {
      content += "\nexport 'menu_item_details.dart';";
      content += "\nexport 'menu_item_performance.dart';";
      menuMgmtFile.writeAsStringSync(content);
      print('✓ Added model exports');
    } else {
      print('✓ Models already exported');
    }
  }
}

Future<void> fixDriverStats() async {
  print('📝 Fixing driver stats...');
  final quickStatsFile = File('lib/modules/driver_module/widgets/widgets/quick_stats_row.dart');
  
  if (quickStatsFile.existsSync()) {
    var content = quickStatsFile.readAsStringSync();
    
    // Replace double type with EarningsSummary
    content = content.replaceAll(
      RegExp(r'final double\? (todayStats|weekStats|monthStats|overallStats)'),
      r'final EarningsSummary? $1'
    );
    
    quickStatsFile.writeAsStringSync(content);
    print('✓ Fixed driver stats types');
  }
}
