import 'dart:convert';

import 'package:ambrosino/DATA/Blocs/produit_bloc.dart';
import 'package:http/http.dart' as http; // add the http plugin in pubspec.yaml file.

class ProduitService {
  //static const ROOT = 'http://l3info-2019.una-ufrsfa.ci/g24/ambrosino_action.php';
  static const ROOT = 'http://10.0.3.2/ambrosino_action.php';
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL_PRODUCTS';
  static const _ADD_PRO_ACTION = 'ADD_PRODUCT';
  static const _UPDATE_PRO_ACTION = 'UPDATE_PRODUCT';
  static const _DELETE_PRO_ACTION = 'DELETE_PRODUCT';

  // Method to create the table Produits.
  static Future<String> createProduitTable() async {
    try {
      // add the parameters to pass to the request.
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Produit Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<List<Produit>> getProduits() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getProduits Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Produit> list = parseResponse(response.body);
        return list;
      } else {
        return List<Produit>();
      }
    } catch (e) {
      return List<Produit>(); // return an empty list on exception/error
    }
  }

  static List<Produit> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Produit>((json) => Produit.fromJson(json)).toList();
  }

  // Method to add Produit to the database...
  static Future<String> addProduit(String designation, String prix_unitaire,String descript) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_PRO_ACTION;
      map['designation'] = designation;
      map['prix_unitaire'] = prix_unitaire;
      map['descript'] = descript;
      final response = await http.post(ROOT, body: map);
      print('addProduit Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to update an Produit in Database...
  static Future<String> updateProduit(
      String proId, String designation, String prix_unitaire, String descript) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_PRO_ACTION;
      map['pro_id'] = proId;
      map['designation'] = designation;
      map['prix_unitaire'] = prix_unitaire;
      map['descript'] = descript;
      final response = await http.post(ROOT, body: map);
      print('updateProduit Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to Delete an Produit from Database...
  static Future<String> deleteProduit(String proId) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_PRO_ACTION;
      map['pro_id'] = proId;
      final response = await http.post(ROOT, body: map);
      print('deleteProduit Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // returning just an "error" string to keep this simple...
    }
  }
}