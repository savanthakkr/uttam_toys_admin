import 'package:flutter/material.dart';
import 'package:uttam_toys/app_router.dart';
import 'package:uttam_toys/generated/l10n.dart';
import 'package:uttam_toys/views/widgets/portal_master_layout/portal_master_layout.dart';
import 'package:uttam_toys/views/widgets/portal_master_layout/sidebar.dart';

final sidebarMenuConfigs = [
  SidebarMenuConfig(
    uri: RouteUri.dashboard,
    icon: Icons.dashboard_rounded,
    title: (context) => Lang.of(context).dashboard,
  ),
  SidebarMenuConfig(
    uri: RouteUri.addCategory,
    icon: Icons.person_rounded,
    title: (context) => Lang.of(context).category(1),
  ),
  SidebarMenuConfig(
    uri: RouteUri.SubCategory,
    icon: Icons.person_rounded,
    title: (context) => Lang.of(context).subCategory(1),
  ),
  SidebarMenuConfig(
    uri: RouteUri.age,
    icon: Icons.person_rounded,
    title: (context) => Lang.of(context).age(1),
  ),
  SidebarMenuConfig(
    uri: RouteUri.brand,
    icon: Icons.person_rounded,
    title: (context) => Lang.of(context).brand(1),
  ),
  SidebarMenuConfig(
    uri: RouteUri.productScreen,
    icon: Icons.person_rounded,
    title: (context) => Lang.of(context).product(1),
  ),
  SidebarMenuConfig(
    uri: RouteUri.personalprofile,
    icon: Icons.person_rounded,
    title: (context) => Lang.of(context).personalprofile(1),
  ),
];

const localeMenuConfigs = [
  LocaleMenuConfig(
    languageCode: 'en',
    name: 'English',
  ),
  LocaleMenuConfig(
    languageCode: 'zh',
    scriptCode: 'Hans',
    name: '中文 (简体)',
  ),
  LocaleMenuConfig(
    languageCode: 'zh',
    scriptCode: 'Hant',
    name: '中文 (繁體)',
  ),
];
