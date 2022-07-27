import 'dart:math';

String generateId(){
  int randomizer=Random().nextInt(999999);
  String uid=(DateTime.now().millisecondsSinceEpoch).toString()+randomizer.toString().padLeft(6,'0');
  print("Random ID Generated : $uid");
  return uid;
}



String getIdByRole(String uid,String role){
  print('UID - $uid');
  print('ROLE - $role');

  switch(role.toLowerCase()){
    case 'client': return uid+'-1';
    case 'barber': return uid+'-2';
    case 'hair dresser': return uid+'-3';
    case 'makeup artist': return uid+'-4';
    case 'merchant': return uid+'-5';
    case 'makeup': return uid+'-6';
    case 'unisex': return uid+'-7';
    case 'saloon': return uid+'-8';
    default : return uid+'-9';//barbering shop
  }
}

