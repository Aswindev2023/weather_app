import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/views/famous_cities_weather.dart';
import 'package:weather_app/widgets/search_result_widget.dart';
import '../widgets/round_text_field.dart';
import '../views/gradient_container.dart';
import '../constants/text_styles.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late final TextEditingController _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = _searchQuery.isNotEmpty;

    return GradientContainer(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text('Pick Location', style: TextStyles.h1),
        ),
        const SizedBox(height: 20),
        const Text(
          'Find the area or city that you want to know the detailed weather info at this time',
          style: TextStyles.subtitleText,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),

        // Search Row
        Row(
          children: [
            Expanded(
              child: RoundTextField(controller: _searchController),
            ),
            const SizedBox(width: 15),

            // Location Icon (Triggers Search)
            GestureDetector(
              onTap: () {
                setState(() {}); // Trigger search update
              },
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        // Show search results or famous cities
        isSearching
            ? SearchResultsWidget(searchQuery: _searchQuery)
            : const FamousCitiesWeather(),
      ],
    );
  }
}

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.location_on_outlined,
        color: AppColors.grey,
      ),
    );
  }
}
