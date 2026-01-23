import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiss_army_component/swiss_army_component.dart';

/// Supported social login providers.
enum SocialProvider { google, apple, facebook, email }

/// A dedicated button for social login interactions.
///
/// Automatically handles branding (colors, icons) for supported providers.
///
/// Example:
/// ```dart
/// SocialLoginButton(
///   provider: SocialProvider.google,
///   onPressed: () => signInWithGoogle(),
/// );
/// ```
class SocialLoginButton extends StatelessWidget {
  final SocialProvider provider;
  final VoidCallback? onPressed;
  final String? label;
  final double? width;
  final double? height;
  final bool isLoading;
  final bool enabled;

  const SocialLoginButton({
    super.key,
    required this.provider,
    required this.onPressed,
    this.label,
    this.width,
    this.height,
    this.isLoading = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    // Determine style based on provider
    final config = _getProviderConfig(provider, context);

    return AppElevatedButton(
      onPressed: onPressed,
      title: label ?? config.defaultLabel,
      bgColor: config.bgColor,
      textColor: config.textColor,
      width: width,
      height: height,
      elevation: 0,
      side: config.borderSide,
      isLoading: isLoading,
      enabled: enabled,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIcon(config),
          SizedBox(width: 12),
          SmallAppText(
            label ?? config.defaultLabel,
            color: config.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(_SocialConfig config) {
    if (config.isSvg) {
      return SvgPicture.string(
        config.iconData as String,
        width: 20,
        height: 20,
      );
    } else {
      return Icon(
        config.iconData as IconData,
        color: config.iconColor,
        size: 20,
      );
    }
  }

  _SocialConfig _getProviderConfig(
    SocialProvider provider,
    BuildContext context,
  ) {
    switch (provider) {
      case SocialProvider.google:
        return _SocialConfig(
          defaultLabel: 'Continue with Google',
          bgColor: Colors.white,
          textColor: Colors.black87,
          iconData: _googleSvg,
          isSvg: true,
          borderSide: BorderSide(color: Colors.grey.shade300),
        );
      case SocialProvider.apple:
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return _SocialConfig(
          defaultLabel: 'Continue with Apple',
          bgColor: isDark ? Colors.white : Colors.black,
          textColor: isDark ? Colors.black : Colors.white,
          iconData: isDark ? _appleDarkSvg : _appleLightSvg,
          isSvg: true,
        );
      case SocialProvider.facebook:
        return _SocialConfig(
          defaultLabel: 'Continue with Facebook',
          bgColor: const Color(0xFF1877F2),
          textColor: Colors.white,
          iconData: _facebookSvg,
          isSvg: true,
        );
      case SocialProvider.email:
        return _SocialConfig(
          defaultLabel: 'Continue with Email',
          bgColor: Colors.grey.shade100,
          textColor: Colors.black,
          iconData: Icons.email_outlined,
          isSvg: false,
          iconColor: Colors.black,
        );
    }
  }
}

class _SocialConfig {
  final String defaultLabel;
  final Color bgColor;
  final Color textColor;
  final dynamic iconData; // String (SVG) or IconData
  final bool isSvg;
  final Color? iconColor;
  final BorderSide? borderSide;

  _SocialConfig({
    required this.defaultLabel,
    required this.bgColor,
    required this.textColor,
    required this.iconData,
    required this.isSvg,
    this.iconColor,
    this.borderSide,
  });
}

// --- SVG Assets ---

const _googleSvg =
    '''<svg viewBox="0 0 48 48" version="1.1" xmlns="http://www.w3.org/2000/svg"><path fill="#FFC107" d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12c0-6.627,5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24c0,11.045,8.955,20,20,20c11.045,0,20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"/><path fill="#FF3D00" d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"/><path fill="#4CAF50" d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"/><path fill="#1976D2" d="M43.611,20.083H42V20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"/></svg>''';

const _facebookSvg =
    '''<svg viewBox="0 0 48 48" version="1.1" xmlns="http://www.w3.org/2000/svg"><path fill="#FFFFFF" d="M24 4C12.954 4 4 12.954 4 24C4 33.856 11.206 42.067 20.655 43.766V29.351H15.826V24H20.655V19.721C20.655 14.935 23.498 12.288 27.818 12.288C29.887 12.288 32.052 12.658 32.052 12.658V17.357H29.667C27.29 17.357 26.549 18.831 26.549 21.054V24H31.841L30.995 29.351H26.549V43.844C36.326 42.348 44 34.026 44 24C44 12.954 35.046 4 24 4Z"/></svg>''';

// Apple logo (black for light mode)
const _appleLightSvg =
    '''<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path d="M22.842 22.847c-0.895 1.289-1.832 2.568-3.237 2.595-1.405 0.026-1.858-0.832-3.479-0.832s-2.105 0.816-3.416 0.868c-1.358 0.053-2.395-1.358-3.263-2.611-1.779-2.568-3.137-7.295-1.311-10.463 0.905-1.568 2.532-2.563 4.295-2.589 1.353-0.026 2.632 0.911 3.463 0.911 0.826 0 2.379-1.126 4.011-0.963 0.684 0.026 2.605 0.279 3.837 2.084-0.105 0.063-2.295 1.342-2.268 4.005 0.026 3.195 2.8 4.295 2.837 4.311-0.026 0.079-0.442 1.537-1.468 3.037zM20.258 7.642c0.758-0.921 1.268-2.2 1.132-3.484-1.089 0.042-2.411 0.726-3.195 1.642-0.705 0.816-1.321 2.126-1.153 3.384 1.216 0.095 2.458-0.611 3.216-1.542z" fill="#FFFFFF"/></svg>''';

// Apple logo (white for dark mode)
const _appleDarkSvg =
    '''<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path d="M22.842 22.847c-0.895 1.289-1.832 2.568-3.237 2.595-1.405 0.026-1.858-0.832-3.479-0.832s-2.105 0.816-3.416 0.868c-1.358 0.053-2.395-1.358-3.263-2.611-1.779-2.568-3.137-7.295-1.311-10.463 0.905-1.568 2.532-2.563 4.295-2.589 1.353-0.026 2.632 0.911 3.463 0.911 0.826 0 2.379-1.126 4.011-0.963 0.684 0.026 2.605 0.279 3.837 2.084-0.105 0.063-2.295 1.342-2.268 4.005 0.026 3.195 2.8 4.295 2.837 4.311-0.026 0.079-0.442 1.537-1.468 3.037zM20.258 7.642c0.758-0.921 1.268-2.2 1.132-3.484-1.089 0.042-2.411 0.726-3.195 1.642-0.705 0.816-1.321 2.126-1.153 3.384 1.216 0.095 2.458-0.611 3.216-1.542z" fill="#000000"/></svg>''';
