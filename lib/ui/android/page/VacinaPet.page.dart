import 'package:flutter/material.dart';

class VaccinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: Text('Vacinas para Cães'),
          centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vacina Polivalente (V10)',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'A vacina polivalente V10 protege o seu cão e a sua família de doenças contagiosas e zoonoses que podem levar a óbito. Ela é composta de 3 ou 4 doses iniciais. A primeira, deve ser aplicada entre os primeiros 42 a 45 dias de vida do filhote. As doses seguintes devem ser realizadas com intervalos de 21 a 28 dias.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Polivalente V10 protege contra:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('- Cinomose;'),
            Text('- Parvovirose;'),
            Text('- Coronavirose;'),
            Text('- Hepatite Infecciosa Canina;'),
            Text('- Adenovirose;'),
            Text('- Parainfluenza Canina;'),
            Text('- Leptospirose Canina.'),
            SizedBox(height: 16.0),
            Text(
              'O reforço da vacina polivalente V10 é anual, calculado com base na data da última dose.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Vacina Antirrábica',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'A raiva é uma doença fatal em praticamente 100% dos casos, tanto em cães como em seres humanos. Ela provoca alterações neurológicas graves e pode ser transmitida dos pets para seus tutores através de arranhões e mordidas.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'A primeira dose da vacina antirrábica pode ser aplicada logo na fase de filhotes, a partir dos 3 meses de idade. Já o reforço dessas vacinas para cães devem ser feitos anualmente.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Vacina contra a gripe (Tosse dos Canis)',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'A tosse dos canis costuma cursar com tosse, coriza, febre e falta de apetite. Por vezes, parece que o cão está engasgado. O quadro pode, inclusive, evoluir para pneumonia, causando uma série de transtornos para toda a família.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'A vacina contra a gripe canina pode ser aplicada junto com a segunda dose da vacina polivalente (V10), por volta dos 80 dias de vida do pet. O veterinário deverá definir a necessidade da segunda dose de acordo com o tipo da vacina: injetável ou intranasal. O reforço dessas vacinas para cães devem ser feitos todos os anos.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Vacina contra Giárdia',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'A giardíase pode provocar diarréia, vômito, apatia e perda de peso. É uma importante zoonose, podendo ser transmitida para as pessoas a partir de animais infectados. A vacina pode ser aplicada a partir dos 2 meses de idade do pet. A segunda dose 3 – 4 semanas após a primeira é essencial para uma proteção adequada. O reforço é anual.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'A manutenção regular das condições de higiene dos cães também é um fator muito importante para a prevenção da giardíase.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Vacina contra Leishmaniose',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Os cães domésticos são considerados os principais reservatórios da Leishmaniose em áreas urbanas. A partir deles, algumas espécies de mosquitos podem espalhar a doença para toda a família.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'A leishmaniose é dividida em dois tipos: visceral ou tegumentar. Em humanos, a doença pode provocar desde feridas na pele e fraqueza, até aumento do baço, do fígado, problemas respiratórios, sangramentos e infecções por conta da queda da imunidade.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'As vacinas para cães contra leishmaniose devem ser feitas a partir de 4 meses de idade. O protocolo completo deve ser feito com 3 doses, respeitando o intervalo de 21 dias entre cada aplicação. A revacinação é anual, contada a partir da 1ª dose.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Cuide da saúde do seu Pet! Para mais informações sobre vacinas para cães, acesse o nosso Podcast “Grupo Hospitalar Pet Support” no Spotify. Fique atento também ao nosso blog e às nossas redes sociais.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Não esqueça: consulte o médico veterinário regularmente e siga o calendário de vacinas para cães corretamente. Os profissionais do Pet Support estão a sua disposição.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}