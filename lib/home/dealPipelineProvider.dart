import 'package:flutter/material.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/models/ModelProvider.dart';

class DealsPipelineProvider extends ChangeNotifier {
  List<Deals?> _allDeals = [
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'All deals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'All deals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'All deals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'All deals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'All deals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'All deals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'All deals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'All deals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'All deals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'All deals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
  ];
  List<Deals?> _inProcessDeals = [
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'inProcessDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
  ];
  List<Deals?> _unAssignedDeals = [
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'unAssignedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
  ];
  List<Deals?> _completedDeals = [
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
    Deals(
        idDeal: 'idDeal',
        teamName: '',
        teamId: 'teamId',
        company_logo: 'company_logo',
        company_name: 'completedDeals',
        company_description:
            'This is a mini description to describe the product for better context.',
        seeking: '50m',
        status: 'Pending',
        calls: DealsCall(tabContent: [
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
          ]),
          tabContentList(tabDetailsList: [
            tabDetails(
                tabContentHeader: 'About the company1 /// 1',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
            tabDetails(
                tabContentHeader: 'About the company1 /// 2',
                tabContentBody:
                    'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
          ])
        ], tabList: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ], tabTitles: [
          'Tab1',
          'Tab2',
          'Tab3',
          'Tab4'
        ]),
        meetings: [],
        documents: []),
  ];
  List<Deals?> _showList = [];
  // Getter
  List<Deals?> get allDeals => _allDeals;
  List<Deals?> get inProcessDeals => _inProcessDeals;
  List<Deals?> get unAssignedDeals => _unAssignedDeals;
  List<Deals?> get completedDeals => _completedDeals;
  List<Deals?> get showList => _showList;

  // Setter
  set allDealList(List<Deals?> temp) {
    _allDeals = temp;
    _showList = _allDeals;
    notifyListeners();
  }

  set inProcessDeals(List<Deals?> temp) {
    _inProcessDeals = temp;
    notifyListeners();
  }

  set unAssignedDeals(List<Deals?> temp) {
    _unAssignedDeals = temp;
    notifyListeners();
  }

  set completedDeals(List<Deals?> temp) {
    _completedDeals = temp;
    notifyListeners();
  }

  void assignDealToDeal(int index, String teamId, Deals deal) {
    _allDeals.removeAt(index);
    _inProcessDeals.add(deal);
    notifyListeners();
  }

  void settabIndex(int index) {
    switch (index) {
      case 0:
        _showList = _allDeals;
        break;
      case 1:
        _showList = _inProcessDeals;
        break;
      case 2:
        _showList = _unAssignedDeals;
        break;
      case 3:
        _showList = _completedDeals;
        break;
      default:
        _showList = _allDeals;
        break;
    }
    notifyListeners();
  }
}
