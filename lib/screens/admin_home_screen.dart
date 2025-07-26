import 'package:flutter/material.dart';
import 'package:figma_app/widgets/bottom_nav_bar.dart'; // Reusing your bottom nav bar widget
import 'package:figma_app/widgets/custom_app_bar.dart'; // Reusing your custom app bar

// Placeholder screens for admin sections
class AdminDashboardContent extends StatelessWidget {
  const AdminDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0), // Padding for the entire content
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
        // The GridView content now becomes a SliverGrid
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Same horizontal padding as the list
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.0, // **ADJUSTED CHILD ASPECT RATIO (from 1.1 to 1.0)**
                                      // Making cards taller to fit content. (width / height = 1.0 means width = height)
            ),
            delegate: SliverChildListDelegate(
              [
                _buildMetricCard(context, 'Total Registered Users', '1,234', Icons.people_alt, Colors.teal),
                _buildMetricCard(context, 'Total Products Listed', '567', Icons.inventory_2, Colors.orange),
                _buildMetricCard(context, 'Total Orders', '890', Icons.receipt_long, Colors.blue),
                _buildMetricCard(context, 'Quotes Awaiting', '42', Icons.chat, Colors.purple),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0), // Padding for the rest of the list items
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
                // IMPORTANT: Add an even more generous buffer at the end of the SliverList
                SizedBox(height: kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom + 40.0),
              ],
            ),
          ),
        ),
        // This SliverFillRemaining is crucial. It ensures the scrollable area
        // always extends to the bottom of the viewport, effectively preventing overflow.
        SliverFillRemaining(
          hasScrollBody: false, // Ensures it just fills space, doesn't add scroll functionality
          child: Container(color: Colors.transparent), // A transparent container to fill the space
        ),
      ],
    );
  }

  // Helper widgets for building cards, tiles, etc.
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

// Data model for a User
class User {
  final String id;
  final String name;
  final String email;
  final String lastLogin;
  final String role;
  final String status;
  final String activity; // For filter dropdowns

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.lastLogin,
    required this.role,
    this.status = 'Active', // Default status
    this.activity = 'Online', // Default activity
  });
}

// Widget for displaying a single user item
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
          // TODO: Navigate to User Details Screen
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

// Base class for User/Seller/Admin lists
class UserListScreen extends StatefulWidget {
  final String userType; // "Buyer", "Seller", "Admin"
  final List<User> users;

  const UserListScreen({super.key, required this.userType, required this.users});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  String? _selectedStatus;
  String? _selectedActivity;
  final TextEditingController _searchController = TextEditingController();

  List<User> get _filteredUsers {
    List<User> filtered = widget.users;

    // Filter by search query
    if (_searchController.text.isNotEmpty) {
      final query = _searchController.text.toLowerCase();
      filtered = filtered.where((user) {
        return user.name.toLowerCase().contains(query) ||
               user.email.toLowerCase().contains(query) ||
               user.id.toLowerCase().contains(query);
      }).toList();
    }

    // Filter by status
    if (_selectedStatus != null && _selectedStatus != 'All') {
      filtered = filtered.where((user) => user.status == _selectedStatus).toList();
    }

    // Filter by activity
    if (_selectedActivity != null && _selectedActivity != 'All') {
      filtered = filtered.where((user) => user.activity == _selectedActivity).toList();
    }

    return filtered;
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {}); // Rebuild to apply search filter
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine the relevant roles for the "Role" filter based on the userType passed
    List<String> roleFilterOptions;
    if (widget.userType == 'Buyer') {
      roleFilterOptions = ['All', 'Buyer'];
    } else if (widget.userType == 'Seller') {
      roleFilterOptions = ['All', 'Seller'];
    } else if (widget.userType == 'Admin') {
      roleFilterOptions = ['All', 'Admin'];
    } else {
      roleFilterOptions = ['All', 'Buyer', 'Seller', 'Admin']; // Fallback for 'Users' if it's an all-encompassing list
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Search Bar
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
          // Filter Dropdowns
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Allows filters to scroll if many
            // IntrinsicWidth makes the Row size itself to its children's intrinsic widths.
            // This is key for allowing scrolling while using Flexible/Expanded for distribution.
            child: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to start for scrolling
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0), // Spacing between dropdowns
                      child: ConstrainedBox( // Constrain min width for dropdown
                        constraints: const BoxConstraints(minWidth: 100), // Adjusted for typical content
                        child: DropdownButtonFormField<String>(
                          isExpanded: true, // Crucial for dropdown to expand within its Flexible parent
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            labelText: 'Role',
                            isDense: true,
                          ),
                          value: _selectedStatus,
                          items: roleFilterOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, overflow: TextOverflow.ellipsis), // Ellipsis for long text
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedStatus = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 100),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ConstrainedBox( // No right padding for the last one
                      constraints: const BoxConstraints(minWidth: 100),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // List of Users
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

// --- Product Section Widgets ---

// Data model for a Product
class Product {
  final String id;
  final String name;
  final String category;
  final String supplier;
  final String status;
  final String quantity; // Using String for simplicity as per image, could be int

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.supplier,
    this.status = 'Available',
    this.quantity = 'High',
  });
}

