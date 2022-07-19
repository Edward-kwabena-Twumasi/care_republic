enum UserType {
  client,
  barber,
  hairDresser,
  makeupArtist,
  merchant,
  makeup,
  unisex,
  saloon,
  barbering
}


enum WorkerType {
  barber,
  hairDresser,
  makeupArtist,
}

String getWorkerTypeNameByEnum(WorkerType workerType){
  switch(workerType){
    case WorkerType.barber:
      return 'Barber';
    case WorkerType.hairDresser:
      return 'Hair Dresser';
    case WorkerType.makeupArtist:
      return 'Makeup Artist';
  }
}



String getUserTypeNameByEnum(UserType userType){
  switch(userType){
    case UserType.client:
      return 'Client';
    case UserType.barber:
      return 'Barber';
    case UserType.hairDresser:
      return 'Hair Dresser';
    case UserType.makeupArtist:
      return 'Makeup Artist';
    case UserType.merchant:
      return 'Merchant';
    case UserType.makeup:
      return 'Makeup Shop';
    case UserType.unisex:
      return 'Unisex Saloon';
    case UserType.saloon:
      return 'Saloon';
    case UserType.barbering:
      return 'Barbering';
  }
}
