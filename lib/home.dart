import 'package:flutter/material.dart';
import 'service_provider.dart';

void main() {
  runApp(ServiceProviderApp());
}

class ServiceProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Providers',
      home: ServiceProviderHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ServiceProviderHome extends StatefulWidget {
  @override
  _ServiceProviderHomeState createState() => _ServiceProviderHomeState();
}

class _ServiceProviderHomeState extends State<ServiceProviderHome> {
  List<ServiceProvider> allProviders = getServiceProviders();
  String selectedType = 'Any';
  String selectedProfession = 'Plumber';
  ServiceProvider? selectedProvider;

  List<String> professions = ['Plumber', 'Electrician', 'Carpenter'];

  List<ServiceProvider> getFilteredProviders() {
    return allProviders.where((provider) {
      bool matchesType = selectedType == 'Any' ||
          (selectedType == 'Individual' && provider.isIndividual) ||
          (selectedType == 'Company' && !provider.isIndividual);
      bool matchesProfession = provider.profession == selectedProfession;
      return matchesType && matchesProfession;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<ServiceProvider> filteredProviders = getFilteredProviders();

    return Scaffold(
      appBar: AppBar(
        title: Text('Service Providers'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Text(
              'Select Provider Type:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('Individual'),
                    leading: Radio<String>(
                      value: 'Individual',
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                          selectedProvider = null;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('Company'),
                    leading: Radio<String>(
                      value: 'Company',
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                          selectedProvider = null;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('Any'),
                    leading: Radio<String>(
                      value: 'Any',
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                          selectedProvider = null;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Select Profession:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedProfession,
              items: professions.map((profession) {
                return DropdownMenuItem<String>(
                  value: profession,
                  child: Text(profession),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedProfession = value!;
                  selectedProvider = null;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              'Select Provider:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            DropdownButton<ServiceProvider>(
              hint: Text('Select a Provider'),
              value: selectedProvider,
              items: filteredProviders.map((provider) {
                return DropdownMenuItem<ServiceProvider>(
                  value: provider,
                  child: Text(provider.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedProvider = value;
                });
              },
            ),
            SizedBox(height: 20),

            
            if (selectedProvider != null) ...[
              Divider(),
              Text(
                'Provider Details:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blueAccent),
              ),
              SizedBox(height: 10),
              Text(
                'Name: ${selectedProvider!.name}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Profession: ${selectedProvider!.profession}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Phone: ${selectedProvider!.phone}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Description: ${selectedProvider!.description}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }
}