// Widget for displaying a single product item
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
          // TODO: Navigate to Product Details Screen
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
                  // TODO: Implement View Product Details
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

// Product List Screen
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

    // Filter by search query
    if (_searchController.text.isNotEmpty) {
      final query = _searchController.text.toLowerCase();
      filtered = filtered.where((product) {
        return product.name.toLowerCase().contains(query) ||
               product.category.toLowerCase().contains(query) ||
               product.supplier.toLowerCase().contains(query) ||
               product.id.toLowerCase().contains(query);
      }).toList();
    }

    // Filter by status
    if (_selectedStatus != null && _selectedStatus != 'All') {
      filtered = filtered.where((product) => product.status == _selectedStatus).toList();
    }

    // Filter by quantity
    if (_selectedQuantity != null && _selectedQuantity != 'All') {
      filtered = filtered.where((product) => product.quantity == _selectedQuantity).toList();
    }

    // Filter by category
    if (_selectedCategory != null && _selectedCategory != 'All') {
      filtered = filtered.where((product) => product.category == _selectedCategory).toList();
    }

    return filtered;
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {}); // Rebuild to apply search filter
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Extract unique categories from dummy data for filter
    Set<String> categories = widget.products.map((p) => p.category).toSet();
    List<String> categoryOptions = ['All', ...categories.toList()];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Search Bar
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
          // Filter Dropdowns
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Allows filters to scroll if many
            child: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to start for scrolling
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 100),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 100),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 100),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          // List of Products
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


