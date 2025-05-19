import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/project_card.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _originalProjectList = [
    {
      'title': 'Palampur-Bir-Barot',
      'language': 'Himachal Pradesh',
      'author': '7 Days',
      'grade': 'Paragliding',
      'image': 'assets/icons/Palampur-Bir-Barot.jpg',
    },
    {
      'title': 'Dayara Bugyal',
      'language': 'Uttarakhand',
      'author': '5 Days',
      'grade': 'Trek',
      'image': 'assets/icons/Dayara Bugyal.jpg',
    },
    {
      'title': 'Har Ki Dun',
      'language': 'Uttarakhand',
      'author': '6 Days',
      'grade': 'Trek',
      'image': 'assets/icons/Har Ki Dun.jpg',
    },
    {
      'title': 'Hidden Konkan',
      'language': 'Maharashtra',
      'author': '4 Days',
      'grade': 'Beach',
      'image': 'assets/icons/Hidden Konkan.jpg',
    },
    {
      'title': 'Kedarkantha',
      'language': 'Uttarakhand',
      'author': '6 Days',
      'grade': 'Snow Trek',
      'image': 'assets/icons/Kedarkantha.png',
    },
  ];

  late List<Map<String, String>> _filteredProjectList;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _filteredProjectList = List.from(_originalProjectList);
    _searchController.addListener(_filterProjects);
  }

  void _filterProjects() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProjectList = _originalProjectList.where((project) {
        return project['title']!.toLowerCase().contains(query) ||
            project['language']!.toLowerCase().contains(query) ||
            project['grade']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('Portfolio'),
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/shopping.svg',
                height: 24,
                width: 24,
                color: Colors.deepOrange,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/notification.svg',
                height: 24,
                width: 24,
                color: Colors.deepOrange,
              ),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.deepOrange,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600),
            tabs: const [
              Tab(text: "Project"),
              Tab(text: "Saved"),
              Tab(text: "Shared"),
              Tab(text: "Achievement"),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Material(
                elevation: 2,
                shadowColor: Colors.black26,
                borderRadius: BorderRadius.circular(12),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search a project',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.deepOrange,
                        size: 24,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 16),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.separated(
                      itemCount: _filteredProjectList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return ProjectCard(data: _filteredProjectList[index]);
                      },
                    ),
                    const Center(child: Text("No saved projects yet.")),
                    const Center(child: Text("No shared projects yet.")),
                    const Center(child: Text("No achievements available.")),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt),
          label: const Text("Filter"),
          backgroundColor: Colors.deepOrange,
          elevation: 4,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
