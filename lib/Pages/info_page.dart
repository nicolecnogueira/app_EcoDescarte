import 'package:flutter/material.dart';

class DicaInfo {
  final IconData icon;
  final String title;
  final String description;

  const DicaInfo({required this.icon, required this.title, required this.description});
}

final List<DicaInfo> dicas = [
  const DicaInfo(
    icon: Icons.recycling,
    title: 'Lave as Embalagens Recicláveis',
    description: 'Antes de descartar, lave embalagens como potes de iogurte e garrafas para remover restos de alimentos, evitando mau cheiro e contaminação.',
  ),
  const DicaInfo(
    icon: Icons.label_important_outline,
    title: 'Separe o Lixo Seco do Orgânico',
    description: 'Mantenha lixeiras separadas para resíduos orgânicos (restos de comida) e recicláveis (papel, plástico, metal, vidro). Isso é essencial para a coleta seletiva.',
  ),
  const DicaInfo(
    icon: Icons.computer,
    title: 'Descarte Correto de Eletrônicos',
    description: 'Celulares, computadores e outros eletrônicos contêm metais pesados. Nunca os jogue no lixo comum. Use o mapa para encontrar um ponto de coleta de lixo eletrônico.',
  ),
  const DicaInfo(
    icon: Icons.battery_charging_full,
    title: 'Pilhas e Baterias',
    description: 'Pilhas e baterias são resíduos perigosos. Devem ser descartadas em pontos de coleta específicos, como supermercados ou lojas de eletrônicos, que darão o destino correto.',
  ),
  const DicaInfo(
    icon: Icons.medication,
    title: 'Medicamentos Vencidos',
    description: 'Não jogue remédios no vaso sanitário ou no lixo. Eles podem contaminar a água e o solo. Procure farmácias que possuem programas de coleta para descarte seguro.',
  ),
];

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: dicas.length,
      itemBuilder: (context, index) {
        final dica = dicas[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Icon(
              dica.icon,
              size: 40,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              dica.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(dica.description),
            isThreeLine: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          ),
        );
      },
    );
  }
}