import 'dart:ui' as ui
    show FontFeature, FontVariation, Shadow, TextLeadingDistribution;
import 'package:flutter/widgets.dart';

class TypographyWeight {
  TypographyWeight._();

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class TypographyStyle extends TextStyle {
  const TypographyStyle({
    super.color,
    super.backgroundColor,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.fontFamily,
    super.fontFamilyFallback,
    super.package,
    super.overflow,
  });

  TextStyle call({
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    ui.TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
    List<ui.FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? package,
    TextOverflow? overflow,
  }) {
    return copyWith(
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      leadingDistribution: leadingDistribution,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      fontVariations: fontVariations,
      decoration: decoration,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      package: package,
      overflow: overflow,
    );
  }

  TypographyStyle copy(TextStyle? other) {
    if (other == null) {
      return this;
    }
    return TypographyStyle(
      color: foreground == null && other.foreground == null
          ? other.color ?? color
          : null,
      backgroundColor: background == null && other.background == null
          ? other.backgroundColor ?? backgroundColor
          : null,
      fontSize: other.fontSize ?? fontSize,
      fontWeight: other.fontWeight ?? fontWeight,
      fontStyle: other.fontStyle ?? fontStyle,
      letterSpacing: other.letterSpacing ?? letterSpacing,
      wordSpacing: other.wordSpacing ?? wordSpacing,
      textBaseline: other.textBaseline ?? textBaseline,
      height: other.height ?? height,
      leadingDistribution: other.leadingDistribution ?? leadingDistribution,
      locale: other.locale ?? locale,
      foreground: other.foreground ?? foreground,
      background: other.background ?? background,
      shadows: other.shadows ?? shadows,
      fontFeatures: other.fontFeatures ?? fontFeatures,
      fontVariations: other.fontVariations ?? fontVariations,
      decoration: other.decoration ?? decoration,
      decorationColor: other.decorationColor ?? decorationColor,
      decorationStyle: other.decorationStyle ?? decorationStyle,
      decorationThickness: other.decorationThickness ?? decorationThickness,
      overflow: other.overflow ?? overflow,
    );
  }
}

class TypographyScheme extends TypographyStyle {
  /// Великий текст для виділених елементів та заголовків.
  ///
  /// Розмір шрифту: 57,
  ///
  /// Інтервал між словами: 0,
  ///
  /// Товщина шрифту: 400,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Display Large",
  ///     style: Style(
  ///       fontSize: 57,
  ///       wordSpacing: 0,
  ///       fontWeight: FontWeight.w400,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle displayLarge;

  /// Середній текст для виділених елементів та заголовків.
  ///
  /// Розмір шрифту: 45,
  ///
  /// Інтервал між словами: 0,
  ///
  /// Товщина шрифту: 400,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Display Medium",
  ///     style: Style(
  ///       fontSize: 45,
  ///       wordSpacing: 0,
  ///       fontWeight: FontWeight.w400,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle displayMedium;

  /// Малий текст для виділених елементів та заголовків.
  ///
  /// Розмір шрифту: 36,
  ///
  /// Інтервал між словами: 0,
  ///
  /// Товщина шрифту: 400,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Display Small",
  ///     style: Style(
  ///       fontSize: 36,
  ///       wordSpacing: 0,
  ///       fontWeight: FontWeight.w400,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle displaySmall;

  /// Великий текст для заголовків у змісті.
  ///
  /// Розмір шрифту: 32,
  ///
  /// Інтервал між словами: 0,
  ///
  /// Товщина шрифту: 400,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Заголовок сторінки",
  ///     style: Style(
  ///       fontSize: 32,
  ///       wordSpacing: 0,
  ///       fontWeight: FontWeight.w400,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle headlineLarge;

  /// Середній текст для заголовків у змісті.
  ///
  /// Розмір шрифту: 28,
  ///
  /// Інтервал між словами: 0,
  ///
  /// Товщина шрифту: [displayLargeFontSize],
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Headline Medium",
  ///     style: Style(
  ///       fontSize: 28,
  ///       wordSpacing: 0,
  ///       fontWeight: FontWeight.w400,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle headlineMedium;

  /// Малий текст для заголовків у змісті.
  ///
  /// Розмір шрифту: 24,
  ///
  /// Інтервал між словами: 0,
  ///
  /// Товщина шрифту: 400,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Headline Small",
  ///     style: Style(
  ///       fontSize: 24,
  ///       wordSpacing: 0,
  ///       fontWeight: FontWeight.w400,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle headlineSmall;

  /// Великий текст для заголовків сторінок.
  ///
  /// Розмір шрифту: 22,
  ///
  /// Інтервал між словами: 0,
  ///
  /// Товщина шрифту: 500,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Title Large",
  ///     style: Style(
  ///       fontSize: 22,
  ///       wordSpacing: 0,
  ///       fontWeight: FontWeight.w500,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle titleLarge;

  /// Середній текст для заголовків сторінок.
  ///
  /// Розмір шрифту: 16,
  ///
  /// Інтервал між словами: 0.15,
  ///
  /// Товщина шрифту: 500,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Title Medium",
  ///     style: Style(
  ///       fontSize: 16,
  ///       wordSpacing: 0.15,
  ///       fontWeight: FontWeight.w500,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle titleMedium;

