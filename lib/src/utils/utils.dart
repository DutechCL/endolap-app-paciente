import 'package:endolap_paciente_app/src/models/procedure_list2_model.dart';
import 'package:flutter/material.dart';

class Utils {
  Widget buildTeamMembers(List<Team>? teams) {
    List<Widget> members = [];

    for (var team in teams!) {
      members.add(
        Row(
          children: [
            Text("${team.professional?.professionalProfiles?.name}:"),
            const SizedBox(width: 7),
            Text("${team.professional?.name ?? ''} ${team.professional?.lastName ?? ''}"),
          ],
        )
      );

      members.add(const SizedBox(height: 5));
    }

    return Column(
      children: members,
    );
  }
}