import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/base/state/base_state.dart';
import '../core/modules/navigate/manager.dart';

class CameloottAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool transparent;
  final Widget? customRightIcon;
  final Widget? customLeftIcon;
  final bool backIconVisible;
  final Widget? customIcon;
  final bool leadingBackgroundActive;

  const CameloottAppBar({
    Key? key,
    this.title,
    this.transparent = true,
    this.customRightIcon,
    this.customLeftIcon,
    this.backIconVisible = false,
    this.customIcon,
    this.leadingBackgroundActive = false,
  }) : super(key: key);

  @override
  State<CameloottAppBar> createState() => _CameloottAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CameloottAppBarState extends BaseState<CameloottAppBar> {
  bool transparent = false;

  @override
  void initState() {
    super.initState();
    transparent = widget.transparent;
  }

  Color get backgroundColor {
    if (transparent) {
      return Colors.transparent;
    } else {
      // main=> return colorScheme.background;
      return ColorUtility.primary;
    }
  }

  onPressed() {
    NavigationManager.instance.pop();
  }

  get titleColor {
    if (transparent) {
      return Colors.black;
    } else {
      // main => return colorScheme.primary;
      return ColorUtility.background;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: ColorUtility.background),
      backgroundColor: backgroundColor,
      centerTitle: true,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: titleColor),
      elevation: transparent ? 0.0 : themeData.appBarTheme.elevation,
      // main => title: widget.title != null ? Text(widget.title ?? "", style: textTheme.headlineMedium!.copyWith(color: colorScheme.primary)) : null,
      title: widget.title != null ? Text(widget.title ?? "", style: textTheme.headlineMedium!.copyWith(color: titleColor)) : null,
      leadingWidth: widget.customLeftIcon != null ? 80 : 56,
      leading: Visibility(
        visible: widget.customLeftIcon == null,
        replacement: widget.customLeftIcon ?? const SizedBox(),
        child: Visibility(
          visible: widget.backIconVisible,
          child: Padding(
            padding: paddings.l(sizes.s10),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => NavigationManager.instance.pop(),
              child: CircleAvatar(
                backgroundColor: widget.leadingBackgroundActive ? colorScheme.background : Colors.transparent,
                child: Icon(Icons.chevron_left, color: colorScheme.primary, size: sizes.s32),
              ),
            ),
          ),
        ),
      ),
      actions: [widget.customRightIcon ?? const SizedBox(), SizedBox(width: sizes.s20)],
    );
  }
}
