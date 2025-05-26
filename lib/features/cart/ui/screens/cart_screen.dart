import 'package:ecommerce_app/app/assets_path.dart'; // Make sure this path is correct
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_colors.dart'; // Make sure this path is correct
import '../../../common/controllers/main_bottom_nav_bar_controller.dart'; // Make sure this path is correct
import 'package:intl/intl.dart';
import '../widgets/incrementDecrementCartWidget.dart'; // For currency formatting

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {"name": "New Year Special Shoe", "price": 100.0, "quantity": 1, "imageUrl": AssetsPath.shoeImage, "color": "Red", "size": "X"},
    {"name": "Special Red Shoe", "price": 120.0, "quantity": 1, "imageUrl": AssetsPath.shoeImage, "color": "Blue", "size": "M"},
  ];

  // Helper method for navigation
  void _navigateToHome() {
    Get.find<MainBottomNavBarController>().moveToHome();
  }

  double calculateTotal() {
    double total = 0.0;
    for (final item in cartItems) {
      final price = (item['price'] as num?)?.toDouble() ?? 0.0;
      final quantity = (item['quantity'] as num?)?.toInt() ?? 0;
      total += price * quantity;
    }
    return total;
  }

  // Update quantity based on user interaction
  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      cartItems[index]['quantity'] = newQuantity;
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _navigateToHome();
        return false; // Prevent default back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          leading: IconButton(
            onPressed: _navigateToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: cartItems.isEmpty
                  ? const Center(
                child: Text(
                  'Your cart is empty.',
                  style: TextStyle(fontSize: 18),
                ),
              )
                  : ListView.builder(
                itemCount: cartItems.length,
                padding: const EdgeInsets.symmetric(vertical: 8.0), // Add some padding to the list
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  final String itemName = item['name'] ?? 'No Name';
                  final double itemPrice = (item['price'] as num?)?.toDouble() ?? 0.0;
                  final int itemQuantity = (item['quantity'] as num?)?.toInt() ?? 0;
                  final String itemImageUrl = item['imageUrl'] ?? AssetsPath.shoeImage; // Fallback image
                  final String itemColor = item['color'] ?? "Color not specified";  // Color for the product
                  final String itemSize = item['size'] ?? "Size not specified";  // Size for the product

                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          // Image
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                itemImageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.white,
                                    child: const Icon(Icons.image_not_supported, color: Colors.grey),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Item Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product Name
                                Text(
                                  itemName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),

                                // Color and Size Info
                                Text(
                                  "Color: $itemColor, Size: $itemSize",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 8),  // Spacing between details and price

                                // Price
                                Text(
                                  NumberFormat.currency(locale: 'en_US', symbol: '\$').format(itemPrice),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.themeColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Quantity and Delete
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete, size: 28),
                                onPressed: () => _removeItem(index),
                                padding: const EdgeInsets.only(top: 8),
                                constraints: const BoxConstraints(),
                              ),
                              const SizedBox(height: 16),
                              IncrementDecrementWidget(
                                initialQuantity: itemQuantity,
                                onChange: (newQuantity) {
                                  _updateQuantity(index, newQuantity);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (cartItems.isNotEmpty) _buildTotalSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text('Total Price'),
              Text(
                '\$${calculateTotal()}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: () {}, child: const Text('Checkout')),
          ),
        ],
      ),
    );
  }
}