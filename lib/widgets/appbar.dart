import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final double height;
  final bool centerTitle;
  final double elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Widget? leading;
  final double? leadingWidth;
  final bool showBackButton;
  final IconData backIcon;
  final double backIconSize;
  final Color? backIconColor;
  final VoidCallback? onBack;
  final bool? automaticallyImplyLeading;
  final List<Widget>? actions;
  final double actionsIconThemePadding;
  final Color? backgroundColor;
  final List<Color>? gradientColors;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;
  final List<double>? gradientStops;
  final BoxDecoration? flexibleSpaceDecoration;
  final bool transparent;
  final Color? titleColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Color? foregroundColor;
  final bool forceMaterialTransparency;
  final ScrollNotificationPredicate? notificationPredicate;
  final Clip clipBehavior;
  final bool primary;
  final bool excludeHeaderSemantics;
  final Widget? flexibleSpace;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? toolbarHeight;
  final ShapeBorder? shape;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final TextStyle? toolbarTextStyle;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.height = 60.0,
    this.centerTitle = true,
    this.elevation = 0,
    this.shadowColor,
    this.surfaceTintColor,
    this.leading,
    this.leadingWidth,
    this.showBackButton = true,
    this.backIcon = Icons.arrow_back_ios,
    this.backIconSize = 24,
    this.backIconColor,
    this.onBack,
    this.automaticallyImplyLeading,
    this.actions,
    this.actionsIconThemePadding = 0,
    this.backgroundColor,
    this.gradientColors,
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
    this.gradientStops,
    this.flexibleSpaceDecoration,
    this.transparent = false,
    this.titleColor,
    this.titleFontSize = 20.0,
    this.titleFontWeight = FontWeight.bold,
    this.titleTextStyle,
    this.bottom,
    this.systemOverlayStyle,
    this.foregroundColor,
    this.forceMaterialTransparency = false,
    this.notificationPredicate,
    this.clipBehavior = Clip.none,
    this.primary = true,
    this.excludeHeaderSemantics = false,
    this.flexibleSpace,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.shape,
    this.iconTheme,
    this.actionsIconTheme,
    this.toolbarTextStyle,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(height + (bottom?.preferredSize.height ?? 0));

  /// Resolve the leading widget.
  Widget? _buildLeading(BuildContext context) {
    if (leading != null) return leading;
    if (!showBackButton) return const SizedBox.shrink();

    return IconButton(
      icon: Icon(
        backIcon,
        size: backIconSize,
        color: backIconColor ?? foregroundColor ?? Colors.white,
      ),
      onPressed: onBack ?? () => Get.back(),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
    );
  }

  /// Build flexible space with gradient or solid color.
  Widget? _buildFlexibleSpace() {
    if (flexibleSpace != null) return flexibleSpace;
    if (transparent) return null;

    if (flexibleSpaceDecoration != null) {
      return Container(decoration: flexibleSpaceDecoration);
    }

    if (gradientColors != null && gradientColors!.isNotEmpty) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors!,
            begin: gradientBegin,
            end: gradientEnd,
            stops: gradientStops,
          ),
        ),
      );
    }

    // Solid color handled by AppBar's backgroundColor.
    return null;
  }

  /// Build title widget.
  Widget _buildTitle() {
    if (titleWidget != null) return titleWidget!;

    final style =
        titleTextStyle ??
        TextStyle(
          color: titleColor ?? Colors.white,
          fontSize: titleFontSize,
          fontWeight: titleFontWeight,
        );

    return Text(
      title ?? '',
      style: style,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    final resolvedBg = transparent
        ? Colors.transparent
        : (gradientColors != null ? Colors.transparent : backgroundColor);

    return AppBar(
      leading: _buildLeading(context),
      leadingWidth: leadingWidth,
      automaticallyImplyLeading:
          automaticallyImplyLeading ?? (leading == null && showBackButton),
      title: _buildTitle(),
      centerTitle: centerTitle,
      actions: actions,
      flexibleSpace: _buildFlexibleSpace(),
      bottom: bottom,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor ?? Colors.transparent,
      backgroundColor: resolvedBg,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleTextStyle: titleTextStyle,
      toolbarTextStyle: toolbarTextStyle,
      systemOverlayStyle: systemOverlayStyle,
      forceMaterialTransparency: forceMaterialTransparency,
      clipBehavior: clipBehavior,
      toolbarHeight: toolbarHeight ?? height,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      shape: shape,
    );
  }
}

