// praktikum 9

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const PokeApp());
// }

// class PokeApp extends StatelessWidget {
//   const PokeApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'PokeAPI Demo',
//       theme: ThemeData(primarySwatch: Colors.red),
//       home: const PokemonPage(),
//     ); // MaterialApp
//   }
// }

// class PokemonPage extends StatefulWidget {
//   const PokemonPage({super.key});

//   @override
//   _PokemonPageState createState() => _PokemonPageState();
// }

// class _PokemonPageState extends State<PokemonPage> {
//   // State untuk menyimpan data
//   Map<String, dynamic>? pokemonData;
//   bool isLoading = false;
//   String? error;

//   @override
//   void initState() {
//     super.initState();
//     // Otomatis ambil data saat pertama kali dimuat
//     fetchPokemon(); 
//   }

//   // --- Fungsi untuk Mengambil Data Pokemon ---
//   Future<void> fetchPokemon() async {
//     setState(() {
//       isLoading = true;
//       error = null;
//     });

//     try {
//       final response = await http
//           .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/ditto'))
//           .timeout(const Duration(seconds: 15));

//       if (response.statusCode == 200) {
//         setState(() {
//           pokemonData = jsonDecode(response.body) as Map<String, dynamic>;
//         });
//       } else {
//         setState(() {
//           error = 'Gagal memuat data. Status: ${response.statusCode}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         error = 'Terjadi kesalahan: $e';
//       });
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   // --- Widget Card Tampilan Pokemon ---
//   Widget _buildPokemonCard() {
//     if (isLoading) {
//       return const CircularProgressIndicator();
//     }

//     if (error != null) {
//       return Text(error!, style: const TextStyle(color: Colors.red));
//     }
    
//     // Tampilkan pesan jika data kosong (setelah loading/error)
//     if (pokemonData == null) {
//       return const Text('Tekan tombol refresh untuk memuat data.');
//     }

//     // Ekstraksi data
//     final name = pokemonData!['name'] ?? '-';
//     final id = pokemonData!['id'] ?? '-';
//     // Data height dan weight biasanya dalam desimeter/hektogram, tapi di sini ditampilkan mentah
//     final height = pokemonData!['height'] ?? '-'; 
//     final weight = pokemonData!['weight'] ?? '-';
//     // Ambil URL sprite, fallback ke placeholder jika tidak ada
//     final sprite = pokemonData!['sprites']?['front_default'] ?? 'https://via.placeholder.com/150';

//     return Card(
//       margin: const EdgeInsets.all(20),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Image.network(sprite, width: 150, height: 150),
//             const SizedBox(height: 10),
//             Text(
//               name.toString().toUpperCase(),
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.redAccent,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text('ID: $id'),
//             Text('Height: $height'),
//             Text('Weight: $weight'),
//           ],
//         ),
//       ),
//     ); // Card
//   }

//   // --- Build UI Halaman ---
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('PokeAPI - Ditto')),
//       body: Center(child: _buildPokemonCard()),
//       floatingActionButton: FloatingActionButton(
//         onPressed: fetchPokemon,
//         tooltip: 'Refresh Data',
//         child: const Icon(Icons.refresh),
//       ), // FloatingActionButton
//     ); // Scaffold
//   }
// }



// praktikum 8 
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // =========================================================================
// // Konfigurasi API
// // =========================================================================

// class ApiConfig {
//   static const String baseUrl = 'https://pasy.wiremockapi.cloud'; // Ganti sesuai WireMock kamu
//   static const String usersEndpoint = '/users';

//   static Map<String, String> headers = {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//   };
// }

// // =========================================================================
// // MAIN APP
// // =========================================================================

// void main() {
//   runApp(const WireMockApp());
// }

// class WireMockApp extends StatelessWidget {
//   const WireMockApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'WireMock Cloud Demo',
//       theme: ThemeData(primarySwatch: Colors.indigo),
//       home: const UserPage(),
//     ); // MaterialApp
//   }
// }

// // =========================================================================
// // UI: UserPage
// // =========================================================================

// class UserPage extends StatefulWidget {
//   const UserPage({super.key});

//   @override
//   _UserPageState createState() => _UserPageState();
// }

// class _UserPageState extends State<UserPage> {
//   // Controllers untuk input form
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();

