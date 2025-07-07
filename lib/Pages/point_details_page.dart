import 'package:eco_descarte/Pages/agendmento_page.dart';
import 'package:flutter/material.dart';

class PointDetailsPage extends StatelessWidget {
  const PointDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Ponto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ecocentro Potengi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Endereço: Av. Dr. João Medeiros Filho, 1826 - Natal/RN'),
            const SizedBox(height: 8),
            const Text('Horário: Seg-Sex, 08:00 - 17:00'),
            const SizedBox(height: 8),
            const Text('Aceita: Eletrônicos, Plástico, Metal.'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.calendar_today),
                label: const Text('Agendar Coleta a Domicílio'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AgendamentoPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}