// Admin Home Screen (main wrapper)
class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> _adminNavItems = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Products'),
    BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Orders'),
    BottomNavigationBarItem(icon: Icon(Icons.format_quote), label: 'Quotes'),
  ];

  // Dummy data for users, sellers, and admins
  final List<User> _allUsers = [
    User(id: '12345', name: 'Noah Carter', email: 'noah.carter@email.com', lastLogin: '2 days ago', role: 'Buyer', status: 'Active', activity: 'Online'),
    User(id: '67890', name: 'Amelia Hayes', email: 'amelia.hayes@email.com', lastLogin: '1 week ago', role: 'Buyer', status: 'Active', activity: 'Offline'),
    User(id: '24680', name: 'Owen Mitchell', email: 'owen.mitchell@email.com', lastLogin: '1 month ago', role: 'Buyer', status: 'Inactive', activity: 'Offline'),
    User(id: '13579', name: 'Harper Reed', email: 'harper.reed@email.com', lastLogin: '3 months ago', role: 'Buyer', status: 'Active', activity: 'Offline'),
    User(id: '97531', name: 'Caleb Foster', email: 'caleb.foster@email.com', lastLogin: '6 months ago', role: 'Buyer', status: 'Blocked', activity: 'Offline'),
    User(id: '10101', name: 'Liam Johnson', email: 'liam.johnson@example.com', lastLogin: '1 day ago', role: 'Buyer', status: 'Active', activity: 'Online'),
    User(id: '20202', name: 'Olivia Davis', email: 'olivia.davis@example.com', lastLogin: '5 days ago', role: 'Buyer', status: 'Active', activity: 'Offline'),
    User(id: '30303', name: 'Ethan Miller', email: 'ethan.miller@example.com', lastLogin: '2 weeks ago', role: 'Buyer', status: 'Inactive', activity: 'Offline'),

    User(id: 'S001', name: 'Sophia Wilson', email: 'sophia.w@seller.com', lastLogin: '1 hour ago', role: 'Seller', status: 'Active', activity: 'Online'),
    User(id: 'S002', name: 'Jackson Moore', email: 'jackson.m@seller.com', lastLogin: '3 days ago', role: 'Seller', status: 'Active', activity: 'Online'),
    User(id: 'S003', name: 'Ava Taylor', email: 'ava.t@seller.com', lastLogin: '2 months ago', role: 'Seller', status: 'Inactive', activity: 'Offline'),
    User(id: 'S004', name: 'Lucas White', email: 'lucas.w@seller.com', lastLogin: '1 day ago', role: 'Seller', status: 'Active', activity: 'Online'),
    User(id: 'S005', name: 'Mia Harris', email: 'mia.h@seller.com', lastLogin: '1 week ago', role: 'Seller', status: 'Blocked', activity: 'Offline'),

    User(id: 'A001', name: 'Administrator One', email: 'admin1@steelsuvidha.com', lastLogin: 'Just now', role: 'Admin', status: 'Active', activity: 'Online'),
    User(id: 'A002', name: 'Admin Two', email: 'admin2@steelsuvidha.com', lastLogin: '4 hours ago', role: 'Admin', status: 'Active', activity: 'Online'),
  ];

  // Dummy data for products
  final List<Product> _allProducts = [
    Product(id: '12345', name: 'Steel Sheet', category: 'Steel Sheets', supplier: 'SteelCo', status: 'Available', quantity: 'High'),
    Product(id: '67890', name: 'Steel Coil', category: 'Steel Coils', supplier: 'MetalCorp', status: 'Available', quantity: 'High'),
    Product(id: '11223', name: 'Steel Bar', category: 'Steel Bars', supplier: 'IronWorks', status: 'Available', quantity: 'Medium'),
    Product(id: '33445', name: 'Steel Sheet', category: 'Steel Sheets', supplier: 'SteelCo', status: 'Out of Stock', quantity: 'Low'),
    Product(id: '55667', name: 'Steel Coil', category: 'Steel Coils', supplier: 'MetalCorp', status: 'Available', quantity: 'Medium'),
    Product(id: '77889', name: 'Steel Bar', category: 'Steel Bars', supplier: 'IronWorks', status: 'Available', quantity: 'High'),
    Product(id: '99001', name: 'Alloy Plate', category: 'Specialty Alloys', supplier: 'AlloyPro', status: 'Available', quantity: 'Medium'),
    Product(id: '22334', name: 'Rebar', category: 'Steel Bars', supplier: 'ConcreteStrong', status: 'Available', quantity: 'High'),
    Product(id: '44556', name: 'Stainless Tube', category: 'Steel Tubes', supplier: 'TubeFlex', status: 'On Order', quantity: 'Low'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _adminNavItems.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Helper to filter users by role
  List<User> _getUsersByRole(String role) {
    return _allUsers.where((user) => user.role == role).toList();
  }

  // Content for each admin tab
  Widget _getAdminTabContent(int index) {
    switch (index) {
      case 0:
        return const AdminDashboardContent(); // Dashboard
      case 1:
        return UserListScreen(userType: 'Buyer', users: _getUsersByRole('Buyer')); // Users (Buyers tab)
      case 2:
        return ProductListScreen(products: _allProducts); // Products tab
      case 3:
        return const Center(child: Text('Orders Management Screen (To be implemented)')); // Orders
      case 4:
        return UserListScreen(userType: 'Admin', users: _getUsersByRole('Admin')); // Admins (reusing UserListScreen for Admin role)
      default:
        return const Center(child: Text('Unknown Admin Section'));
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentTitle = _adminNavItems[_selectedIndex].label ?? 'Admin Panel';

    // Special handling for "Users" and "Products" tabs to show specific titles
    if (currentTitle == 'Users') {
      currentTitle = 'User Management'; // As per your screenshot
    } else if (currentTitle == 'Products') {
      currentTitle = 'Products'; // As per your screenshot
    } else if (currentTitle == 'Dashboard') {
      currentTitle = 'SteelSuvidha Admin'; // As per your screenshot
    }


    return Scaffold(
      appBar: CustomAppBar(
        title: currentTitle,
        showBackButton: false,
        showShoppingCart: false,
        leadingWidget: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Admin Menu / Drawer will open here')),
            );
            // TODO: Implement actual Drawer for navigation or side menu
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add), // Plus icon as seen in screenshots
            onPressed: () {
              // Action for adding new user/product based on current tab
              if (_selectedIndex == 1) { // Users tab
                 ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add New User')),
                );
                // TODO: Navigate to Add New User Screen
              } else if (_selectedIndex == 2) { // Products tab
                 ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add New Product')),
                );
                // TODO: Navigate to Add New Product Screen
              } else {
                 ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add functionality for this section')),
                );
              }
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(), // Disable swiping between tabs
        children: List.generate(_adminNavItems.length, (index) => _getAdminTabContent(index)),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
            _tabController.animateTo(index);
          });
        },
        items: _adminNavItems,
      ),
    );
  }
}