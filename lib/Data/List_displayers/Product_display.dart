
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task3ahmed_faisal/main.dart';
import '../Datamodels/Productmodel.dart';

class Display extends StatefulWidget {
  final ProductItem product;

  const Display({super.key, required this.product});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: 250,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width:  200,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                  ),
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.product.thumbnail,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${widget.product.title}:',
              style: TextStyle(
                color: const Color(0xff646E77),
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontFamily: GoogleFonts
                    .openSans()
                    .fontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return Center(
                        child: Text('Product description:\n\n${widget.product
                            .description}',
                          style: TextStyle(
                            color: Colors.brown[800],
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),

                      );
                    });
              },
              child: Expanded(
                child: Text(widget.product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,

                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '\$${widget.product.price.toString()}',
              style: TextStyle(
                color: const Color(0xff252837),
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: GoogleFonts
                    .openSans()
                    .fontFamily,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.product.count <=30) {
                        widget.product.count = widget.product.count + 1;
                        y = y + widget.product.price;
                      }
                      else {
                        AlertDialog(
                          actions: [
                            Center(
                              child:  Text(
                                ' Max number of this unit reached',
                                style: TextStyle(
                                  color: const Color(0xff252837),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: GoogleFonts
                                      .openSans()
                                      .fontFamily,
                                ),
                              ),
                            )
                          ],
                        );
                      }
                      setState(() {});
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 45,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      '\n${widget.product.count.toString()}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: 45,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (widget.product.count > 0) {
                          widget.product.count = widget.product.count - 1;
                          y = y - widget.product.price;
                        }
                      });
                    },
                    child: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ));
  }
}
