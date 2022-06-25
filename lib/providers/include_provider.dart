import 'package:provider/provider.dart';
import 'package:thecut/providers/app_provider.dart';
import 'package:thecut/providers/shop_provider.dart';

import 'client_provider.dart';

provider(ctxt,{String type='app',bool listen=false}){
  switch(type){
    case 'shop': return Provider.of<ShopProvider>(ctxt,listen:listen);
    case 'client': return Provider.of<ClientProvider>(ctxt,listen: listen);
    default:
      return Provider.of<AppProvider>(ctxt,listen: listen);
  }
}