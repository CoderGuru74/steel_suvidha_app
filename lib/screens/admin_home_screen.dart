import 'package:flutter/material.dart';
import 'package:figma_app/widgets/bottom_nav_bar.dart'; // Ensure this path is correct
import 'package:figma_app/widgets/custom_app_bar.dart'; // Ensure this path is correct

// ===============================================
// Data Models
// ===============================================

class User {
  final String id;
  final String name;
  final String email;
  final String lastLogin;
  final String role;
  final String status;
  final String activity;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.lastLogin,
    required this.role,
    this.status = 'Active',
    this.activity = 'Online',
  });
}

class Product {
  final String id;
  final String name;
  final String category;
  final String supplier;
  final String status;
  final String quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.supplier,
    this.status = 'Available',
    this.quantity = 'High',
  });
}

class Quote {
  final String id;
  final String buyerName; // Correct field name
  final String productName;
  final String requestedQuantity;
  final String status;
  final DateTime dateGenerated;

  Quote({
    required this.id,
    required this.buyerName, // Correct field name
    required this.productName,
    required this.requestedQuantity,
    required this.status,
    required this.dateGenerated,
  });
}

// ===============================================
// Dummy Data (for demonstration)
// ===============================================

final List<User> dummyUsers = [
  User(id: 'U001', name: 'Alice Smith', email: 'alice@example.com', lastLogin: '2025-07-25', role: 'Buyer', status: 'Active', activity: 'Online'),
  User(id: 'U002', name: 'Bob Johnson', email: 'bob@example.com', lastLogin: '2025-07-24', role: 'Seller', status: 'Active', activity: 'Offline'),
  User(id: 'U003', name: 'Charlie Brown', email: 'charlie@example.com', lastLogin: '2025-07-23', role: 'Admin', status: 'Active', activity: 'Online'),
  User(id: 'U004', name: 'Diana Prince', email: 'diana@example.com', lastLogin: '2025-07-25', role: 'Buyer', status: 'Inactive', activity: 'Offline'),
  User(id: 'U005', name: 'Eve Adams', email: 'eve@example.com', lastLogin: '2025-07-22', role: 'Seller', status: 'Blocked', activity: 'Offline'),
  User(id: 'U006', name: 'Frank White', email: 'frank@example.com', lastLogin: '2025-07-21', role: 'Buyer', status: 'Active', activity: 'Online'),
  User(id: 'U007', name: 'Grace Lee', email: 'grace@example.com', lastLogin: '2025-07-20', role: 'Admin', status: 'Active', activity: 'Offline'),
  User(id: 'U008', name: 'Henry Ford', email: 'henry@example.com', lastLogin: '2025-07-19', role: 'Seller', status: 'Active', activity: 'Online'),
  User(id: 'U009', name: 'Ivy Green', email: 'ivy@example.com', lastLogin: '2025-07-18', role: 'Buyer', status: 'Inactive', activity: 'Offline'),
  User(id: 'U010', name: 'Jack Black', email: 'jack@example.com', lastLogin: '2025-07-17', role: 'Seller', status: 'Active', activity: 'Online'),
];

final List<Product> dummyProducts = [
  Product(id: 'P001', name: 'Steel Rebar 10mm', category: 'Construction', supplier: 'ABC Steel Inc.', status: 'Available', quantity: 'High'),
  Product(id: 'P002', name: 'Stainless Steel Sheet', category: 'Manufacturing', supplier: 'XYZ Metals', status: 'Out of Stock', quantity: 'Low'),
  Product(id: 'P003', name: 'Alloy Steel Bar', category: 'Automotive', supplier: 'Global Alloys', status: 'On Order', quantity: 'Medium'),
  Product(id: 'P004', name: 'Carbon Steel Pipe', category: 'Piping', supplier: 'Pipe Solutions', status: 'Available', quantity: 'High'),
  Product(id: 'P005', name: 'Galvanized Iron Wire', category: 'General Hardware', supplier: 'Iron Works Co.', status: 'Available', quantity: 'High'),
  Product(id: 'P006', name: 'Copper Rods', category: 'Electrical', supplier: 'ElectroSupplies', status: 'Out of Stock', quantity: 'Low'),
  Product(id: 'P007', name: 'Brass Sheets', category: 'Decor', supplier: 'Artisan Metals', status: 'Available', quantity: 'Medium'),
  Product(id: 'P008', name: 'Aluminum Coils', category: 'Packaging', supplier: 'Lightweight Metals', status: 'On Order', quantity: 'High'),
  Product(id: 'P009', name: 'Titanium Fasteners', category: 'Aerospace', supplier: 'Aerospace Connect', status: 'Available', quantity: 'Low'),
  Product(id: 'P010', name: 'Cast Iron Fittings', category: 'Plumbing', supplier: 'Aqua Pipes', status: 'Available', quantity: 'High'),
];

