import 'package:flutter/material.dart';
import 'package:consummer_app/core/utils/sizing_config.dart';
import 'package:consummer_app/core/widgets/custom_app_bar.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedCategory;
  String? _selectedLocation;
  // For future use: File? _photo;

  final List<String> _categories = [
    'Leak',
    'No Water',
    'Low Pressure',
    'Other',
  ];
  final List<String> _locations = ['Zone 1', 'Zone 2', 'Zone 3', 'Other'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizingConfig.init(constraints);

        return Scaffold(
          appBar: const CustomAppBar(title: 'Maintenance Request'),
          body: Padding(
            padding: EdgeInsets.all(SizingConfig.widthMultiplier * 4),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDropdown(
                      label: 'Issue Category',
                      value: _selectedCategory,
                      items: _categories,
                      onChanged: (val) =>
                          setState(() => _selectedCategory = val),
                    ),
                    SizedBox(height: SizingConfig.heightMultiplier * 2),

                    _buildTextArea(
                      label: 'Description',
                      controller: _descriptionController,
                    ),
                    SizedBox(height: SizingConfig.heightMultiplier * 2),

                    _buildDropdown(
                      label: 'Location',
                      value: _selectedLocation,
                      items: _locations,
                      onChanged: (val) =>
                          setState(() => _selectedLocation = val),
                    ),
                    SizedBox(height: SizingConfig.heightMultiplier * 2),

                    // 📷 Future: photo picker button
                    ElevatedButton.icon(
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Attach Photo'),
                      onPressed: () {
                        // TODO: integrate image picker
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black87,
                      ),
                    ),

                    SizedBox(height: SizingConfig.heightMultiplier * 4),

                    SizedBox(
                      width: double.infinity,
                      height: SizingConfig.heightMultiplier * 6,
                      child: ElevatedButton(
                        onPressed: _onSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D4ED8),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: SizingConfig.textMultiplier * 2,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizingConfig.widthMultiplier * 2),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizingConfig.widthMultiplier * 4,
          vertical: SizingConfig.heightMultiplier * 2,
        ),
      ),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
      validator: (val) =>
          val == null || val.isEmpty ? 'Please select $label' : null,
    );
  }

  Widget _buildTextArea({
    required String label,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: 4,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizingConfig.widthMultiplier * 2),
        ),
        contentPadding: EdgeInsets.all(SizingConfig.widthMultiplier * 4),
      ),
      validator: (val) =>
          val == null || val.isEmpty ? 'Please enter $label' : null,
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: API call / provider method
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Report submitted successfully')),
      );
    }
  }
}
