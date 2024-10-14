import 'package:flutter/material.dart';
import 'package:frontend/components/input_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class OrderInfo extends StatefulWidget {
  const OrderInfo({super.key});

  @override
  State<OrderInfo> createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String phone = '';
  
  String nameError = '';
  String addressError = '';
  String cityError = '';

  void _validateInputs() {
    setState(() {
      nameError = '';
      addressError = '';
      cityError = '';

      if (nameController.text.isEmpty) {
        nameError = 'Please enter your full name.';
      }

      if (phone.isEmpty) {
        // Add your phone number validation here
      }

      if (cityController.text.isEmpty) {
        cityError = 'Please enter your city.';
      }

      if (addressController.text.isEmpty) {
        addressError = 'Please enter your address.';
      }

      if (nameError.isEmpty && cityError.isEmpty && addressError.isEmpty) {
        Navigator.pushNamed(context, '/payment');
      }
    });
  }

  void _clearNameError() {
    setState(() {
      nameError = '';
    });
  }

  void _clearCityError() {
    setState(() {
      cityError = '';
    });
  }

  void _clearAddressError() {
    setState(() {
      addressError = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TextButton(
        onPressed: _validateInputs,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.orange[700]),
        ),
        child: const Text('Proceed', style: TextStyle(color: Colors.white)),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.orange[700],
        title: const Text(
          'Order Info',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          InputField(
            label: "Enter Full Name",
            error: nameError,
            controller: nameController,
            onTap: _clearNameError,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(color: Color.fromARGB(255, 123, 123, 123)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              initialCountryCode: 'LB',
              onChanged: (phone) {
                setState(() {
                  this.phone = phone.completeNumber;
                });
              },
            ),
          ),
          InputField(
            label: "Enter Your City",
            error: cityError,
            controller: cityController,
            onTap: _clearCityError,
          ),
          InputField(
            label: "Enter Your Address",
            error: addressError,
            controller: addressController,
            onTap: _clearAddressError,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    cityController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
