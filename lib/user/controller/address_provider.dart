import 'package:e_commerce/user/models/address_model.dart';
import 'package:e_commerce/user/services/address_service.dart';
import 'package:e_commerce/user/models/user_model.dart';
import 'package:flutter/material.dart';
// import 'address_model.dart';
// import 'address_service.dart';

class AddressProvider with ChangeNotifier {
  final AddressService _addressService = AddressService();

  Address? _address;
  Address? get address => _address;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchAddress(String userId) async {
    _isLoading = true;
    notifyListeners();

    _address = await _addressService.getAddressByUserId(userId);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveAddress(Address address) async {
    _isLoading = true;
    notifyListeners();

    await _addressService.saveAddress(address);
    _address = address;

    _isLoading = false;
    notifyListeners();
  }

  // Stream<Address?> watchAddress(String userId) {
  //   return _addressService.watchAddress(userId);
  // }
}