//   // State Management
//   List<dynamic> users = [];
//   bool isLoading = false;
//   String? errorMessage;
//   String? postMessage; // Tambahkan ini untuk menampilkan hasil POST

//   @override
//   void initState() {
//     super.initState();
//     fetchUsers();
//   }

//   // /// GET users
//   Future<void> fetchUsers() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });

//     final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.usersEndpoint}');

//     try {
//       final response = await http
//           .get(url, headers: ApiConfig.headers)
//           .timeout(const Duration(seconds: 10));

//       if (response.statusCode == 200) {
//         final List<dynamic> data = jsonDecode(response.body);
//         setState(() => users = data);
//       } else {
//         setState(() => errorMessage = 'Error ${response.statusCode}');
//       }
//     } catch (e) {
//       setState(() => errorMessage = 'Error: $e');
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   // /// POST new user
//   Future<void> addUser() async {
//     final name = _nameController.text.trim();
//     final email = _emailController.text.trim();

//     if (name.isEmpty || email.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Nama & Email tidak boleh kosong')),
//       );
//       return;
//     }

//     final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.usersEndpoint}');
//     final body = jsonEncode({'name': name, 'email': email});

//     try {
//       final response = await http
//           .post(url, headers: ApiConfig.headers, body: body)
//           .timeout(const Duration(seconds: 10));

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final Map<String, dynamic> result = jsonDecode(response.body);
        
//         setState(() {
//           // Ambil pesan dari respons atau gunakan pesan default
//           postMessage = result['message'] ?? 'User berhasil ditambahkan!';
//         });
        
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(postMessage!)));
        
