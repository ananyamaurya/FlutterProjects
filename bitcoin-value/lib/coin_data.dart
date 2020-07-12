import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

List<String> cryptoPrice = [
  '?',
  '?',
  '?',
];

class CurrencyRequest{

 final String _apiKEY  = '?apikey=AF3E47D3-C14F-4729-AF46-1AE30DC4C87F';
 String _currencyURL = 'https://rest.coinapi.io/v1/exchangerate/';


  Future<bool> updateCurrencies(String y) async{
    int i =0;
    for(String crypt in cryptoList){
      String x = await  getCurrencyRate(crypt, y);
      cryptoPrice[i] = x;
      i++;
    }
    return true;
  }

 Future<String> getCurrencyRate(String x,String y) async{
  
   String urlCurr = _currencyURL+x+'/'+y+_apiKEY;
   http.Response response = await http.get(urlCurr);
   if(response.statusCode == 200){
    String data = response.body;
    String rate = jsonDecode(data)['rate'].toStringAsFixed(2);
    return rate;
   }else{
     return "Connection Error";
   }

 }
}