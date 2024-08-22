import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dailywork/day21/getx/controller/covidController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CovidController covidController = Get.put(CovidController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Covid-19 Data"),
      ),
      body: Obx(
        () => covidController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: covidController.regionalList.length,
                itemBuilder: (context, index) {
                  final loc =
                      covidController.regionalList[index].loc ?? 'Unknown';
                  return Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              loc,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Confirmed Cases: ${covidController.regionalList[index].totalConfirmed ?? 0}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
      ),
    );
  }
}