//         // Bersihkan input dan muat ulang daftar
//         _nameController.clear();
//         _emailController.clear();
//         fetchUsers();
//       } else {
//         setState(() {
//           postMessage = 'Gagal menambah user (${response.statusCode})';
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(postMessage!)));
//       }
//     } catch (e) {
//       setState(() => postMessage = 'Error: $e');
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(postMessage!)));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('WireMock Cloud - Users')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // Input form
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(
//                 labelText: 'Nama',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton.icon(
//               icon: const Icon(Icons.add),
//               label: const Text('Tambah User'),
//               onPressed: addUser,
//             ),
//             const SizedBox(height: 20),

//             // Tampilan Pesan POST
//             if (postMessage != null) ...[
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.green[50],
//                   border: Border.all(color: Colors.green),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   postMessage!,
//                   style: TextStyle(
//                     color: Colors.green,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],

//             const Divider(),
            
//             const Text(
//               'Daftar User',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const Divider(),

//             // Data list
//             Expanded(
//               child: isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : errorMessage != null
//                       ? Center(child: Text(errorMessage!))
//                       : users.isEmpty
//                           ? const Center(child: Text('Belum ada data.'))
//                           : ListView.builder(
//                               itemCount: users.length,
//                               itemBuilder: (context, index) {
//                                 final user = users[index];
//                                 return ListTile(
//                                   leading: CircleAvatar(
//                                       child: Text('${user['id']}')),
//                                   title: Text(user['name']),
//                                   subtitle: Text(user['email']),
//                                 );
//                               },
//                             ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: fetchUsers,
//         child: const Icon(Icons.refresh),
//       ),
//     ); // Scaffold
//   }
// }

// praktikum 7
// import 'dart:io';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

// // =========================================================================
// // SERVICE: FileService - util dasar untuk file handling
// // =========================================================================

// class FileService {
//   Future<Directory> get documentsDirectory async {
//     return await getApplicationDocumentsDirectory();
//   }

//   Future<File> writeFile(String fileName, String content) async {
//     final Directory dir = await documentsDirectory;
//     final File file = File(path.join(dir.path, fileName));
//     return file.writeAsString(content);
//   }

//   Future<String> readFile(String fileName) async {
//     try {
//       final Directory dir = await documentsDirectory;
//       final File file = File(path.join(dir.path, fileName));
//       return await file.readAsString();
//     } catch (e) {
//       return '';
//     }
//   }

//   Future<bool> fileExists(String fileName) async {
//     final Directory dir = await documentsDirectory;
//     final File file = File(path.join(dir.path, fileName));
//     return file.exists();
//   }

//   Future<void> deleteFile(String fileName) async {
//     final Directory dir = await documentsDirectory;
//     final File file = File(path.join(dir.path, fileName));
//     if (await file.exists()) {
//       await file.delete();
//     }
//   }
// }

// // =========================================================================
// // SERVICE: DirectoryService - util directory management
// // =========================================================================

// class DirectoryService {
//   final FileService _fileService = FileService();

//   Future<Directory> createDirectory(String dirName) async {
//     final Directory appDir = await _fileService.documentsDirectory;
//     final Directory newDir = Directory(path.join(appDir.path, dirName));
//     if (!await newDir.exists()) {
//       await newDir.create(recursive: true);
//     }
//     return newDir;
//   }

//   Future<List<FileSystemEntity>> listFiles(String dirName) async {
//     final Directory dir = await createDirectory(dirName);
//     return dir.list().toList();
//   }

//   Future<void> deleteDirectory(String dirName) async {
//     final Directory appDir = await _fileService.documentsDirectory;
//     final Directory dir = Directory(path.join(appDir.path, dirName));
//     if (await dir.exists()) {
//       await dir.delete(recursive: true);
//     }
//   }
// }

// // =========================================================================
// // SERVICE: NoteService - simpan setiap note di file JSON
// // =========================================================================

// class NoteService {
//   final DirectoryService _dirService = DirectoryService();
//   final String _notesDir = 'notes';

//   // Method untuk menghapus note berdasarkan path absolut file
//   Future<void> deleteNoteByPath(String filePath) async {
//     final File file = File(filePath);
//     if (await file.exists()) {
//       await file.delete();
//     }
//   }

//   Future<void> saveNote({
//     required String title,
//     required String content,
//   }) async {
//     final Directory notesDir = await _dirService.createDirectory(_notesDir);
//     final String fileName =
//         '${DateTime.now().millisecondsSinceEpoch}.json'; // unik ID
//     final File file = File(path.join(notesDir.path, fileName));

//     final Map<String, dynamic> noteData = {
//       'title': title,
//       'content': content,
//       'created_at': DateTime.now().toIso8601String(),
//     };

//     await file.writeAsString(jsonEncode(noteData));
//   }

//   Future<List<Map<String, dynamic>>> getAllNotes() async {
//     final Directory notesDir = await _dirService.createDirectory(_notesDir);
//     final List<FileSystemEntity> files = await notesDir.list().toList();

//     List<Map<String, dynamic>> notes = [];
//     for (var entity in files) {
//       if (entity is File && entity.path.endsWith('.json')) {
//         final File file = entity;
//         final String content = await file.readAsString();
//         Map<String, dynamic> jsonData =
//             jsonDecode(content) as Map<String, dynamic>;

//         // Tambahkan path file ke data agar bisa dihapus nanti
//         jsonData['file_path'] = entity.path;

//         notes.add(jsonData);
//       }
//     }

//     // Urutkan dari terbaru (descending)
//     notes.sort(
//       (a, b) =>
//           b['created_at'].toString().compareTo(a['created_at'].toString()),
//     );

//     return notes;
//   }
// }

// // =========================================================================
// // UI: Flutter Notes App
// // =========================================================================

// void main() {
//   runApp(const NotesApp());
// }

// class NotesApp extends StatelessWidget {
//   const NotesApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Notes (Local File)',
//       theme: ThemeData(primarySwatch: Colors.indigo),
//       home: const NotesPage(),
//     ); // MaterialApp
//   }
// }

// // --- Halaman Utama Daftar Catatan ---
// class NotesPage extends StatefulWidget {
//   const NotesPage({super.key});

//   @override
//   _NotesPageState createState() => _NotesPageState();
// }

// class _NotesPageState extends State<NotesPage> {
//   final NoteService _noteService = NoteService();
//   List<Map<String, dynamic>> _notes = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadNotes();
//   }

//   Future<void> _loadNotes() async {
//     final notes = await _noteService.getAllNotes();
//     setState(() => _notes = notes);
//   }

//   Future<void> _addNote() async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const AddNotePage()),
//     );
//     // Jika result == true, artinya catatan baru telah disimpan
//     if (result == true) {
//       _loadNotes();
//     }
//   }

//   Future<void> _deleteNote(String filePath) async {
//     await _noteService.deleteNoteByPath(filePath);
//     _loadNotes();
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(const SnackBar(content: Text('Catatan dihapus!')));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('My Notes')),
//       body: _notes.isEmpty
//           ? const Center(child: Text('Belum ada catatan.'))
//           : ListView.builder(
//               itemCount: _notes.length,
//               itemBuilder: (context, index) {
//                 final note = _notes[index];
//                 return Card(
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 6,
//                   ),
//                   child: ListTile(
//                     title: Text(note['title']),
//                     subtitle: Text(
//                       note['content'],
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.delete, color: Colors.red),
//                       onPressed: () => _deleteNote(note['file_path']),
//                     ),
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => NoteDetailPage(note: note),
//                       ),
//                     ), // ListTile
//                   ),
//                 ); // Card
//               },
//             ), // ListView.builder
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addNote,
//         child: const Icon(Icons.add),
//       ), // FloatingActionButton
//     ); // Scaffold
//   }
// }

