#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
EatFast Mobile App - Encoding Fix Script
Fixes all encoding issues in Dart files (� characters -> proper French accents)
"""

import os
import shutil
from pathlib import Path
from datetime import datetime

# Common encoding fixes for French text
ENCODING_FIXES = {
    # Common French accented characters
    'Ã©': 'é',  # é
    'Ã¨': 'è',  # è
    'Ãª': 'ê',  # ê
    'Ã ': 'à',  # à
    'Ã´': 'ô',  # ô
    'Ã®': 'î',  # î
    'Ã§': 'ç',  # ç
    'Ã¹': 'ù',  # ù
    'Ã»': 'û',  # û
    'Ã«': 'ë',  # ë
    'Ã¯': 'ï',  # ï
    'Ã': 'À',   # À
    'Ã‰': 'É',  # É
    'Ãˆ': 'È',  # È

    # Common words with encoding issues
    'DÃ©couvrez': 'Découvrez',
    'DÃ©couvrir': 'Découvrir',
    'dÃ©couvrir': 'découvrir',
    'prÃ©fÃ©rÃ©e': 'préférée',
    'prÃ©fÃ©rÃ©': 'préféré',
    'VariÃ©tÃ©': 'Variété',
    'variÃ©tÃ©': 'variété',
    'QualitÃ©': 'Qualité',
    'qualitÃ©': 'qualité',
    'SÃ©curitÃ©': 'Sécurité',
    'sÃ©curitÃ©': 'sécurité',
    'sÃ©curisÃ©e': 'sécurisée',
    'livrÃ©': 'livré',
    'rapide': 'rapide',
    'Ã  propos': 'À propos',
    'Ã  partir': 'à partir',
    'crÃ©er': 'créer',
    'dÃ©jÃ ': 'déjà',
    'YaoundÃ©': 'Yaoundé',
    'SpÃ©ciales': 'Spéciales',
    'spÃ©ciales': 'spéciales',
    'gÃ©nÃ©rales': 'générales',
    'GÃ©nÃ©rales': 'Générales',
    'dÃ©vouÃ©s': 'dévoués',
    'rÃ©seau': 'réseau',
    'prÃ©fÃ©rÃ©s': 'préférés',
    'lÃ©gales': 'légales',
    'validitÃ©': 'validité',
    'facilitÃ©': 'facilité',

    # Generic � replacement patterns (fallback)
    'Ã¡': 'á',
    'Ã³': 'ó',
    'Ãº': 'ú',
    'Ã±': 'ñ',
    'Ã': 'Á',
    'Ã"': 'Ó',
    'Ãš': 'Ú',
}

# Additional string replacements for quotes and apostrophes
QUOTE_FIXES = {
    ''': "'",  # Right curly apostrophe to straight
    ''': "'",  # Left curly apostrophe to straight
    '"': '"',  # Left curly quote to straight
    '"': '"',  # Right curly quote to straight
    '«': '"',  # Left guillemet to straight quote
    '»': '"',  # Right guillemet to straight quote
}

# Directories to scan
SCAN_DIRECTORIES = [
    'lib/shared/onboarding/presentation/screens',
    'lib/shared/services/auth/presentation/screens',
    'lib/modules/guest_module/screens',
    'lib/modules/guest_module/widgets',
    'lib/shared/screens',
    'lib/features',
    'lib/core',
]

# Files to exclude (already fixed)
EXCLUDE_FILES = [
    'lib/modules/guest_module/screens/guest_landing_screen.dart',
    'lib/shared/screens/legal/presentation/widgets/terms_content.dart',
]

def create_backup_directory():
    """Create a backup directory with timestamp"""
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    backup_dir = f'encoding_fixes_backup_{timestamp}'
    os.makedirs(backup_dir, exist_ok=True)
    return backup_dir

def fix_encoding_in_text(text):
    """Fix encoding issues in text"""
    fixed_text = text
    changes_made = []

    # Apply encoding fixes
    for wrong, correct in ENCODING_FIXES.items():
        if wrong in fixed_text:
            fixed_text = fixed_text.replace(wrong, correct)
            changes_made.append(f'{wrong} -> {correct}')

    # Apply quote and apostrophe fixes
    for wrong, correct in QUOTE_FIXES.items():
        if wrong in fixed_text:
            fixed_text = fixed_text.replace(wrong, correct)
            changes_made.append(f'{wrong} -> {correct}')

    return fixed_text, changes_made

def should_process_file(file_path):
    """Check if file should be processed"""
    # Convert to forward slashes for comparison
    normalized_path = str(file_path).replace('\\', '/')

    # Check if file is in exclude list
    for exclude in EXCLUDE_FILES:
        if exclude in normalized_path:
            return False

    # Check if file is a Dart file
    return file_path.suffix == '.dart'

def scan_and_fix_files(project_root):
    """Scan directories and fix encoding issues"""
    project_path = Path(project_root)
    backup_dir = create_backup_directory()

    total_files_scanned = 0
    total_files_fixed = 0
    total_changes = 0
    fix_report = []

    print("🔍 Scanning for encoding issues...")
    print(f"📂 Backup directory: {backup_dir}\n")

    for scan_dir in SCAN_DIRECTORIES:
        dir_path = project_path / scan_dir

        if not dir_path.exists():
            print(f"⚠️  Directory not found: {scan_dir}")
            continue

        print(f"📁 Scanning: {scan_dir}")

        # Find all .dart files in directory
        dart_files = list(dir_path.rglob('*.dart'))

        for dart_file in dart_files:
            if not should_process_file(dart_file):
                continue

            total_files_scanned += 1

            try:
                # Read file content
                with open(dart_file, 'r', encoding='utf-8', errors='ignore') as f:
                    original_content = f.read()

                # Fix encoding
                fixed_content, changes = fix_encoding_in_text(original_content)

                # If changes were made, backup and save
                if fixed_content != original_content:
                    # Create backup
                    relative_path = dart_file.relative_to(project_path)
                    backup_file = Path(backup_dir) / relative_path
                    backup_file.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copy2(dart_file, backup_file)

                    # Write fixed content
                    with open(dart_file, 'w', encoding='utf-8') as f:
                        f.write(fixed_content)

                    total_files_fixed += 1
                    total_changes += len(changes)

                    fix_report.append({
                        'file': str(relative_path),
                        'changes': changes
                    })

                    print(f"  ✅ Fixed: {relative_path} ({len(changes)} changes)")

            except Exception as e:
                print(f"  ❌ Error processing {dart_file}: {e}")

    # Print summary report
    print("\n" + "="*70)
    print("📊 ENCODING FIX SUMMARY")
    print("="*70)
    print(f"Files scanned: {total_files_scanned}")
    print(f"Files fixed: {total_files_fixed}")
    print(f"Total changes: {total_changes}")
    print(f"Backup location: {backup_dir}")

    if fix_report:
        print("\n" + "="*70)
        print("📝 DETAILED CHANGES")
        print("="*70)
        for item in fix_report:
            print(f"\n📄 {item['file']}")
            for change in item['changes'][:5]:  # Show first 5 changes per file
                print(f"   • {change}")
            if len(item['changes']) > 5:
                print(f"   ... and {len(item['changes']) - 5} more changes")

    # Generate fix report file
    report_file = Path(backup_dir) / 'fix_report.txt'
    with open(report_file, 'w', encoding='utf-8') as f:
        f.write("ENCODING FIX REPORT\n")
        f.write("=" * 70 + "\n\n")
        f.write(f"Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write(f"Files scanned: {total_files_scanned}\n")
        f.write(f"Files fixed: {total_files_fixed}\n")
        f.write(f"Total changes: {total_changes}\n\n")

        f.write("DETAILED CHANGES:\n")
        f.write("=" * 70 + "\n\n")
        for item in fix_report:
            f.write(f"\nFile: {item['file']}\n")
            f.write("-" * 70 + "\n")
            for change in item['changes']:
                f.write(f"  • {change}\n")

    print(f"\n📄 Full report saved to: {report_file}")
    print("\n✅ Encoding fix completed!")

    if total_files_fixed > 0:
        print("\n⚠️  Next steps:")
        print("1. Run: flutter analyze")
        print("2. Run: dart format .")
        print("3. Test the app to verify all text displays correctly")
        print("4. If everything looks good, you can delete the backup folder")
    else:
        print("\n🎉 No encoding issues found! All files are clean.")

if __name__ == '__main__':
    # Get current directory (should be project root)
    project_root = os.getcwd()

    print("🚀 EatFast Encoding Fix Script")
    print("=" * 70)
    print(f"📂 Project root: {project_root}\n")

    # Confirm before proceeding
    response = input("This will modify Dart files. Backups will be created. Continue? (y/n): ")

    if response.lower() == 'y':
        scan_and_fix_files(project_root)
    else:
        print("❌ Cancelled by user")
