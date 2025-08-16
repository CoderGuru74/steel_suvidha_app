// File name: product_listing_screen.dart
import 'package:flutter/material.dart';

// --- Top-level lists for shared data ---
const List<String> squareBarBrands = [
  'Patna Iron',
  'Kamdhenu',
  'JKSPL',
  'Sel Tiger',
  'SAIL',
  'SUL',
  'Others',
];

const List<String> squareBarFinish = [
  'MS - Mild Steel (Black)',
  'GI - Galvanised',
];

const List<String> squareBarSizes = [
  '8 mm',
  '10 mm',
  '12 mm',
  '16 mm',
  '20 mm',
  '25 mm',
  '32 mm',
  '40 mm',
];

class ProductListingScreen extends StatefulWidget {
  final String category;
  const ProductListingScreen({Key? key, required this.category}) : super(key: key);

  @override
  _ProductListingScreenState createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  // Common metal types
  final List<String> _metalTypes = [
    'Steel',
    'Stainless Steel',
    'Aluminium',
  ];

  // Categories (extended with complete list)
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
    'Z-Angles',
    'Gate Channel',
    'Tak Sq. / Flat',
    'Pipes and Guides',
    'Shutter Profiles',
    'Lock Plates / Bracket',
    'Plates',
    'HR Sheets',
    'GP Sheets',
    'CR Sheets',
    'Roofing Sheet',
    'Colour Profile Sheet',
    'Asbestos Sheet',
  ];

  // TMT
  final List<String> _tmtBrands = [
    'TATA Tiscon',
    'SAIL',
    'Jindal',
    'JSW',
    'Shyam Steel',
    'Rungta',
    'Others',
  ];

  final List<String> _tmtGrades = ['500 D', '550 D', '600 D'];

  final List<String> _tmtSizes = [
    '6 mm',
    '8 mm',
    '10 mm',
    '12 mm',
    '16 mm',
    '20 mm',
    '25 mm',
    '32 mm',
  ];

  // Angles
  final List<String> _angleBrands = [
    'Patna Iron',
    'Kamdhenu',
    'JKSPL',
    'Sel Tiger',
    'SAIL',
    'SUL',
    'Others',
  ];

  final List<String> _angleFinish = [
    'MS - Mild Steel (Black)',
    'GI - Galvanised',
  ];

  final List<String> _angleSizes = [
    'A 20×3',
    'A 25×3',
    'A 25×5',
    'A 30×3',
    'A 32×3',
    'A 35×5',
    'A 35×6',
    'A 40×3',
    'A 40×5',
    'A 40×6',
    'A 50×3',
    'A 50×5',
    'A 50×6',
    'A 65×5',
    'A 65×6',
    'A 75×5',
    'A 75×6',
    'A 75×8',
    'A 75×10',
  ];

  // Flats
  final List<String> _flatBrands = [
    'Patna Iron',
    'Kamdhenu',
    'JKSPL',
    'Sel Tiger',
    'SAIL',
    'SUL',
    'Others',
  ];

  final List<String> _flatFinish = [
    'MS - Mild Steel (Black)',
    'GI - Galvanised',
  ];

  final List<String> _flatSizes = [
    'F 20×3',
    'F 20×5',
    'F 20×6',
    'F 25×3',
    'F 25×5',
    'F 25×6',
    'F 25×10',
    'F 25×12',
    'F 32×5',
    'F 32×6',
    'F 32×8',
    'F 32×10',
    'F 40×5',
    'F 40×6',
    'F 40×8',
    'F 40×10',
    'F 40×12',
    'F 50×5',
    'F 50×6',
    'F 50×8',
    'F 50×10',
    'F 50×12',
    'F 65×6',
    'F 65×8',
    'F 65×10',
    'F 65×12',
    'F 75×6',
    'F 75×8',
    'F 75×10',
    'F 75×12',
    'F 75×16',
    'F 100×8',
    'F 100×12',
  ];

  // Square Bars (reference top-level constants)
  final List<String> _squareBarBrands = squareBarBrands;
  final List<String> _squareBarFinish = squareBarFinish;
  final List<String> _squareBarSizes = squareBarSizes;

  // Round Bars (reference top-level constants)
  final List<String> _roundBarBrands = squareBarBrands;
  final List<String> _roundBarFinish = squareBarFinish;
  final List<String> _roundBarSizes = squareBarSizes;

  // Channels
  final List<String> _channelBrands = [
    'Patna Iron',
    'Kamdhenu',
    'JKSPL',
    'Sel Tiger',
    'SAIL',
    'SUL',
    'Others',
  ];

  final List<String> _channelFinish = [
    'MS - Mild Steel (Black)',
    'GI - Galvanised',
  ];

  final List<String> _channelSizes = [
    'ISMC 70×40',
    'ISMC 75×40 (ULC)',
    'ISMC 75×40 (LC)',
    'ISMC 75×40 (MC)',
    'ISMC 75×40 (H)',
    'ISMC 100×50 (LC)',
    'ISMC 100×50 (MC)',
    'ISMC 100×50 (H)',
    'ISMC 125×65',
    'ISMC 150×75',
    'ISMC 200×75',
    'ISMC 250×75',
  ];

  // Joist / ISMB
  final List<String> _joistBrands = [
    'Patna Iron',
    'Kamdhenu',
    'JKSPL',
    'Sel Tiger',
    'SAIL',
    'SUL',
    'Others',
  ];

  final List<String> _joistFinish = [
    'MS - Mild Steel (Black)',
    'GI - Galvanised',
  ];

  final List<String> _joistSizes = [
    'ISMB 100',
    'ISMB 125',
    'ISMB 150',
    'ISMB 200',
    'ISMB 250',
    'ISMB 300',
    'ISMB 350',
    'ISMB 400',
  ];

  // Z-Angles
  final List<String> _zAngleBrands = [
    'Patna Iron',
    'Kamdhenu',
    'JKSPL',
    'Sel Tiger',
    'SAIL',
    'SUL',
    'Others',
  ];

  final List<String> _zAngleFinish = [
    'MS - Mild Steel (Black)',
    'GI - Galvanised',
  ];

  final List<String> _zAngleSizes = [
    'Z - Angle (L)',
    'Z - Angle (H)',
  ];

  // Gate Channel
  final List<String> _gateChannelBrands = [
    'Patna Iron',
    'Kamdhenu',
    'JKSPL',
    'Sel Tiger',
    'SAIL',
    'SUL',
    'Others',
  ];

  final List<String> _gateChannelFinish = [
    'MS - Mild Steel (Black)',
    'GI - Galvanised',
  ];

  final List<String> _gateChannelSizes = [
    'Gt. Chn. 13 ft',
    'Gt. Chn. 14 ft',
    'Gt. Chn. 15 ft',
    'Gt. Chn. 16 ft',
    'Gt. Chn. 17 ft',
    'Gt. Chn. 18 ft',
  ];

  // Tak Sq. / Flat
  final List<String> _takBrands = [
    'Jagdamba',
    'Kamdhenu',
    'Manokaamna',
    'Others',
  ];

  final List<String> _takFinish = [
    'MS - Mild Steel (Black)',
    'GI - Galvanised',
  ];

  final List<String> _takSizes = [
    'Tak Sq. 8 mm',
    'Tak Sq. 10 mm',
    'Tak Sq. 12 mm',
    'Tak Flat 20×5',
    'Tak Flat 25×5',
    'Round Pipe 66',
    'Square Pipe 66',
    'Rectangular Pipes 28',
    'Fancy Pipes 3',
    'Shutter Guide',
    'Guide 13 ft',
    'Guide 14 ft',
    'Guide 15 ft',
    'Guide 16 ft',
    'Guide 17 ft',
    'Guide 18 ft',
    'Guide 19 ft',
    'Guide 20 ft',
  ];

  final List<String> _takVariety = [
    'Heavy',
    'Light',
  ];

  // Shutter Profiles
  final List<String> _shutterProfileSizes = [
    'Profile 13 ft',
    'Profile 14 ft',
    'Profile 15 ft',
    'Profile 16 ft',
    'Profile 17 ft',
    'Profile 18 ft',
    'Profile 19 ft',
    'Profile 20 ft',
    'Profile 21 ft',
    'Profile 22 ft',
    'Profile 23 ft',
  ];

  final List<String> _shutterProfileBrands = [
    'Jagdamba',
    'Kamdhenu',
    'Manokaamna',
    'Others',
  ];

  final List<String> _shutterProfileFinish = [
    'MS - Mild Steel (Black)',
    'GI - Galvanised',
  ];

  final List<String> _shutterProfileVariety = [
    'Heavy',
    'Light',
  ];

  // Lock Plates / Bracket
  final List<String> _lockPlateBracketItems = [
    'Straight Lock Plate 8 ft',
    'Straight Lock Plate 10 ft',
    'Lock Plate (Roll Coil)',
    'Bracket 14"×14"',
  ];

  final List<String> _lockPlateBracketBrands = [
    'Jagdamba',
    'Kamdhenu',
    'Manokaamna',
    'Others',
  ];

  final List<String> _lockPlateBracketFinish = [
    'MS - Mild Steel (Black)',
    'GI - Galvanised',
  ];

  final List<String> _lockPlateBracketVariety = [
    'Heavy',
    'Light',
  ];

  // Plates
  final List<String> _platesItems = [
    'Chequered Plate',
    'MS Plate',
    '2.5 mm - 10×6',
    '3 mm - 10×6',
    '3.5 mm - 10×6',
    '4 mm - 10×6',
    '4.5 mm - 10×6',
    '5 mm - 10×5',
    '5 mm - 21×5',
    '6 mm - 10×5',
    '6 mm - 21×5',
  ];

  final List<String> _platesBrands = [
    'Patna Iron',
    'Kamdhenu',
    'Satyam',
    'Others',
    'Tata Structura',
    'APL Apollo',
  ];

  final List<String> _platesFinish = [
    'MS - Mild Steel (Black)',
    'GI - Galvanised',
  ];

  // HR Sheets
  final List<String> _hrSheetGauges = [
    '8 G',
    '9 G',
    '10 G',
    '12 G',
    '14 G',
    '16 G',
  ];

  final List<String> _hrSheetSizes = [
    '6×3',
    '6×4',
    '6×Meter',
    '7×3',
    '7×4',
    '7×Meter',
    '8×3',
    '8×4',
    '8×5',
    '8×Meter',
    '10×3',
  ];

  final List<String> _hrSheetBrands = [
    'TATA Astrum',
    'SAIL',
    'Secondary (Other)',
  ];

  // GP Sheets
  final List<String> _gpSheetThickness = [
    '0.40 mm',
    '0.50 mm - 26 G',
    '0.60 mm - 24 G',
    '22 G - 0.80 mm',
    '20 G - 1.00 mm',
    '18 G - 1.20 mm',
    '16 G - 1.60 mm',
    '14 G - 2 mm',
    '12 G - 2.50 mm',
    '10 G - 3.00 mm',
  ];

  final List<String> _gpSheetSizes = [
    '6×3',
    '6×4',
    '6×Meter',
    '7×3',
    '7×4',
    '7×Meter',
    '8×3',
    '8×4',
    '8×5',
    '8×Meter',
  ];

  final List<String> _gpSheetBrands = [
    'TATA',
    'SAIL',
    'JSW',
    'AM/NS INDIA',
    'Secondary (Other)',
  ];

  final List<String> _gpSheetFinish = [
    'Galvanised',
    'Galvannealed',
  ];

  // CR Sheets
  final List<String> _crSheetGauges = [
    '14 G',
    '16 G',
    '18 G',
    '20 G',
    '22 G',
    '24 G',
    '26 G',
    '0.40 mm',
    '0.35 mm',
    '0.30 mm',
  ];

  final List<String> _crSheetSizes = [
    '6×3',
    '6×4',
    '6×Meter',
    '8×3',
    '8×4',
    '8×Meter',
  ];

  final List<String> _crSheetBrands = [
    'TATA Steelium Super',
    'SAIL',
    'Secondary (Other)',
  ];

  // Roofing Sheet
  final List<String> _roofingSheetThickness = [
    '0.15 mm',
    '0.18 mm',
    '0.20 mm',
    '0.22 mm',
    '0.25 mm',
    '0.30 mm',
    '0.35 mm',
    '0.40 mm',
    '0.45 mm',
    '0.50 mm',
    '0.60 mm',
    '0.80 mm',
  ];

  final List<String> _roofingSheetSizes = [
    '6×3',
    '6×4',
    '8×3',
    '8×4',
    '10×3',
    '10×4',
    '12×3',
    '12×4',
    '14×3',
    '14×4',
    '16×4',
  ];

  final List<String> _roofingSheetBrands = [
    'Tata Shaktee',
    'Aarti',
    '5 Star',
    'Others',
  ];

  // Colour Profile Sheet
  final List<String> _profileSheetThicknesses = [
    '0.25 mm',
    '0.30 mm',
    '0.35 mm',
    '0.37 mm',
    '0.40 mm',
    '0.45 mm',
    '0.47 mm',
    '0.50 mm',
    '0.53 mm',
  ];

  final List<String> _profileSheetSizes = [
    '6×3.5',
    '7×3.5',
    '8×3.5',
    '10×3.5',
    '12×3.5',
    '14×3.5',
    '16×3.5',
    '6×4',
    '7×4',
    '8×4',
    '10×4',
    '12×4',
    '14×4',
    '16×4',
    '18×4',
    '20×4',
  ];

  final List<String> _profileSheetBrands = [
    'TATA Durashine',
    'TATA Infinia',
    'JSW Pragati+',
    'Jindal Sabrang / Rangeen',
    'Aarti',
    'Others',
  ];

  // Asbestos Cement Roofing Sheet
  final List<String> _asbestosSizes = [
    '6 ft (5.75 ft)',
    '6.5 ft',
    '8 ft',
    '10 ft',
    '12 ft',
  ];

  final List<String> _asbestosTypes = [
    'Grey',
    'Colour Coated',
    'Cooling Sheet',
  ];

  final List<String> _asbestosBrands = [
    'Everest',
    'Visaka',
    'Konark',
    'Charminar (birlanu)',
    'Ramco',
    'Others',
  ];

  // Selected filters
  String? _selectedMetalType;
  String? _selectedCategory;
  String? _selectedBrand;
  String? _selectedGrade;
  String? _selectedSize;
  String? _selectedFinish;
  String? _selectedVariety;
  String? _selectedType;

  List<Product> _filteredProducts = [];
  final List<Product> _cart = [];

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.category;
    _applyFilters();
  }

  void _applyFilters() {
    List<Product> products = dummyProducts;

    if (_selectedMetalType != null) {
      products = products.where((p) => p.metalType == _selectedMetalType).toList();
    }
    if (_selectedCategory != null) {
      products = products.where((p) => p.category == _selectedCategory).toList();
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
    if (_selectedVariety != null) {
      products = products.where((p) => p.variety == _selectedVariety).toList();
    }
    if (_selectedType != null) {
      products = products.where((p) => p.type == _selectedType).toList();
    }

    setState(() {
      _filteredProducts = products;
    });
  }

  void _addToCart(Product product) {
    setState(() {
      _cart.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} added to cart')),
    );
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
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                onSelected(option); // No _applyFilters() here
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
    final bool isJoistCategory = categoryLower.contains('joist') || categoryLower.contains('ismb');
    final bool isZAngleCategory = categoryLower.contains('z-angle');
    final bool isGateChannelCategory = categoryLower.contains('gate channel') || categoryLower.contains('gate');
    final bool isTakCategory = categoryLower.contains('tak sq') || categoryLower.contains('tak flat');
    final bool isPipeGuideCategory = categoryLower.contains('pipes and guides');
    final bool isShutterProfileCategory = categoryLower.contains('shutter profiles');
    final bool isLockPlateBracketCategory = categoryLower.contains('lock plates') || categoryLower.contains('bracket');
    final bool isPlatesCategory = categoryLower.contains('plates') && !categoryLower.contains('lock');
    final bool isHRCat = categoryLower.contains('hr sheets');
    final bool isGPCat = categoryLower.contains('gp sheets');
    final bool isCRCat = categoryLower.contains('cr sheets');
    final bool isRoofingSheetCat = categoryLower.contains('roofing sheet');
    final bool isProfileSheetCat = categoryLower.contains('colour profile sheet');
    final bool isAsbestosCat = categoryLower.contains('asbestos sheet');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Steel Suvidha"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Cart'),
                      content: _cart.isEmpty
                          ? const Text('Your cart is empty.')
                          : SizedBox(
                              width: 300,
                              child: ListView(
                                shrinkWrap: true,
                                children: _cart
                                    .map((product) => ListTile(
                                          title: Text(product.name),
                                          subtitle: Text(product.brand),
                                        ))
                                    .toList(),
                              ),
                            ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              if (_cart.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '${_cart.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // Filters
          _buildChipSelector(
            title: 'Metal Type',
            options: _metalTypes,
            selectedValue: _selectedMetalType,
            onSelected: (value) {
              setState(() => _selectedMetalType = value);
              _applyFilters();
            },
          ),
          _buildChipSelector(
            title: 'Select Category',
            options: _categories,
            selectedValue: _selectedCategory,
            onSelected: (value) {
              setState(() => _selectedCategory = value);
              _applyFilters();
            },
          ),

          if (isTmtCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _tmtBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) {
                setState(() => _selectedBrand = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Variant',
              options: _tmtGrades,
              selectedValue: _selectedGrade,
              onSelected: (value) {
                setState(() => _selectedGrade = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _tmtSizes,
              selectedValue: _selectedSize,
              onSelected: (value) {
                setState(() => _selectedSize = value);
                _applyFilters();
              },
            ),
          ],

          if (isAngleCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _angleBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) {
                setState(() => _selectedBrand = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _angleFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) {
                setState(() => _selectedFinish = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _angleSizes,
              selectedValue: _selectedSize,
              onSelected: (value) {
                setState(() => _selectedSize = value);
                _applyFilters();
              },
            ),
          ],

          if (isFlatCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _flatBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) {
                setState(() => _selectedBrand = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _flatFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) {
                setState(() => _selectedFinish = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _flatSizes,
              selectedValue: _selectedSize,
              onSelected: (value) {
                setState(() => _selectedSize = value);
                _applyFilters();
              },
            ),
          ],

          if (isSquareBarCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _squareBarBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) {
                setState(() => _selectedBrand = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _squareBarFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) {
                setState(() => _selectedFinish = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _squareBarSizes,
              selectedValue: _selectedSize,
              onSelected: (value) {
                setState(() => _selectedSize = value);
                _applyFilters();
              },
            ),
          ],

          if (isRoundBarCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _roundBarBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) {
                setState(() => _selectedBrand = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _roundBarFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) {
                setState(() => _selectedFinish = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _roundBarSizes,
              selectedValue: _selectedSize,
              onSelected: (value) {
                setState(() => _selectedSize = value);
                _applyFilters();
              },
            ),
          ],

          if (isChannelCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _channelBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) {
                setState(() => _selectedBrand = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _channelFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) {
                setState(() => _selectedFinish = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _channelSizes,
              selectedValue: _selectedSize,
              onSelected: (value) {
                setState(() => _selectedSize = value);
                _applyFilters();
              },
            ),
          ],

          if (isJoistCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _joistBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) {
                setState(() => _selectedBrand = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _joistFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) {
                setState(() => _selectedFinish = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _joistSizes,
              selectedValue: _selectedSize,
              onSelected: (value) {
                setState(() => _selectedSize = value);
                _applyFilters();
              },
            ),
          ],

          if (isZAngleCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _zAngleBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) {
                setState(() => _selectedBrand = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _zAngleFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) {
                setState(() => _selectedFinish = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _zAngleSizes,
              selectedValue: _selectedSize,
              onSelected: (value) {
                setState(() => _selectedSize = value);
                _applyFilters();
              },
            ),
          ],

          if (isGateChannelCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _gateChannelBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) {
                setState(() => _selectedBrand = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _gateChannelFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) {
                setState(() => _selectedFinish = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _gateChannelSizes,
              selectedValue: _selectedSize,
              onSelected: (value) {
                setState(() => _selectedSize = value);
                _applyFilters();
              },
            ),
          ],

          if (isTakCategory) ...[
            _buildChipSelector(
              title: 'Select Brand',
              options: _takBrands,
              selectedValue: _selectedBrand,
              onSelected: (value) {
                setState(() => _selectedBrand = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Finish',
              options: _takFinish,
              selectedValue: _selectedFinish,
              onSelected: (value) {
                setState(() => _selectedFinish = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Select Size',
              options: _takSizes,
              selectedValue: _selectedSize,
              onSelected: (value) {
                setState(() => _selectedSize = value);
                _applyFilters();
              },
            ),
            _buildChipSelector(
              title: 'Variety',
              options: _takVariety,
              selectedValue: _selectedVariety,
              onSelected: (value) {
                setState(() => _selectedVariety = value);
                _applyFilters();
              },
            ),
          ],

          const SizedBox(height: 16),

          ..._filteredProducts.map(
            (product) => Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Image.asset(
                  product.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                ),
                title: Text(product.name),
                subtitle: Text([
                  product.brand,
                  product.grade ?? product.finish ?? product.variety ?? product.type ?? '',
                  product.size,
                ].where((x) => x.isNotEmpty).join(' | ')),
                trailing: ElevatedButton(
                  onPressed: () => _addToCart(product),
                  child: const Text('Add to Cart'),
                ),
              ),
            ),
          ),

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
  final String? variety;
  final String? type;

  Product({
    required this.name,
    required this.metalType,
    required this.category,
    required this.brand,
    this.grade,
    this.finish,
    required this.size,
    required this.imageUrl,
    this.variety,
    this.type,
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
  Product(
    name: 'Angle A 25×3',
    metalType: 'Steel',
    category: 'Angles',
    brand: 'Patna Iron',
    finish: 'MS - Mild Steel (Black)',
    size: 'A 25×3',
    imageUrl: 'assets/images/angle.png',
  ),
  Product(
    name: 'Flat F 25×6',
    metalType: 'Steel',
    category: 'Flats',
    brand: 'Kamdhenu',
    finish: 'GI - Galvanised',
    size: 'F 25×6',
    imageUrl: 'assets/images/flat.png',
  ),
  Product(
    name: 'Square Bar 16 mm',
    metalType: 'Steel',
    category: 'Square Bars',
    brand: 'Patna Iron',
    finish: 'MS - Mild Steel (Black)',
    size: '16 mm',
    imageUrl: 'assets/images/square_bar.png',
  ),
  Product(
    name: 'Round Bar 20 mm',
    metalType: 'Steel',
    category: 'Round Bars',
    brand: 'Kamdhenu',
    finish: 'MS - Mild Steel (Black)',
    size: '20 mm',
    imageUrl: 'assets/images/round_bar.png',
  ),
  Product(
    name: 'Joist ISMB 100',
    metalType: 'Steel',
    category: 'Joist / ISMB',
    finish: 'MS - Mild Steel (Black)',
    brand: 'Patna Iron',
    size: 'ISMB 100',
    imageUrl: 'assets/images/joist.png',
  ),
  Product(
    name: 'Gate Channel 13 ft',
    metalType: 'Steel',
    category: 'Gate Channel',
    brand: 'Kamdhenu',
    finish: 'GI - Galvanised',
    size: 'Gt. Chn. 13 ft',
    imageUrl: 'assets/images/gate_channel.png',
  ),
  Product(
    name: 'Tak Sq. 10 mm',
    metalType: 'Steel',
    category: 'Tak Sq. / Flat',
    brand: 'Jagdamba',
    finish: 'MS - Mild Steel (Black)',
    size: 'Tak Sq. 10 mm',
    variety: 'Heavy',
    imageUrl: 'assets/images/tak_sq10mm.png',
  ),
  // Add additional dummyProducts as needed for your application
];