// // --- Halaman Tambah Catatan ---
// class AddNotePage extends StatefulWidget {
//   const AddNotePage({super.key});

//   @override
//   _AddNotePageState createState() => _AddNotePageState();
// }

// class _AddNotePageState extends State<AddNotePage> {
//   final NoteService _noteService = NoteService();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _contentController = TextEditingController();

//   Future<void> _saveNote() async {
//     if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Isi semua field dulu!')));
//       return;
//     }

//     await _noteService.saveNote(
//       title: _titleController.text,
//       content: _contentController.text,
//     );

//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(const SnackBar(content: Text('Catatan disimpan!')));
//     // Kembali ke halaman sebelumnya dan kirim sinyal 'true' bahwa data telah disimpan
//     Navigator.pop(context, true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Catatan Baru')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: _titleController,
//               decoration: const InputDecoration(labelText: 'Judul'),
//             ), // TextField
//             const SizedBox(height: 10),
//             Expanded(
//               child: TextField(
//                 controller: _contentController,
//                 decoration: const InputDecoration(labelText: 'Isi Catatan'),
//                 expands: true,
//                 maxLines: null,
//                 textAlignVertical: TextAlignVertical.top,
//               ), // TextField
//             ), // Expanded
//             const SizedBox(height: 20),
//             ElevatedButton.icon(
//               icon: const Icon(Icons.save),
//               label: const Text('Simpan'),
//               onPressed: _saveNote,
//             ), // ElevatedButton.icon
//           ],
//         ),
//       ), // Padding
//     ); // Scaffold
//   }
// }

// // --- Halaman Detail Catatan ---
// class NoteDetailPage extends StatelessWidget {
//   final Map<String, dynamic> note;

//   const NoteDetailPage({super.key, required this.note});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(note['title'] ?? 'Note')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(child: Text(note['content'] ?? '')),
//       ), // Padding
//     ); // Scaffold
//   }
// }


// praktikum 6
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

// =========================================================================
// SERVICE: FileService - util dasar untuk file handling
// =========================================================================

class FileService {
  Future<Directory> get documentsDirectory async {
    return await getApplicationDocumentsDirectory();
  }

  Future<File> writeFile(String fileName, String content) async {
    final Directory dir = await documentsDirectory;
    final File file = File(path.join(dir.path, fileName));
    return file.writeAsString(content);
  }

  Future<String> readFile(String fileName) async {
    try {
      final Directory dir = await documentsDirectory;
      final File file = File(path.join(dir.path, fileName));
      return await file.readAsString();
    } catch (e) {
      return '';
    }
  }

  Future<bool> fileExists(String fileName) async {
    final Directory dir = await documentsDirectory;
    final File file = File(path.join(dir.path, fileName));
    return file.exists();
  }

  Future<void> deleteFile(String fileName) async {
    final Directory dir = await documentsDirectory;
    final File file = File(path.join(dir.path, fileName));
    if (await file.exists()) {
      await file.delete();
    }
  }
}

// =========================================================================
// SERVICE: DirectoryService - util directory management
// =========================================================================

class DirectoryService {
  final FileService _fileService = FileService();

