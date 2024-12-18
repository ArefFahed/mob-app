class ServiceProvider {
  final String name;
  final String profession;
  final String description;
  final String phone;
  final bool isIndividual;

  ServiceProvider({
    required this.name,
    required this.profession,
    required this.description,
    required this.phone,
    required this.isIndividual,
  });

  @override
  String toString() {
    return 'Name: $name\nProfession: $profession\nPhone: $phone\nDescription: $description';
  }
}

List<ServiceProvider> getServiceProviders() {
  return [
    ServiceProvider(
        name: 'jad smith',
        profession: 'Plumber',
        description: 'Expert in residential plumbing.',
        phone: '03127890',
        isIndividual: true),
    ServiceProvider(
        name: 'FixIt Corp',
        profession: 'Plumber',
        description: 'Company providing plumbing services.',
        phone: '07872261',
        isIndividual: false),
    ServiceProvider(
        name: 'Hilal Badawi',
        profession: 'Electrician',
        description: 'Licensed electrician for homes.',
        phone: '70112455',
        isIndividual: true),
    ServiceProvider(
        name: 'Spark Solutions',
        profession: 'Electrician',
        description: 'Best electrical company in the region.',
        phone: '81558899',
        isIndividual: false),
    ServiceProvider(
        name: 'Joe Jabr',
        profession: 'Carpenter',
        description: 'Skilled in custom woodwork.',
        phone: '03223566',
        isIndividual: true),
    ServiceProvider(
        name: 'WoodMasters',
        profession: 'Carpenter',
        description: 'Specializes in furniture design.',
        phone: '70669900',
        isIndividual: false),
    ServiceProvider(
        name: 'Alan Kakhi ',
        profession: 'Plumber',
        description: 'Fast and reliable plumbing solutions.',
        phone: '71445788',
        isIndividual: true),
    ServiceProvider(
        name: 'LightFix',
        profession: 'Electrician',
        description: 'Professional electrical repairs.',
        phone: '71334457',
        isIndividual: false),
    ServiceProvider(
        name: 'WoodCrafters',
        profession: 'Carpenter',
        description: 'Quality craftsmanship guaranteed.',
        phone: '81996655',
        isIndividual: false),
    ServiceProvider(
        name: 'Zahy Badr',
        profession: 'Plumber',
        description: 'Affordable and efficient plumbing.',
        phone: '78880011',
        isIndividual: true),
  ];
}


