import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

class LoadingWidget extends StatelessWidget {
  final double? size;
  final Color? color;

  const LoadingWidget({
    super.key,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? DesignTokens.iconLG,
        height: size ?? DesignTokens.iconLG,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? DesignTokens.primaryColor,
          ),
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