  Future<Directory> createDirectory(String dirName) async {
    final Directory appDir = await _fileService.documentsDirectory;
    final Directory newDir = Directory(path.join(appDir.path, dirName));
    if (!await newDir.exists()) {
      await newDir.create(recursive: true);
    }
    return newDir;
  }

  Future<List<FileSystemEntity>> listFiles(String dirName) async {
    final Directory dir = await createDirectory(dirName);
    return dir.list().toList();
  }

  Future<void> deleteDirectory(String dirName) async {
    final Directory appDir = await _fileService.documentsDirectory;
    final Directory dir = Directory(path.join(appDir.path, dirName));
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  }
}

// =========================================================================
// SERVICE: NoteService - simpan setiap note di file JSON
// =========================================================================

class NoteService {
  final DirectoryService _dirService = DirectoryService();
  final String _notesDir = 'notes';

  // Method untuk menghapus note berdasarkan path absolut file
  Future<void> deleteNoteByPath(String filePath) async {
    final File file = File(filePath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<void> saveNote({
    required String title,
    required String content,
  }) async {
    final Directory notesDir = await _dirService.createDirectory(_notesDir);
    final String fileName =
        '${DateTime.now().millisecondsSinceEpoch}.json'; // unik ID
    final File file = File(path.join(notesDir.path, fileName));

    final Map<String, dynamic> noteData = {
      'title': title,
      'content': content,
      'created_at': DateTime.now().toIso8601String(),
    };

    await file.writeAsString(jsonEncode(noteData));
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    final Directory notesDir = await _dirService.createDirectory(_notesDir);
    final List<FileSystemEntity> files = await notesDir.list().toList();

    List<Map<String, dynamic>> notes = [];
    for (var entity in files) {
      if (entity is File && entity.path.endsWith('.json')) {
        final File file = entity;
        final String content = await file.readAsString();
        Map<String, dynamic> jsonData =
            jsonDecode(content) as Map<String, dynamic>;

        // Tambahkan path file ke data agar bisa dihapus nanti
        jsonData['file_path'] = entity.path;

        notes.add(jsonData);
      }
    }

    // Urutkan dari terbaru (descending)
    notes.sort(
      (a, b) =>
          b['created_at'].toString().compareTo(a['created_at'].toString()),
    );

    return notes;
  }
}

// =========================================================================
// UI: Flutter Notes App
// =========================================================================

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notes (Local File)',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const NotesPage(),
    ); // MaterialApp
  }
}

// --- Halaman Utama Daftar Catatan ---
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NoteService _noteService = NoteService();
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await _noteService.getAllNotes();
    setState(() => _notes = notes);
  }

  Future<void> _addNote() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNotePage()),
    );
    // Jika result == true, artinya catatan baru telah disimpan
    if (result == true) {
      _loadNotes();
    }
  }

  Future<void> _deleteNote(String filePath) async {
    await _noteService.deleteNoteByPath(filePath);
    _loadNotes();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Catatan dihapus!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Notes')),
      body: _notes.isEmpty
          ? const Center(child: Text('Belum ada catatan.'))
          : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(note['title']),
                    subtitle: Text(
                      note['content'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteNote(note['file_path']),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteDetailPage(note: note),
                      ),
                    ), // ListTile
                  ),
                ); // Card
              },
            ), // ListView.builder
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.add),
      ), // FloatingActionButton
    ); // Scaffold
  }
}

// --- Halaman Tambah Catatan ---
class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final NoteService _noteService = NoteService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  Future<void> _saveNote() async {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field dulu!')));
      return;
    }

    await _noteService.saveNote(
      title: _titleController.text,
      content: _contentController.text,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Catatan disimpan!')));
    // Kembali ke halaman sebelumnya dan kirim sinyal 'true' bahwa data telah disimpan
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catatan Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ), // TextField
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Isi Catatan'),
                expands: true,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
              ), // TextField
            ), // Expanded
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Simpan'),
              onPressed: _saveNote,
            ), // ElevatedButton.icon
          ],
        ),
      ), // Padding
    ); // Scaffold
  }
}

// --- Halaman Detail Catatan ---
class NoteDetailPage extends StatelessWidget {
  final Map<String, dynamic> note;

  const NoteDetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(note['title'] ?? 'Note')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(child: Text(note['content'] ?? '')),
      ), // Padding
    ); // Scaffold
  }
}