final List<Quote> dummyQuotes = [
  Quote(id: 'Q001', buyerName: 'Alice Smith', productName: 'Steel Rebar 10mm', requestedQuantity: '1000 kg', status: 'Pending', dateGenerated: DateTime.now().subtract(const Duration(days: 2))),
  Quote(id: 'Q002', buyerName: 'Bob Johnson', productName: 'Stainless Steel Sheet', requestedQuantity: '50 sheets', status: 'Accepted', dateGenerated: DateTime.now().subtract(const Duration(days: 5))),
  Quote(id: 'Q003', buyerName: 'Charlie Brown', productName: 'Alloy Steel Bar', requestedQuantity: '200 units', status: 'In Progress', dateGenerated: DateTime.now().subtract(const Duration(days: 1))),
  Quote(id: 'Q004', buyerName: 'Diana Prince', productName: 'Carbon Steel Pipe', requestedQuantity: '500m', status: 'Rejected', dateGenerated: DateTime.now().subtract(const Duration(days: 10))),
  Quote(id: 'Q005', buyerName: 'Eve Adams', productName: 'Steel Rebar 10mm', requestedQuantity: '200 kg', status: 'Pending', dateGenerated: DateTime.now().subtract(const Duration(hours: 5))),
  Quote(id: 'Q006', buyerName: 'Frank White', productName: 'Galvanized Iron Wire', requestedQuantity: '10 rolls', status: 'Delivered', dateGenerated: DateTime.now().subtract(const Duration(days: 15))),
  Quote(id: 'Q007', buyerName: 'Grace Lee', productName: 'Copper Rods', requestedQuantity: '150 units', status: 'In Progress', dateGenerated: DateTime.now().subtract(const Duration(days: 3))),
  Quote(id: 'Q008', buyerName: 'Henry Ford', productName: 'Brass Sheets', requestedQuantity: '5 sheets', status: 'Pending', dateGenerated: DateTime.now().subtract(const Duration(hours: 10))),
  Quote(id: 'Q009', buyerName: 'Ivy Green', productName: 'Aluminum Coils', requestedQuantity: '30 kg', status: 'Accepted', dateGenerated: DateTime.now().subtract(const Duration(days: 7))),
  Quote(id: 'Q010', buyerName: 'Jack Black', productName: 'Titanium Fasteners', requestedQuantity: '1000 pcs', status: 'Rejected', dateGenerated: DateTime.now().subtract(const Duration(days: 20))),
];


// ===============================================
// Admin Dashboard Content Widget
// ===============================================

class AdminDashboardContent extends StatelessWidget {
  const AdminDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Text(
                  'Key Metrics',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildListDelegate(
              [
                _buildMetricCard(context, 'Total Registered Users', dummyUsers.length.toString(), Icons.people_alt, Colors.teal),
                _buildMetricCard(context, 'Total Products Listed', dummyProducts.length.toString(), Icons.inventory_2, Colors.orange),
                _buildMetricCard(context, 'Total Orders', '890', Icons.receipt_long, Colors.blue), // Placeholder
                _buildMetricCard(context, 'Quotes Awaiting', dummyQuotes.where((q) => q.status == 'Pending').length.toString(), Icons.chat, Colors.purple),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 30),
                Text(
                  'Recent Activity Feed',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                _buildActivityTile('Product Update', '2 hours ago', 'Admin updated product details', Icons.edit_note),
                _buildActivityTile('New Order', '4 hours ago', 'Buyer placed a new order', Icons.shopping_cart),
                _buildActivityTile('Quote Accepted', '6 hours ago', 'Seller accepted a quote', Icons.check_circle_outline),
                _buildActivityTile('User Registered', '1 day ago', 'New user signed up', Icons.person_add),
                const SizedBox(height: 30),
                Text(
                  'System Alerts',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                _buildAlertTile('Stock Alert', '1 hour ago', 'Low stock alert for product X', Icons.error_outline, Colors.red),
                _buildAlertTile('Payment Error', '3 hours ago', 'Payment processing error for order Y', Icons.payment, Colors.red),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Add User functionality')),
                          );
                        },
                        icon: const Icon(Icons.person_add),
                        label: const Text('Add User'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Add Product functionality')),
                          );
                        },
                        icon: const Icon(Icons.add_shopping_cart),
                        label: const Text('Add Product'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('View All Quotes functionality')),
                      );
                    },
                    icon: const Icon(Icons.format_quote),
                    label: const Text('View All Quotes'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                SizedBox(height: kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom + 40.0),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }

  Widget _buildMetricCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityTile(String title, String time, String description, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: Colors.blueGrey),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertTile(String title, String time, String description, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: color),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===============================================
