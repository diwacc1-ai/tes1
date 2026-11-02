import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 24),
          const CircleAvatar(
            radius: 38,
            child: Icon(Icons.person_outline, size: 42),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              'Pengguna DapurKita',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const Center(
            child: Text(
              'pengguna@email.com',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Informasi profil'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _tampilkanPesan(context, 'Informasi profil'),
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Alamat pengiriman'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _tampilkanPesan(context, 'Alamat pengiriman'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar'),
            onTap: () => _tampilkanPesan(context, 'Keluar'),
          ),
        ],
      ),
    );
  }
}

void _tampilkanPesan(BuildContext context, String pesan) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('$pesan belum tersedia.')));
}
