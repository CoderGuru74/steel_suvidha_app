import 'package:flutter/material.dart';

class ProductListingScreen extends StatefulWidget {
  final String category;

  const ProductListingScreen({Key? key, required this.category})
      : super(key: key);

  @override
  _ProductListingScreenState createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  // Common metal types
  final List<String> _metalTypes = ['Steel', 'Stainless Steel', 'Aluminium'];

  // Categories
  final List<String> _categories = [
    'TMT Rebars',
    'Angles',
    'Flats',
    'Square Bars',
    'Round Bars',
    'Channels',
    'Beams',
    'Pipes',
    'Joist / ISMB',
    'Z-Angles', // ✅ New Category Added
  ];

  // TMT
  final List<String> _tmtBrands = [
    'TATA Tiscon',
    'SAIL',
    'Jindal',
    'JSW',
    'Shyam Steel',
    'Rungta',
    'Others'
  ];
  final List<String> _tmtGrades = ['500 D', '550 D', '600 D'];
  final List<String> _tmtSizes = [
    '6 mm', '8 mm', '10 mm', '12 mm', '16 mm', '20 mm', '25 mm', '32 mm'
  ];

  // Angles
  final List<String> _angleBrands = [
    'PATNA IRON', 'KAMDHENU', 'JKSPL', 'SEL TIGER', 'SAIL', 'SUL', 'OTHERS'
  ];
  final List<String> _angleFinish = [
    'MS - MILD STEEL (BLACK)',
    'GI (GALVANISED)'
  ];
  final List<String> _angleSizes = [
    'A 20 X 3', 'A 25 X 3', 'A 25 X 5', 'A 30 X 3', 'A 32 X 3',
    'A 35 X 5', 'A 35 X 6', 'A 40 X 3', 'A 40 X 5', 'A 40 X 6',
    'A 50 X 3', 'A 50 X 5', 'A 50 X 6', 'A 65 X 5', 'A 65 X 6',
    'A 75 X 5', 'A 75 X 8', 'A 75 X 10',
  ];

  // Flats
  final List<String> _flatBrands = [
    'PATNA IRON', 'KAMDHENU', 'JKSPL', 'SEL TIGER', 'SAIL', 'SUL', 'OTHERS'
  ];
  final List<String> _flatFinish = [
    'MS - MILD STEEL (BLACK)',
    'GI (GALVANISED)'
  ];
  final List<String> _flatSizes = [
    'F 20X3','F 20X5','F 20X6','F 25X3','F 25X6','F 25X10','F 25X12',
    'F 32X5','F 32X6','F 32X8','F 32X10','F 40X5','F 40X6','F 40X8',
    'F 40X10','F 40X12','F 50X5','F 50X6','F 50X8','F 50X10','F 50X12',
    'F 65X6','F 65X8','F 65X10','F 65X12','F 75X6','F 75X8','F 75X10',
    'F 75X12','F 75X16','F 100X8','F 100X12'
  ];

  // Square Bars
  final List<String> _squareBarBrands = [
    'PATNA IRON', 'KAMDHENU', 'JKSPL', 'SEL TIGER', 'SAIL', 'SUL', 'OTHERS'
  ];
  final List<String> _squareBarFinish = [
    'MS - MILD STEEL (BLACK)',
    'GI (GALVANISED)'
  ];
  final List<String> _squareBarSizes = [
    '8 mm', '10 mm', '12 mm', '16 mm', '20 mm', '25 mm', '32 mm', '40 mm'
  ];

  // Round Bars
  final List<String> _roundBarBrands = [
    'PATNA IRON', 'KAMDHENU', 'JKSPL', 'SEL TIGER', 'SAIL', 'SUL', 'OTHERS'
  ];
  final List<String> _roundBarFinish = [
    'MS - MILD STEEL (BLACK)',
    'GI (GALVANISED)'
  ];
  final List<String> _roundBarSizes = [
    '8 mm', '10 mm', '12 mm', '16 mm', '20 mm', '25 mm', '32 mm', '40 mm'
  ];