// User Management Widgets
// ===============================================

class UserListItem extends StatelessWidget {
  final User user;

  const UserListItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on ${user.name} (${user.role})')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User ID: ${user.id} | Name: ${user.name}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Email: ${user.email}',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Last Login: ${user.lastLogin}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.role,
                      style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class UserListScreen extends StatefulWidget {
  final String userType;
  final List<User> users;

  const UserListScreen({super.key, required this.userType, required this.users});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  String? _selectedRole;
  String? _selectedStatus;
  String? _selectedActivity;
  final TextEditingController _searchController = TextEditingController();

  List<User> get _filteredUsers {
    List<User> filtered = widget.users;

    if (_searchController.text.isNotEmpty) {
      final query = _searchController.text.toLowerCase();
      filtered = filtered.where((user) {
        return user.name.toLowerCase().contains(query) ||
            user.email.toLowerCase().contains(query) ||
            user.id.toLowerCase().contains(query);
      }).toList();
    }

    if (_selectedRole != null && _selectedRole != 'All') {
      filtered = filtered.where((user) => user.role == _selectedRole).toList();
    }

    if (_selectedStatus != null && _selectedStatus != 'All') {
      filtered = filtered.where((user) => user.status == _selectedStatus).toList();
    }

    if (_selectedActivity != null && _selectedActivity != 'All') {
      filtered = filtered.where((user) => user.activity == _selectedActivity).toList();
    }

    return filtered;
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> roleFilterOptions;
    if (widget.userType == 'All') {
      roleFilterOptions = ['All', 'Buyer', 'Seller', 'Admin'];
    } else {
      roleFilterOptions = ['All', widget.userType];
    }

    if (_selectedRole == null && roleFilterOptions.isNotEmpty) {
      _selectedRole = roleFilterOptions.first;
    }
    if (_selectedStatus == null) {
      _selectedStatus = 'All';
    }
    if (_selectedActivity == null) {
      _selectedActivity = 'All';
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search users...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
          const SizedBox(height: 10),
          // MODIFIED: Replaced SizedBox(width: ... child: Row()) with Wrap()
          Wrap( // Replaced Row, removes need for Expanded/Flexible
            spacing: 8.0, // horizontal space between chips/dropdowns
            runSpacing: 8.0, // vertical space between rows of chips/dropdowns
            children: [
              // Optionally wrap each DropdownButtonFormField in a SizedBox to give it a minimum consistent width
              // e.g., SizedBox(width: 150, child: DropdownButtonFormField...)
              SizedBox( // Added SizedBox for a consistent width, adjust as needed
                width: 110, // Approximate width to fit in filters, adjust based on screen size/content
                child: DropdownButtonFormField<String>(
                  isExpanded: true, // Still good to have for text overflow within dropdown
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Revert to slightly more padding as space is now managed by Wrap
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    labelText: 'Role',
                    isDense: true,
                  ),
                  value: _selectedRole,
                  items: roleFilterOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRole = newValue;
                    });
                  },
                ),
              ),
              SizedBox( // Added SizedBox for a consistent width, adjust as needed
                width: 110, // Approximate width
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Revert to slightly more padding
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    labelText: 'Status',
                    isDense: true,
                  ),
                  value: _selectedStatus,
                  items: <String>['All', 'Active', 'Inactive', 'Blocked'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedStatus = newValue;
                    });
                  },
                ),
              ),
              SizedBox( // Added SizedBox for a consistent width, adjust as needed
                width: 110, // Approximate width
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Revert to slightly more padding
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    labelText: 'Activity',
                    isDense: true,
                  ),
                  value: _selectedActivity,
                  items: <String>['All', 'Online', 'Offline'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedActivity = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredUsers.length,
              itemBuilder: (context, index) {
                return UserListItem(user: _filteredUsers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ===============================================
// Product Management Widgets
// ===============================================

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on ${product.name}')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product ID: ${product.id} | Name: ${product.name}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Category: ${product.category}',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Supplier: ${product.supplier}',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('View details for ${product.name}')),
                  );
                },
                child: const Text('View'),
              ),
              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  final List<Product> products;

  const ProductListScreen({super.key, required this.products});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String? _selectedStatus;
  String? _selectedQuantity;
  String? _selectedCategory;
  final TextEditingController _searchController = TextEditingController();

  List<Product> get _filteredProducts {
    List<Product> filtered = widget.products;

    if (_searchController.text.isNotEmpty) {
      final query = _searchController.text.toLowerCase();
      filtered = filtered.where((product) {
        return product.name.toLowerCase().contains(query) ||
            product.category.toLowerCase().contains(query) ||
            product.supplier.toLowerCase().contains(query) ||
            product.id.toLowerCase().contains(query);
      }).toList();
    }

    if (_selectedStatus != null && _selectedStatus != 'All') {
      filtered = filtered.where((product) => product.status == _selectedStatus).toList();
    }

    if (_selectedQuantity != null && _selectedQuantity != 'All') {
      filtered = filtered.where((product) => product.quantity == _selectedQuantity).toList();
    }

    if (_selectedCategory != null && _selectedCategory != 'All') {
      filtered = filtered.where((product) => product.category == _selectedCategory).toList();
    }

    return filtered;
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Set<String> categories = widget.products.map((p) => p.category).toSet();
    List<String> categoryOptions = ['All', ...categories.toList()];

    if (_selectedStatus == null) {
      _selectedStatus = 'All';
    }
    if (_selectedQuantity == null) {
      _selectedQuantity = 'All';
    }
    if (_selectedCategory == null && categoryOptions.isNotEmpty) {
      _selectedCategory = categoryOptions.first;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search products or suppliers...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
          const SizedBox(height: 10),
          // MODIFIED: Replaced SizedBox(width: ... child: Row()) with Wrap()
          Wrap( // Replaced Row, removes need for Expanded/Flexible
            spacing: 8.0, // horizontal space between chips/dropdowns
            runSpacing: 8.0, // vertical space between rows of chips/dropdowns
            children: [
              SizedBox( // Added SizedBox for a consistent width, adjust as needed
                width: 110, // Approximate width
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Revert to slightly more padding
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    labelText: 'Status',
                    isDense: true,
                  ),
                  value: _selectedStatus,
                  items: <String>['All', 'Available', 'Out of Stock', 'On Order'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedStatus = newValue;
                    });
                  },
                ),
              ),
              SizedBox( // Added SizedBox for a consistent width, adjust as needed
                width: 110, // Approximate width
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Revert to slightly more padding
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    labelText: 'Quantity',
                    isDense: true,
                  ),
                  value: _selectedQuantity,
                  items: <String>['All', 'High', 'Medium', 'Low'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedQuantity = newValue;
                    });
                  },
                ),
              ),
              SizedBox( // Added SizedBox for a consistent width, adjust as needed
                width: 110, // Approximate width
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Revert to slightly more padding
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    labelText: 'Category',
                    isDense: true,
                  ),
                  value: _selectedCategory,
                  items: categoryOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductListItem(product: _filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ===============================================
// Quotes Management Widgets
// ===============================================

class QuoteListItem extends StatelessWidget {
  final Quote quote;

  const QuoteListItem({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on Quote ID: ${quote.id}')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row( // This is the Row at line 879:15
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded( // ADDED: Expanded to give primary text flexibility
                    child: Text(
                      'Quote ID: ${quote.id} | Buyer: ${quote.buyerName}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis, // ADDED: Handle overflow within Expanded
                    ),
                  ),
                  const SizedBox(width: 8), // ADDED: Small space between the two texts
                  Text(
                    quote.status,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: quote.status == 'Pending'
                          ? Colors.orange.shade700
                          : quote.status == 'In Progress'
                              ? Colors.blue.shade700
                              : quote.status == 'Delivered'
                                  ? Colors.green.shade700
                                  : Colors.red.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Product: ${quote.productName} (${quote.requestedQuantity})',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                'Generated: ${quote.dateGenerated.toLocal().toString().split(' ')[0]}',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuotesListScreen extends StatefulWidget {
  final List<Quote> quotes;

  const QuotesListScreen({super.key, required this.quotes});

  @override
  State<QuotesListScreen> createState() => _QuotesListScreenState();
}

class _QuotesListScreenState extends State<QuotesListScreen> {
  String? _selectedStatusFilter;
  String? _selectedDateRangeFilter;
  DateTime? _selectedSpecificDate;
  final TextEditingController _searchController = TextEditingController();

  List<Quote> get _filteredQuotes {
    List<Quote> filtered = widget.quotes;

    if (_searchController.text.isNotEmpty) {
      final query = _searchController.text.toLowerCase();
      filtered = filtered.where((quote) {
        return quote.id.toLowerCase().contains(query) ||
            quote.buyerName.toLowerCase().contains(query) ||
            quote.productName.toLowerCase().contains(query);
      }).toList();
    }

    if (_selectedStatusFilter != null && _selectedStatusFilter != 'All') {
      filtered = filtered.where((quote) => quote.status == _selectedStatusFilter).toList();
    }

    if (_selectedDateRangeFilter != null && _selectedDateRangeFilter != 'All') {
      final now = DateTime.now();
      if (_selectedDateRangeFilter == 'Today') {
        filtered = filtered.where((quote) => quote.dateGenerated.day == now.day && quote.dateGenerated.month == now.month && quote.dateGenerated.year == now.year).toList();
      } else if (_selectedDateRangeFilter == 'Last 7 Days') {
        final sevenDaysAgo = now.subtract(const Duration(days: 7));
        filtered = filtered.where((quote) => quote.dateGenerated.isAfter(sevenDaysAgo)).toList();
      } else if (_selectedDateRangeFilter == 'This Month') {
        filtered = filtered.where((quote) => quote.dateGenerated.month == now.month && quote.dateGenerated.year == now.year).toList();
      }
    }

    if (_selectedSpecificDate != null) {
      filtered = filtered.where((quote) =>
          quote.dateGenerated.day == _selectedSpecificDate!.day &&
          quote.dateGenerated.month == _selectedSpecificDate!.month &&
          quote.dateGenerated.year == _selectedSpecificDate!.year).toList();
    }

    return filtered;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedSpecificDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedSpecificDate) {
      setState(() {
        _selectedSpecificDate = picked;
        _selectedDateRangeFilter = 'Custom Date';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedStatusFilter == null) {
      _selectedStatusFilter = 'All';
    }
    if (_selectedDateRangeFilter == null) {
      _selectedDateRangeFilter = 'All';
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search quotes by ID, buyer, or product...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
          const SizedBox(height: 10),
          // MODIFIED: Replaced SizedBox(width: ... child: Row()) with Wrap()
          Wrap( // Replaced Row, removes need for Expanded/Flexible
            spacing: 8.0, // horizontal space between chips/dropdowns
            runSpacing: 8.0, // vertical space between rows of chips/dropdowns
            children: [
              SizedBox( // Added SizedBox for a consistent width, adjust as needed
                width: 110, // Approximate width
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Revert to slightly more padding
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    labelText: 'Status',
                    isDense: true,
                  ),
                  value: _selectedStatusFilter,
                  items: <String>['All', 'Pending', 'In Progress', 'Accepted', 'Rejected', 'Delivered'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedStatusFilter = newValue;
                    });
                  },
                ),
              ),
              SizedBox( // Added SizedBox for a consistent width, adjust as needed
                width: 110, // Approximate width
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Revert to slightly more padding
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    labelText: 'Date Range',
                    isDense: true,
                  ),
                  value: _selectedDateRangeFilter,
                  items: <String>['All', 'Today', 'Last 7 Days', 'This Month', 'Custom Date'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDateRangeFilter = newValue;
                      if (newValue == 'Custom Date') {
                        _selectedSpecificDate = null; // Clear previous custom date
                        _selectDate(context);
                      } else {
                        _selectedSpecificDate = null;
                      }
                    });
                  },
                ),
              ),
              if (_selectedDateRangeFilter == 'Custom Date' && _selectedSpecificDate != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Chip(
                    label: Text(_selectedSpecificDate!.toLocal().toString().split(' ')[0]),
                    onDeleted: () {
                      setState(() {
                        _selectedSpecificDate = null;
                        _selectedDateRangeFilter = 'All';
                      });
                    },
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredQuotes.length,
              itemBuilder: (context, index) {
                return QuoteListItem(quote: _filteredQuotes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ===============================================
// AdminHomeScreen (Main Container)
// ===============================================

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const AdminDashboardContent(),
      UserListScreen(userType: 'All', users: dummyUsers),
      ProductListScreen(products: dummyProducts),
      QuotesListScreen(quotes: dummyQuotes),
      const Center(child: Text('Settings Content Placeholder')), // Placeholder for settings
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getPageTitle(int index) {
    switch (index) {
      case 0:
        return 'Admin Dashboard';
      case 1:
        return 'User Management';
      case 2:
        return 'Product Management';
      case 3:
        return 'Quotes Management';
      case 4:
        return 'Settings';
      default:
        return 'Admin Panel';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _getPageTitle(_selectedIndex),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications pressed')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile pressed')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: 'Quotes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}