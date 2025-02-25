import 'package:dil_hack_e_commerce/api/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:intl/intl.dart';

class Sku {
  final double actualPrice;
  final double discount;

  Sku({required this.actualPrice, required this.discount});
}

class ProductDetailpage extends StatelessWidget {
  final Product product;

  ProductDetailpage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final actualPrice = product.variations.first.skus.first.actualPrice;
    final discount = product.variations.first.skus.first.discount;

    final formattedPrice = NumberFormat('#,##0').format(actualPrice);

    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: height * 0.6,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.variations.first.images.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.6,
                    child: InstaImageViewer(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                            product.variations.first.images[index]),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    capitalizeFirstLetter(product.productName),
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  capitalizeFirstLetter(product.productDescription),
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  '₹$formattedPrice',
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Similar Products',
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('asset/saree/1.jpeg'),
                    backgroundColor: Colors.grey.shade200,
                    radius: 30,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBar.builder(
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.green,
                  ),
                  onRatingUpdate: (index) {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Size',
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                SizeSelector(),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Product Details',
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DetailRow(label: 'Color', value: ''),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DetailRow(
                label: 'Weight', value: formatDouble(product.productWeight)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DetailRow(label: 'Brand', value: product.productBrand),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DetailRow(label: 'Type', value: product.productType),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DetailRow(label: 'PublishDate', value: product.productBrand),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                DetailRow(label: 'PublishStatus', value: product.productName),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                label: Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: Color(0xFFFAAAB1),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.double_arrow, color: Colors.black),
                label: Text(
                  'Buy Now',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFAAAB1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 34, vertical: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String capitalizeFirstLetter(String str) {
    if (str.isEmpty) return str;
    return str[0].toUpperCase() + str.substring(1);
  }

  String formatDouble(double value) {
    if (value == value.toInt()) {
      return value.toInt().toString();
    } else {
      return value.toString();
    }
  }
}

class SizeSelector extends StatefulWidget {
  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String selectedSize = '';

  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: sizes.map((size) {
        return ChoiceChip(
          label: Text(size),
          selected: selectedSize == size,
          onSelected: (selected) {
            setState(() {
              selectedSize = selected ? size : '';
            });
          },
          selectedColor: Color(0xFFFAAAB1),
          labelStyle: TextStyle(
            color: selectedSize == size ? Colors.white : Colors.black,
          ),
        );
      }).toList(),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
