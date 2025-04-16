import 'package:flutter/material.dart';
import 'package:aditjansa2226240064/Models/Bmkg.dart';
import 'package:aditjansa2226240064/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  List<Bmkg> _allBmkgs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBmkgs();
  }

  Future<void> _loadBmkgs() async {
    try {
      final data = await apiService.getAllBmkgs();
      setState(() {
        _allBmkgs = data.map((e) => Bmkg.fromJson(e)).toList();
        _isLoading = false;
      });
    } catch (e) {
      print('Gagal memuat data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Informasi Gempa BMKG')),
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : _allBmkgs.isEmpty
              ? Center(child: Text('Tidak ada data ditemukan'))
              : ListView.builder(
                itemCount: _allBmkgs.length,
                itemBuilder: (context, index) {
                  final item = _allBmkgs[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: ListTile(
                      title: Text(item.Wilayah),
                      subtitle: Text(
                        '${item.Tanggal} • Magnitudo: ${item.Magnitude}',
                      ),
                      trailing: Text(item.Jam),
                    ),
                  );
                },
              ),
    );
  }
}