  // Channels
  final List<String> _channelBrands = [
    'PATNA IRON', 'KAMDHENU', 'JKSPL', 'SEL TIGER', 'SAIL', 'SUL', 'OTHERS'
  ];
  final List<String> _channelFinish = [
    'MS - MILD STEEL (BLACK)',
    'GI (GALVANISED)'
  ];
  final List<String> _channelSizes = [
    'ISMC 70X40',
    'ISMC 75X40 (ULC)',
    'ISMC 75X40 (LC)',
    'ISMC 75X40 (MC)',
    'ISMC 75X40 (H)',
    'ISMC 100X50 (LC)',
    'ISMC 100X50 (MC)',
    'ISMC 100X50 (H)',
    'ISMC 125X65',
    'ISMC 150X75',
    'ISMC 200X75',
    'ISMC 250X75'
  ];

  // Joist / ISMB
  final List<String> _joistBrands = [
    'PATNA IRON', 'KAMDHENU', 'JKSPL', 'SEL TIGER', 'SAIL', 'SUL', 'OTHERS'
  ];
  final List<String> _joistFinish = [
    'MS - MILD STEEL (BLACK)',
    'GI (GALVANISED)'
  ];
  final List<String> _joistSizes = [
    'ISMB 100','ISMB 125','ISMB 150','ISMB 200',
    'ISMB 250','ISMB 300','ISMB 350','ISMB 400'
  ];

  // ✅ Z-Angles
  final List<String> _zAngleBrands = [
    'PATNA IRON', 'KAMDHENU', 'JKSPL', 'SEL TIGER', 'SAIL', 'SUL', 'OTHERS'
  ];
  final List<String> _zAngleFinish = [
    'MS - MILD STEEL (BLACK)',
    'GI (GALVANISED)'
  ];
  final List<String> _zAngleSizes = [
    'Z-Angle (L)', 'Z-Angle (H)',
  ];

  // Selected values
  String? _selectedMetalType;
  String? _selectedCategory;
  String? _selectedBrand;
  String? _selectedGrade;
  String? _selectedSize;
  String? _selectedFinish;

  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.category;
    _applyFilters();
  }

  void _applyFilters() {
    List<Product> products = dummyProducts;

    if (_selectedMetalType != null) {
      products =
          products.where((p) => p.metalType == _selectedMetalType).toList();
    }
    if (_selectedCategory != null) {
      products =
          products.where((p) => p.category == _selectedCategory).toList();
    }
    if (_selectedBrand != null) {
      products = products.where((p) => p.brand == _selectedBrand).toList();
    }
    if (_selectedGrade != null) {
      products = products.where((p) => p.grade == _selectedGrade).toList();
    }
    if (_selectedSize != null) {
      products = products.where((p) => p.size == _selectedSize).toList();
    }
    if (_selectedFinish != null) {
      products = products.where((p) => p.finish == _selectedFinish).toList();
    }

    setState(() {
      _filteredProducts = products;
    });
  }

  Widget _buildChipSelector({
    required String title,
    required List<String> options,
    required String? selectedValue,
    required ValueChanged<String> onSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            final bool isSelected = selectedValue == option;
            return ChoiceChip(
              label: Text(option),
              selected: isSelected,
              onSelected: (_) {
                onSelected(option);
                _applyFilters();
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryLower = _selectedCategory?.toLowerCase() ?? '';
    final bool isTmtCategory = categoryLower.contains('tmt');
    final bool isAngleCategory = categoryLower.contains('angle');
    final bool isFlatCategory = categoryLower.contains('flat');
    final bool isSquareBarCategory = categoryLower.contains('square bar');
    final bool isRoundBarCategory = categoryLower.contains('round bar');
    final bool isChannelCategory = categoryLower.contains('channel');
    final bool isJoistCategory =
        categoryLower.contains('joist') || categoryLower.contains('ismb');
    final bool isZAngleCategory = categoryLower.contains('z-angle');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Steel Suvidha"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _buildChipSelector(
            title: 'Metal Type',
            options: _metalTypes,
            selectedValue: _selectedMetalType,
            onSelected: (value) => setState(() => _selectedMetalType = value),
          ),
          _buildChipSelector(
            title: 'Select Category',
            options: _categories,
            selectedValue: _selectedCategory,
            onSelected: (value) => setState(() => _selectedCategory = value),
          ),
          if (isTmtCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _tmtBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) => setState(() => _selectedBrand = value),
            ),
            _buildChipSelector(
              title: 'Select Grade',
              options: _tmtGrades,
              selectedValue: _selectedGrade,
              onSelected: (value) => setState(() => _selectedGrade = value),
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _tmtSizes,
              selectedValue: _selectedSize,
              onSelected: (value) => setState(() => _selectedSize = value),
            ),
          ],
          if (isAngleCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _angleBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) => setState(() => _selectedBrand = value),
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _angleFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) => setState(() => _selectedFinish = value),
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _angleSizes,
              selectedValue: _selectedSize,
              onSelected: (value) => setState(() => _selectedSize = value),
            ),
          ],
          if (isFlatCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _flatBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) => setState(() => _selectedBrand = value),
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _flatFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) => setState(() => _selectedFinish = value),
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _flatSizes,
              selectedValue: _selectedSize,
              onSelected: (value) => setState(() => _selectedSize = value),
            ),
          ],
          if (isSquareBarCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _squareBarBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) => setState(() => _selectedBrand = value),
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _squareBarFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) => setState(() => _selectedFinish = value),
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _squareBarSizes,
              selectedValue: _selectedSize,
              onSelected: (value) => setState(() => _selectedSize = value),
            ),
          ],
          if (isRoundBarCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _roundBarBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) => setState(() => _selectedBrand = value),
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _roundBarFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) => setState(() => _selectedFinish = value),
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _roundBarSizes,
              selectedValue: _selectedSize,
              onSelected: (value) => setState(() => _selectedSize = value),
            ),
          ],
          if (isChannelCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _channelBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) => setState(() => _selectedBrand = value),
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _channelFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) => setState(() => _selectedFinish = value),
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _channelSizes,
              selectedValue: _selectedSize,
              onSelected: (value) => setState(() => _selectedSize = value),
            ),
          ],
          if (isJoistCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _joistBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) => setState(() => _selectedBrand = value),
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _joistFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) => setState(() => _selectedFinish = value),
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _joistSizes,
              selectedValue: _selectedSize,
              onSelected: (value) => setState(() => _selectedSize = value),
            ),
          ],
          if (isZAngleCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _zAngleBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) => setState(() => _selectedBrand = value),
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _zAngleFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) => setState(() => _selectedFinish = value),
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _zAngleSizes,
              selectedValue: _selectedSize,
              onSelected: (value) => setState(() => _selectedSize = value),
            ),
          ],
          const SizedBox(height: 16),
          ..._filteredProducts.map((product) => Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Image.asset(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                      '${product.brand} | ${product.grade ?? product.finish ?? ''} | ${product.size}'),
                ),
              )),
          if (_filteredProducts.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('No products found'),
              ),
            ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String metalType;
  final String category;
  final String brand;
  final String? grade;
  final String? finish;
  final String size;
  final String imageUrl;

  Product({
    required this.name,
    required this.metalType,
    required this.category,
    required this.brand,
    this.grade,
    this.finish,
    required this.size,
    required this.imageUrl,
  });
}

