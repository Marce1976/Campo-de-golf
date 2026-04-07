import 'package:flutter/material.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color glassColor = Colors.white.withOpacity(0.1);
    final Color glassBorder = Colors.white.withOpacity(0.2);

    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      body: SafeArea(
        child: Column(
          children: [
            // --- CABECERA CON BOTÓN VOLVER ---
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: glassColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: glassBorder),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Mis Reservas',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // --- TABS SELECTOR ---
            TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFFe8c547),
              indicatorWeight: 3,
              labelColor: const Color(0xFFe8c547),
              unselectedLabelColor: Colors.white54,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              tabs: const [
                Tab(text: "Green Fee"),
                Tab(text: "Accesorios"),
              ],
            ),

            const SizedBox(height: 20),

            // --- LISTADO SEGÚN PESTAÑA ---
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Pestaña 1: Green Fee
                  _buildList([
                    _itemReserva(context, "28 Mar", "Golf Club Real", "Hoyos: 18", "Tee Time: 09:30 AM", Icons.sports_golf, "Listo"),
                    _itemReserva(context, "02 Abr", "Green Valley", "Hoyos: 9", "Tee Time: 15:00 PM", Icons.map_outlined, "Listo"),
                  ]),

                  // Pestaña 2: Accesorios
                  _buildList([
                    _itemReserva(context, "28 Mar", "Set de Palos Callaway", "Modelo: Rogue ST", "Reserva #882", Icons.backpack_outlined, "Listo"),
                    _itemReserva(context, "24 Mar", "Carrito Eléctrico", "MGI Zip X1", "En campo - Hoyo 4", Icons.electric_rickshaw_outlined, "En uso"),
                    _itemReserva(context, "15 Mar", "Cesta de Bolas (x50)", "Driving Range", "Finalizado", Icons.adjust_rounded, "Recogido"),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),

      // --- BOTÓN FLOTANTE PARA AGREGAR EVENTOS ---
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFe8c547),
        child: const Icon(Icons.add, color: Color(0xFF1a1a2e), size: 30),
        onPressed: () => _showAddOptions(context),
      ),
    );
  }

  // --- MODAL INFERIOR PARA AGREGAR ---
  void _showAddOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1a1a2e),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 20),
            const Text("¿Qué quieres reservar?", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            _buildOptionTile(context, "Green Fee", Icons.flag_circle, "Reserva tu salida al campo"),
            const SizedBox(height: 12),
            _buildOptionTile(context, "Accesorios", Icons.shopping_bag_outlined, "Alquila palos o carritos"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context, String title, IconData icon, String sub) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: const Color(0xFF6BB062).withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, color: const Color(0xFF6BB062)),
      ),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text(sub, style: const TextStyle(color: Colors.white54, fontSize: 12)),
      onTap: () => Navigator.pop(context),
    );
  }

  Widget _buildList(List<Widget> items) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => items[index],
    );
  }

  // --- TARJETA DE RESERVA CON MENÚ DE TRES PUNTOS ---
  Widget _itemReserva(BuildContext context, String fecha, String titulo, String subtitulo, String infoExtra, IconData icon, String status) {
    Color statusColor;
    switch (status) {
      case "Recogido": statusColor = Colors.greenAccent; break;
      case "Listo": statusColor = const Color(0xFFe8c547); break;
      case "En uso": statusColor = Colors.blueAccent; break;
      default: statusColor = Colors.white54;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF6BB062).withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF6BB062), size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text("$fecha • $subtitulo", style: const TextStyle(color: Colors.white70, fontSize: 13)),
                Text(infoExtra, style: const TextStyle(color: Colors.white38, fontSize: 12)),
              ],
            ),
          ),
          Column(
            children: [
              // MENÚ DE TRES PUNTOS
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, color: Colors.white30, size: 20),
                color: const Color(0xFF1a1a2e),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                onSelected: (val) => print("Acción: $val sobre $titulo"),
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'edit', child: Text('Editar', style: TextStyle(color: Colors.white))),
                  const PopupMenuItem(value: 'cancel', child: Text('Cancelar', style: TextStyle(color: Colors.redAccent))),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: statusColor.withOpacity(0.4)),
                ),
                child: Text(status, style: TextStyle(color: statusColor, fontSize: 9, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