/// A sliver version of [CustomAppBar] for use in CustomScrollView.
class CustomSliverAppBar extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final double expandedHeight;
  final double collapsedHeight;
  final bool pinned;
  final bool floating;
  final bool snap;
  final bool stretch;
  final double stretchTriggerOffset;
  final VoidCallback? onStretchTrigger;
  final Widget? leading;
  final bool showBackButton;
  final IconData backIcon;
  final Color? backIconColor;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final List<Color>? gradientColors;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;
  final bool centerTitle;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final ShapeBorder? shape;
  final Color? titleColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const CustomSliverAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.expandedHeight = 200.0,
    this.collapsedHeight = 60.0,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.stretch = false,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.leading,
    this.showBackButton = true,
    this.backIcon = Icons.arrow_back_ios,
    this.backIconColor,
    this.onBack,
    this.actions,
    this.gradientColors,
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
    this.centerTitle = true,
    this.flexibleSpace,
    this.bottom,
    this.shape,
    this.titleColor,
    this.titleFontSize = 20.0,
    this.titleFontWeight = FontWeight.bold,
  });

  Widget? _buildLeading(BuildContext context) {
    if (leading != null) return leading;
    if (!showBackButton) return null;

    return IconButton(
      icon: Icon(
        backIcon,
        color: backIconColor ?? foregroundColor ?? Colors.white,
      ),
      onPressed: onBack ?? () => Get.back(),
    );
  }

  Widget _buildFlexibleSpace() {
    if (flexibleSpace != null) return flexibleSpace!;

    final hasGradient = gradientColors != null && gradientColors!.isNotEmpty;

    return FlexibleSpaceBar(
      centerTitle: centerTitle,
      title:
          titleWidget ??
          Text(
            title ?? '',
            style: TextStyle(
              color: titleColor ?? Colors.white,
              fontSize: titleFontSize,
              fontWeight: titleFontWeight,
            ),
          ),
      background: hasGradient
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors!,
                  begin: gradientBegin,
                  end: gradientEnd,
                ),
              ),
            )
          : Container(color: backgroundColor ?? AppColors.primary),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: _buildLeading(context),
      actions: actions,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      pinned: pinned,
      floating: floating,
      snap: snap,
      stretch: stretch,
      stretchTriggerOffset: stretchTriggerOffset,
      onStretchTrigger: onStretchTrigger != null
          ? () async => onStretchTrigger!()
          : null,
      elevation: elevation,
      backgroundColor: gradientColors != null
          ? Colors.transparent
          : backgroundColor,
      foregroundColor: foregroundColor,
      flexibleSpace: _buildFlexibleSpace(),
      bottom: bottom,
      shape: shape,
      centerTitle: centerTitle,
      surfaceTintColor: Colors.transparent,
    );
  }
}

/// A simple transparent AppBar for overlaying content.
class TransparentAppBar extends CustomAppBar {
  const TransparentAppBar({
    super.key,
    super.title,
    super.titleWidget,
    super.actions,
    super.leading,
    super.showBackButton = true,
    super.backIcon,
    super.backIconColor,
    super.onBack,
    super.foregroundColor = Colors.white,
    super.titleColor = Colors.white,
    super.elevation = 0,
    super.systemOverlayStyle = SystemUiOverlayStyle.light,
  }) : super(transparent: true);
}

