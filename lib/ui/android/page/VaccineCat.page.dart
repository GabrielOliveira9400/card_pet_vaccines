import 'package:flutter/material.dart';

class VaccineCatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: Text('Vacinação de Gatos'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quando começar a vacinação?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'A primeira vacinação de gatos deve ocorrer entre seis e oito semanas de vida do filhote. Nessa idade, os gatos estão maduros o suficiente para desenvolver anticorpos de forma eficaz. Antes disso, os anticorpos passados pela mãe podem inativar parte da vacinação.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Polivalente: uma vacina, muitas proteções',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Existem duas categorias de vacinas para gatos: as polivalentes e a antirrábica. A vacina polivalente protege contra várias doenças infectocontagiosas que os gatos podem contrair. As versões incluem V3, V4 e V5, que protegem contra diferentes doenças, como panleucopenia felina, calicivirose, rinotraqueíte e leucemia viral felina.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Recomendações sobre a vacina polivalente',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'A vacinação inicial de gatos filhotes ocorre entre seis e oito semanas de idade, com duas doses adicionais com intervalo de quatro semanas entre elas. Para gatos com mais de seis meses, são necessárias apenas duas doses com o mesmo intervalo.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Antirrábica: uma proteção indispensável',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Além da vacina polivalente, a vacina antirrábica é essencial para gatos. Geralmente, é aplicada quando o gato tem 12 semanas de idade ou após a última dose da vacina polivalente. A raiva é uma doença fatal e a vacinação contra ela é crucial para proteger o gato e a família.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Raiva em felinos: uma zoonose importante',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'A raiva em felinos pode ocorrer quando o gato entra em contato com um animal infectado. A doença é fatal e pode ser transmitida para humanos através de mordidas e arranhões. Portanto, a vacina antirrábica é essencial para proteger o gato e a família.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Reforçando a vacinação',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'É importante seguir o calendário de vacinação recomendado pelo veterinário e garantir os reforços anuais das vacinas para manter o gato protegido contra doenças graves.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}