final List<Product> dummyProducts = [
  Product(
    name: 'TMT 8mm',
    metalType: 'Steel',
    category: 'TMT Rebars',
    brand: 'TATA Tiscon',
    grade: '500 D',
    size: '8 mm',
    imageUrl: 'assets/images/tmt.png',
  ),
  Product( name: 'Angle A 25 X 3',
   metalType: 'Steel',
   category: 'Angles',
   brand: 'PATNA IRON',
   finish: 'MS - MILD STEEL (BLACK)',
   size: 'A 25 X 3',
   imageUrl: 'assets/images/angle.png',
  ), 
  Product( name: 'Flat F 25X6',
  metalType: 'Steel',
  category: 'Flats',
  brand: 'KAMDHENU', 
  finish: 'GI (GALVANISED)', 
  size: 'F 25X6', 
  imageUrl: 'assets/images/flat.png', 
  ), 
  Product( name: 'Square Bar 16 mm', 
  metalType: 'Steel', 
  category: 'Square Bars', 
  brand: 'PATNA IRON', 
  finish: 'MS - MILD STEEL (BLACK)', 
  size: '16 mm', 
  imageUrl: 'assets/images/square_bar.png', 
  ), 
  Product( name: 'Round Bar 20 mm', 
  metalType: 'Steel', 
  category: 'Round Bars', 
  brand: 'KAMDHENU', 
  finish: 'MS - MILD STEEL (BLACK)', 
  size: '20 mm', 
  imageUrl: 'assets/images/round_bar.png', 
  ), 
  Product( name: 'Joist ISMB 100', 
  metalType: 'Steel', 
  category: 'Joist / ISMB', 
  finish: 'MS - MILD STEEL (BLACK)', 
  brand: 'PATNA IRON', 
  size: 'ISMB 100', 
  imageUrl: 'assets/images/joist.png', 
  ) ];