  /// Малий текст для заголовків сторінок.
  ///
  /// Розмір шрифту: 14,
  ///
  /// Інтервал між словами: 0.1,
  ///
  /// Товщина шрифту: [TextFont(fontFamily).bodyLarge.fontWeight.value],
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Title Small",
  ///     style: Style(
  ///       fontSize: 14,
  ///       wordSpacing: 0.1,
  ///       fontWeight: FontWeight.w500,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle titleSmall;

  /// Великий текст для основного контенту.
  ///
  /// Розмір шрифту: 14,
  ///
  /// Інтервал між словами: 0.1,
  ///
  /// Товщина шрифту: 500,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Body Large",
  ///     style: Style(
  ///       fontSize: 14,
  ///       wordSpacing: 0.1,
  ///       fontWeight: FontWeight.w500,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle bodyLarge;

  /// Середній текст для основного контенту.
  ///
  /// Розмір шрифту: 12,
  ///
  /// Інтервал між словами: 0.5,
  ///
  /// Товщина шрифту: 500,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Body Medium",
  ///     style: Style(
  ///       fontSize: 12,
  ///       wordSpacing: 0.5,
  ///       fontWeight: FontWeight.w500,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle bodyMedium;

  /// Малий текст для основного контенту.
  ///
  /// Розмір шрифту: 11,
  ///
  /// Інтервал між словами: 0.5,
  ///
  /// Товщина шрифту: 500,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Body Small",
  ///     style: Style(
  ///       fontSize: 11,
  ///       wordSpacing: 0.5,
  ///       fontWeight: FontWeight.w500,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle bodySmall;

  /// Великий текст для підписів та міток.
  ///
  /// Розмір шрифту: 16,
  ///
  /// Інтервал між словами: 0.15,
  ///
  /// Товщина шрифту: 400,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Label Large",
  ///     style: Style(
  ///       fontSize: 16,
  ///       wordSpacing: 0.15,
  ///       fontWeight: FontWeight.w400,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle labelLarge;

  /// Середній текст для підписів та міток.
  ///
  /// Розмір шрифту: 14,
  ///
  /// Інтервал між словами: 0.25,
  ///
  /// Товщина шрифту: 400,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Label Medium",
  ///     style: Style(
  ///       fontSize: 14,
  ///       wordSpacing: 0.25,
  ///       fontWeight: FontWeight.w400,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle labelMedium;

  /// Малий текст для підписів та міток.
  ///
  /// Розмір шрифту: 12,
  ///
  /// Інтервал між словами: 0.4,
  ///
  /// Товщина шрифту: 400,
  /// {@tool snippet}
  ///
  /// ```dart
  /// Text("Label Small",
  ///     style: Style(
  ///       fontSize: 12,
  ///       wordSpacing: 0.4,
  ///       fontWeight: FontWeight.w400,
  ///     ))
  /// ```
  /// {@end-tool}
  final TypographyStyle labelSmall;

  TypographyScheme(
    String fontFamily, {
    displayLarge,
    displayMedium,
    displaySmall,
    headlineLarge,
    headlineMedium,
    headlineSmall,
    titleLarge,
    titleMedium,
    titleSmall,
    bodyLarge,
    bodyMedium,
    bodySmall,
    labelLarge,
    labelMedium,
    labelSmall,
  })  : displayLarge = TypographyStyle(
          color: null,
          fontSize: 57,
          height: 64 / 57,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(displayLarge),
        displayMedium = TypographyStyle(
          color: null,
          fontSize: 45,
          height: 52 / 45,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(displayMedium),
        displaySmall = TypographyStyle(
          color: null,
          fontSize: 36,
          height: 44 / 36,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(displaySmall),
        headlineLarge = TypographyStyle(
          color: null,
          fontSize: 32,
          height: 40 / 32,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(headlineLarge),
        headlineMedium = TypographyStyle(
          color: null,
          fontSize: 28,
          height: 36 / 28,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(headlineMedium),
        headlineSmall = TypographyStyle(
          color: null,
          fontSize: 24,
          height: 32 / 24,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(headlineSmall),
        titleLarge = TypographyStyle(
          color: null,
          fontSize: 22,
          height: 28 / 22,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(titleLarge),
        titleMedium = TypographyStyle(
          color: null,
          fontSize: 16,
          height: 24 / 16,
          wordSpacing: 0.15,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(titleMedium),
        titleSmall = TypographyStyle(
          color: null,
          fontSize: 14,
          height: 20 / 14,
          wordSpacing: 0.1,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(titleSmall),
        bodyLarge = TypographyStyle(
          color: null,
          fontSize: 14,
          height: 20 / 14,
          wordSpacing: 0.1,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(bodyLarge),
        bodyMedium = TypographyStyle(
          color: null,
          fontSize: 12,
          height: 16 / 12,
          wordSpacing: 0.5,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(bodyMedium),
        bodySmall = TypographyStyle(
          color: null,
          fontSize: 11,
          height: 16 / 11,
          wordSpacing: 0.5,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(bodySmall),
        labelLarge = TypographyStyle(
          color: null,
          fontSize: 16,
          height: 24 / 16,
          wordSpacing: 0.15,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(labelLarge),
        labelMedium = TypographyStyle(
          color: null,
          fontSize: 14,
          height: 20 / 14,
          wordSpacing: 0.25,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(labelMedium),
        labelSmall = TypographyStyle(
          color: null,
          fontSize: 12,
          height: 16 / 12,
          wordSpacing: 0.4,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(labelSmall),
        super(
          fontFamily: fontFamily,
          color: null,
        );
}
