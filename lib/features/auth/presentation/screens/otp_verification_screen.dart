import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import '../../../../core/router/route_names.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/design_tokens.dart';

/// OTP Verification Screen
class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  
  const OtpVerificationScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  bool _isLoading = false;
  bool _canResend = false;
  int _resendCountdown = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    _canResend = false;
    _resendCountdown = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendCountdown > 0) {
        setState(() {
          _resendCountdown--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      }
    });
  }

  void _onDigitChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }

    // Check if all fields are filled
    bool allFilled = _controllers.every((controller) => controller.text.isNotEmpty);
    if (allFilled) {
      _onVerifyPressed();
    }
  }

  void _onVerifyPressed() {
    String otp = _controllers.map((controller) => controller.text).join();
    
    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez entrer le code complet'),
          backgroundColor: DesignTokens.errorColor,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      
      // Navigate to home
      context.go(RouteNames.home);
    });
  }

  void _onResendPressed() {
    if (!_canResend) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Code de vérification renvoyé'),
        backgroundColor: DesignTokens.successColor,
      ),
    );
    
    _startResendTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: const Text('Vérification'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: DesignTokens.spaceXL),
              
              // Icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: DesignTokens.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.sms_outlined,
                  color: DesignTokens.primaryColor,
                  size: 40,
                ),
              ),
              
              const SizedBox(height: DesignTokens.spaceLG),
              
              // Header
              Text(
                'Vérification du code',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: DesignTokens.spaceXS),
              
              Text(
                'Nous avons envoyé un code de vérification à',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: DesignTokens.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: DesignTokens.spaceXS),
              
              Text(
                widget.phoneNumber,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: DesignTokens.fontWeightSemiBold,
                  color: DesignTokens.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: DesignTokens.spaceXXL),
              
              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    width: 50,
                    height: 60,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: DesignTokens.fontWeightBold,
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                          borderSide: const BorderSide(
                            color: DesignTokens.primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) => _onDigitChanged(value, index),
                      enabled: !_isLoading,
                    ),
                  );
                }),
              ),
              
              const SizedBox(height: DesignTokens.spaceXXL),
              
              // Verify Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _onVerifyPressed,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(DesignTokens.white),
                          ),
                        )
                      : const Text(
                          'Vérifier',
                          style: TextStyle(
                            fontSize: DesignTokens.fontSizeLG,
                            fontWeight: DesignTokens.fontWeightSemiBold,
                          ),
                        ),
                ),
              ),
              
              const SizedBox(height: DesignTokens.spaceLG),
              
              // Resend Code
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Vous n\'avez pas reçu le code ? '),
                  TextButton(
                    onPressed: _canResend ? _onResendPressed : null,
                    child: Text(
                      _canResend ? 'Renvoyer' : 'Renvoyer ($_resendCountdown)',
                      style: TextStyle(
                        color: _canResend ? DesignTokens.primaryColor : DesignTokens.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              // Change Number
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Changer le numéro de téléphone'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