/// AppBar with a search field built-in.
class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onBack;
  final VoidCallback? onClear;
  final bool autofocus;
  final Color? backgroundColor;
  final List<Color>? gradientColors;
  final Color? iconColor;
  final Color? textColor;
  final Color? hintColor;
  final double height;
  final List<Widget>? actions;
  final InputDecoration? inputDecoration;
  final TextStyle? textStyle;
  final bool showBackButton;
  final IconData backIcon;
  final bool showClearButton;

  const SearchAppBar({
    super.key,
    this.hintText = 'Search...',
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onBack,
    this.onClear,
    this.autofocus = true,
    this.backgroundColor,
    this.gradientColors,
    this.iconColor,
    this.textColor,
    this.hintColor,
    this.height = 60.0,
    this.actions,
    this.inputDecoration,
    this.textStyle,
    this.showBackButton = true,
    this.backIcon = Icons.arrow_back_ios,
    this.showClearButton = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? Colors.white;
    final effectiveTextColor = textColor ?? Colors.white;
    final effectiveHintColor = hintColor ?? Colors.white70;

    Widget? flexibleSpace;
    if (gradientColors != null && gradientColors!.isNotEmpty) {
      flexibleSpace = Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors!,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      );
    }

    return AppBar(
      backgroundColor: gradientColors != null
          ? Colors.transparent
          : backgroundColor,
      flexibleSpace: flexibleSpace,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: showBackButton
          ? IconButton(
              icon: Icon(backIcon, color: effectiveIconColor),
              onPressed: onBack ?? () => Get.back(),
            )
          : null,
      title: TextField(
        controller: controller,
        autofocus: autofocus,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        style: textStyle ?? TextStyle(color: effectiveTextColor),
        cursorColor: effectiveTextColor,
        decoration:
            inputDecoration ??
            InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: effectiveHintColor),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
      ),
      actions: [
        if (showClearButton)
          IconButton(
            icon: Icon(Icons.close, color: effectiveIconColor),
            onPressed: () {
              controller?.clear();
              onClear?.call();
            },
          ),
        ...?actions,
      ],
    );
  }
}

/// AppBar with tabs built-in.
class TabbedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget> tabs;
  final TabController? controller;
  final bool isScrollable;
  final Color? backgroundColor;
  final List<Color>? gradientColors;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final double height;
  final double tabBarHeight;
  final Widget? leading;
  final bool showBackButton;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final TabBarIndicatorSize indicatorSize;
  final EdgeInsetsGeometry? indicatorPadding;
  final Decoration? indicator;

  const TabbedAppBar({
    super.key,
    this.title,
    this.titleWidget,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.backgroundColor,
    this.gradientColors,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.height = 60.0,
    this.tabBarHeight = 48.0,
    this.leading,
    this.showBackButton = true,
    this.onBack,
    this.actions,
    this.indicatorSize = TabBarIndicatorSize.label,
    this.indicatorPadding,
    this.indicator,
  });

  @override
  Size get preferredSize => Size.fromHeight(height + tabBarHeight);

  @override
  Widget build(BuildContext context) {
    Widget? flexibleSpace;
    if (gradientColors != null && gradientColors!.isNotEmpty) {
      flexibleSpace = Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors!,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      );
    }

    return AppBar(
      backgroundColor: gradientColors != null
          ? Colors.transparent
          : backgroundColor,
      flexibleSpace: flexibleSpace,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading:
          leading ??
          (showBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: onBack ?? () => Get.back(),
                )
              : null),
      title:
          titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null),
      actions: actions,
      bottom: TabBar(
        controller: controller,
        tabs: tabs,
        isScrollable: isScrollable,
        indicatorColor: indicatorColor ?? Colors.white,
        labelColor: labelColor ?? Colors.white,
        unselectedLabelColor: unselectedLabelColor ?? Colors.white70,
        indicatorSize: indicatorSize,
        indicatorPadding: indicatorPadding ?? EdgeInsets.zero,
        indicator: indicator,
      ),
    );
  }
}
