import 'package:flutter/material.dart';
import 'package:incube/home/dealDetailsmodels.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/models/ModelProvider.dart';

class OrganizationProvider extends ChangeNotifier {
  List<Team> _teamsList = [
    Team(idTeam: 'idTeam', teamName: 'team A', teamLeader: 'Vinay', member: [
      Members(
          userId: 'userId',
          memberName: 'memberName',
          memberEmail: 'memberEmail',
          deals: [])
    ], dealIDs: []),
    Team(idTeam: 'idTeam', teamName: 'team B', teamLeader: 'Vinay', member: [
      Members(
          userId: 'userId',
          memberName: 'memberName',
          memberEmail: 'memberEmail',
          deals: [])
    ], dealIDs: []),
    Team(idTeam: 'idTeam', teamName: 'team C', teamLeader: 'Vinay', member: [
      Members(
          userId: 'userId',
          memberName: 'memberName',
          memberEmail: 'memberEmail',
          deals: [])
    ], dealIDs: []),
    Team(idTeam: 'idTeam', teamName: 'team D', teamLeader: 'Vinay', member: [
      Members(
          userId: 'userId',
          memberName: 'memberName',
          memberEmail: 'memberEmail',
          deals: [])
    ], dealIDs: []),
    Team(idTeam: 'idTeam', teamName: 'team F', teamLeader: 'Vinay', member: [
      Members(
          userId: 'userId',
          memberName: 'memberName',
          memberEmail: 'memberEmail',
          deals: [])
    ], dealIDs: []),
    Team(idTeam: 'idTeam', teamName: 'team E', teamLeader: 'Vinay', member: [
      Members(
          userId: 'userId',
          memberName: 'memberName',
          memberEmail: 'memberEmail',
          deals: [])
    ], dealIDs: []),
    Team(idTeam: 'idTeam', teamName: 'team G', teamLeader: 'Vinay', member: [
      Members(
          userId: 'userId',
          memberName: 'memberName',
          memberEmail: 'memberEmail',
          deals: [])
    ], dealIDs: []),
    Team(idTeam: 'idTeam', teamName: 'team H', teamLeader: 'Vinay', member: [
      Members(
          userId: 'userId',
          memberName: 'memberName',
          memberEmail: 'memberEmail',
          deals: [])
    ], dealIDs: []),
    Team(idTeam: 'idTeam', teamName: 'team I', teamLeader: 'Vinay', member: [
      Members(
          userId: 'userId',
          memberName: 'memberName',
          memberEmail: 'memberEmail',
          deals: [])
    ], dealIDs: []),
    Team(idTeam: 'idTeam', teamName: 'team J', teamLeader: 'Vinay', member: [
      Members(
          userId: 'userId',
          memberName: 'memberName',
          memberEmail: 'memberEmail',
          deals: [])
    ], dealIDs: []),
    Team(idTeam: 'idTeam', teamName: 'team K', teamLeader: 'Vinay', member: [
      Members(
          userId: 'userId',
          memberName: 'memberName',
          memberEmail: 'memberEmail',
          deals: [])
    ], dealIDs: []),
  ];

  // Getter
  List<Team> get teamsList => _teamsList;
  // Setter
  set teamList(List<Team> temp) {
    _teamsList = temp;
    notifyListeners();
  }
}
