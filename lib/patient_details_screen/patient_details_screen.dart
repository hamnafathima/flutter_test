import 'package:flutter/material.dart';
import 'package:flutter_machine_test/constants/colors.dart';
import 'package:flutter_machine_test/constants/icons.dart';
import 'package:flutter_machine_test/constants/text_styles.dart';
import 'package:flutter_machine_test/constants/ui_styles.dart';
import 'package:flutter_svg/svg.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({super.key});

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  String? _paymentMethod = 'Cash';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _treatmentController = TextEditingController();
  final TextEditingController _totalAmountController = TextEditingController();
  final TextEditingController _discountAmountController =
      TextEditingController();
  final TextEditingController _advanceAmountController =
      TextEditingController();
  final TextEditingController _balanceAmountController =
      TextEditingController();
  final TextEditingController _treatmentDateController =
      TextEditingController();
  final TextEditingController _treatmentTimeController =
      TextEditingController();
  final TextEditingController _treatmentChooseController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.arrow_back),
                    const Spacer(),
                    Stack(
                      children: [
                        SvgPicture.asset(IconClass.notificationIcon),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 23),
                Text(
                  'Register',
                  style: TextStyleClass.poppins600TextStyle(
                      24, ColorClass.darkGrey),
                ),
                const SizedBox(height: 12),
                Divider(
                  color: ColorClass.darkGrey.withOpacity(0.2),
                  thickness: 2.0,
                ),
                const SizedBox(height: 12),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildTextField(
                          _nameController, 'Enter your full name', 'Name'),
                      Text(
                        'Whatsapp Number',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildTextField(_whatsappController,
                          'Enter your Whatsapp Number', 'Whatsapp number'),
                      Text(
                        'Address',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildTextField(_addressController,
                          'Enter your full Address', 'Address'),
                      Text(
                        'Location',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildDropdownField(_locationController,
                          'Choose your Location', 'Location'),
                      Text(
                        'Branch',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildDropdownField(
                          _branchController, 'Select the Branch', 'Branch'),
                      Text(
                        'Total Amount',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildTreatmentsSection(),
                      _buildTextField(_totalAmountController, '', ''),
                      Text(
                        'Discount Amount',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildTextField(_discountAmountController, '', ''),
                      Text(
                        'Payment Option',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Radio<String>(
                                  value: 'Cash',
                                  groupValue: _paymentMethod,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _paymentMethod = value;
                                    });
                                  },
                                ),
                                const Text('Cash'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Radio<String>(
                                  value: 'Card',
                                  groupValue: _paymentMethod,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _paymentMethod = value;
                                    });
                                  },
                                ),
                                const Text('Card'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Radio<String>(
                                  value: 'UPI',
                                  groupValue: _paymentMethod,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _paymentMethod = value;
                                    });
                                  },
                                ),
                                const Text('UPI'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Advance Amount',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildTextField(_advanceAmountController, '', ''),
                      Text(
                        'Balance Amount',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildTextField(_balanceAmountController, '', ''),
                      Text(
                        'Treatment Date',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildDatePickerField(_treatmentDateController, ''),
                      Text(
                        'Treatment Time',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildTimePickerField(_treatmentTimeController, ''),
                      Text(
                        'Choose Treatment',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      _buildDropdownField(_treatmentChooseController,
                          'Choose prefered treatment', ''),
                      Text(
                        'Add Patients',
                        style: TextStyleClass.poppins400TextStyle(
                            16, ColorClass.darkGrey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 124,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorClass.grey),
                                color: ColorClass.black.withOpacity(0.25),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Male',
                                style: TextStyleClass.poppins300TextStyle(
                                    14, ColorClass.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: ColorClass.darkGreen,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(29))),
                            child: const Center(
                                child: Text(
                              '-',
                              style: TextStyle(
                                  color: ColorClass.white, fontSize: 35),
                            )),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            height: 44,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorClass.grey),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: ColorClass.darkGreen,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(29))),
                            child: const Center(
                                child: Text(
                              '+',
                              style: TextStyle(
                                  color: ColorClass.white, fontSize: 35),
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 124,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorClass.grey),
                                color: ColorClass.black.withOpacity(0.25),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Female',
                                style: TextStyleClass.poppins300TextStyle(
                                    14, ColorClass.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: ColorClass.darkGreen,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(29))),
                            child: const Center(
                                child: Text(
                              '-',
                              style: TextStyle(
                                  color: ColorClass.white, fontSize: 35),
                            )),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            height: 44,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorClass.grey),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: ColorClass.darkGreen,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(29))),
                            child: const Center(
                                child: Text(
                              '+',
                              style: TextStyle(
                                  color: ColorClass.white, fontSize: 35),
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      UiStyles.customisedButton(
                          'Save', ColorClass.darkGreen, () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: ColorClass.white.withOpacity(0.25),
          filled: true,
          labelText: label,
          hintStyle: TextStyleClass.poppins300TextStyle(14, ColorClass.grey),
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorClass.black.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField(
      TextEditingController controller, String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          fillColor: ColorClass.white.withOpacity(0.25),
          filled: true,
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        items: <String>['Option 1', 'Option 2', 'Option 3'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          controller.text = newValue!;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildTreatmentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Treatments',
            style: TextStyleClass.poppins600TextStyle(16, ColorClass.darkGrey)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              ListTile(
                title: const Text('1. Couple Combo package'),
                subtitle: const Row(
                  children: [
                    Chip(label: Text('Male: 2')),
                    SizedBox(width: 8),
                    Chip(label: Text('Female: 2')),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              UiStyles.customisedGreenButton(
                  '+ Add Treatments', ColorClass.lightGreen, () {})
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDatePickerField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          fillColor: ColorClass.white.withOpacity(0.25),
          filled: true,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            controller.text = "${pickedDate.toLocal()}".split(' ')[0];
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildTimePickerField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          fillColor: ColorClass.white.withOpacity(0.25),
          filled: true,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          suffixIcon: const Icon(Icons.access_time),
        ),
        onTap: () async {
          TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (pickedTime != null) {
            controller.text = pickedTime.format(context);
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }
}
