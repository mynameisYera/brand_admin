import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final VoidCallback? onSuccess;
  final String hint;
  final String title;
  final TextInputType keyboardType;
  final VoidCallback? underlineTap;
  final bool isPass;
  final bool obscure;
  final TextEditingController controller;
  final Widget? nextBtn;
  final String? Function(String?)? validator;
  final bool enabled;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool autofocus;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final bool filled;

  const CustomInputField({
    super.key,
    this.onSuccess,
    required this.hint,
    required this.title,
    required this.keyboardType,
    this.underlineTap,
    this.obscure = false,
    this.isPass = false,
    required this.controller,
    this.nextBtn,
    this.validator,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.textInputAction,
    this.focusNode,
    this.onTap,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderRadius = 12.0,
    this.contentPadding,
    this.hintStyle,
    this.textStyle,
    this.fillColor,
    this.filled = false,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  bool _isFocused = false;
  bool _isObscure = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscure;
    _focusNode = widget.focusNode ?? FocusNode();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
      if (_isFocused) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.title.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 4,
                          height: 16,
                          decoration: BoxDecoration(
                            color: _isFocused 
                                ? colorScheme.primary 
                                : colorScheme.onSurface.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: _isFocused 
                                  ? colorScheme.primary 
                                  : colorScheme.onSurface.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    boxShadow: _isFocused
                        ? [
                            BoxShadow(
                              color: (widget.focusedBorderColor ?? colorScheme.primary)
                                  .withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                  ),
                  child: TextFormField(
                    controller: widget.controller,
                    focusNode: _focusNode,
                    keyboardType: widget.keyboardType,
                    obscureText: _isObscure,
                    enabled: widget.enabled,
                    maxLines: widget.maxLines,
                    maxLength: widget.maxLength,
                    textInputAction: widget.textInputAction,
                    autofocus: widget.autofocus,
                    onTap: widget.onTap,
                    validator: widget.validator,
                    style: widget.textStyle ?? theme.textTheme.bodyLarge?.copyWith(
                      color: widget.enabled 
                          ? colorScheme.onSurface 
                          : colorScheme.onSurface.withOpacity(0.6),
                    ),
                    decoration: InputDecoration(
                      hintText: widget.hint,
                      hintStyle: widget.hintStyle ?? theme.textTheme.bodyLarge?.copyWith(
                        color: widget.enabled 
                            ? colorScheme.onSurface.withOpacity(0.5)
                            : colorScheme.onSurface.withOpacity(0.3),
                      ),
                      prefixIcon: widget.prefixIcon != null
                          ? Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Opacity(
                                opacity: widget.enabled ? 1.0 : 0.5,
                                child: widget.prefixIcon,
                              ),
                            )
                          : null,
                      suffixIcon: _buildSuffixIcon(),
                      border: _buildBorder(colorScheme),
                      enabledBorder: _buildBorder(
                        colorScheme,
                        color: widget.enabled 
                            ? (widget.borderColor ?? colorScheme.outline.withOpacity(0.3))
                            : colorScheme.outline.withOpacity(0.2),
                      ),
                      focusedBorder: _buildBorder(
                        colorScheme,
                        color: widget.focusedBorderColor ?? colorScheme.primary,
                        width: 2.0,
                      ),
                      errorBorder: _buildBorder(
                        colorScheme,
                        color: widget.errorBorderColor ?? colorScheme.error,
                        width: 2.0,
                      ),
                      focusedErrorBorder: _buildBorder(
                        colorScheme,
                        color: widget.errorBorderColor ?? colorScheme.error,
                        width: 2.0,
                      ),
                      disabledBorder: _buildBorder(
                        colorScheme,
                        color: colorScheme.outline.withOpacity(0.2),
                      ),
                      filled: true,
                      fillColor: widget.fillColor ?? 
                          (widget.enabled 
                              ? (widget.filled ? colorScheme.surface : colorScheme.surface.withOpacity(0.05))
                              : colorScheme.surface.withOpacity(0.1)),
                      contentPadding: widget.contentPadding ?? 
                          const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 16.0,
                          ),
                      counterText: '',
                    ),
                    onChanged: (value) {
                      if (widget.onSuccess != null && value.isNotEmpty) {
                        widget.onSuccess!();
                      }
                    },
                  ),
                ),
                if (widget.nextBtn != null) ...[
                  const SizedBox(height: 12.0),
                  widget.nextBtn!,
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.suffixIcon != null) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Opacity(
          opacity: widget.enabled ? 1.0 : 0.5,
          child: widget.suffixIcon,
        ),
      );
    }
    
    if (widget.isPass) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(
              widget.enabled ? 0.6 : 0.3,
            ),
          ),
          onPressed: widget.enabled ? () {
            setState(() {
              _isObscure = !_isObscure;
            });
          } : null,
        ),
      );
    }
    
    return null;
  }

  OutlineInputBorder _buildBorder(
    ColorScheme colorScheme, {
    Color? color,
    double width = 1.0,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(
        color: color ?? 
            (widget.borderColor ?? colorScheme.outline.withOpacity(0.3)),
        width: width,
      ),
    );
  }
}