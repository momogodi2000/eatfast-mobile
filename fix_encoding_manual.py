#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Manual encoding fix for specific files with known issues
"""

import os
import re
from pathlib import Path

def fix_encoding_issues():
    """Fix specific encoding issues in known files"""
    
    # Files with known encoding issues
    files_to_fix = [
        'lib/shared/services/auth/presentation/screens/login_screen.dart',
        'lib/shared/services/auth/presentation/screens/otp_verification_screen.dart',
        'lib/shared/onboarding/presentation/screens/onboarding_screen.dart',
    ]
    
    # Specific replacements for each file
    replacements = {
        'lib/shared/services/auth/presentation/screens/login_screen.dart': [
            ('Un code de vérification sera envoyé ce numro', 'Un code de vérification sera envoyé à ce numéro'),
        ],
        'lib/shared/services/auth/presentation/screens/otp_verification_screen.dart': [
            ('Nous avons envoyé un code de vérification', 'Nous avons envoyé un code de vérification à'),
        ],
        'lib/shared/onboarding/presentation/screens/onboarding_screen.dart': [
            ('Dcouvrez', 'Découvrez'),
            ('prférée', 'préférée'),
            ('prférés', 'préférés'),
            ("l'accès à une variété", "l'accès à une variété"),
            ('À votre porte', 'À votre porte'),
            ('réseau de livreurs dévoués', 'réseau de livreurs dévoués'),
            ('sécurisée', 'sécurisée'),
        ]
    }
    
    fixed_files = 0
    total_changes = 0
    
    for file_path in files_to_fix:
        if not os.path.exists(file_path):
            print(f"File not found: {file_path}")
            continue
            
        try:
            # Read file
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
            
            original_content = content
            changes_made = 0
            
            # Apply replacements for this file
            if file_path in replacements:
                for old_text, new_text in replacements[file_path]:
                    if old_text in content:
                        content = content.replace(old_text, new_text)
                        changes_made += 1
                        print(f"  Fixed: {old_text} -> {new_text}")
            
            # Write back if changes were made
            if content != original_content:
                with open(file_path, 'w', encoding='utf-8') as f:
                    f.write(content)
                fixed_files += 1
                total_changes += changes_made
                print(f"Fixed {file_path} ({changes_made} changes)")
            else:
                print(f"No changes needed in {file_path}")
                
        except Exception as e:
            print(f"Error processing {file_path}: {e}")
    
    print(f"\nSummary:")
    print(f"Files fixed: {fixed_files}")
    print(f"Total changes: {total_changes}")

if __name__ == '__main__':
    print("Manual encoding fix script")
    print("=" * 50)
    fix_encoding_issues()
    print("Done!")
