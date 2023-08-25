import 'package:flutter/material.dart';
import 'package:task3ahmed_faisal/main.dart';
import '../Datamodels/Productmodel.dart';
import '../Styles/textstyles.dart';

class Display2 extends StatefulWidget {
  final ProductItem product;

  const Display2({super.key, required this.product});

  @override
  State<Display2> createState() => _Display2State();
}

class _Display2State extends State<Display2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffF2F2F2),
        ),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.product.thumbnail,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Name : ${widget.product.title}:',
                            style: storetext1,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: const Color(0xff000000),
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return Center(
                                  child: Text(
                                    'Product description:\n\n${widget.product.description}',
                                    style: TextStyle(
                                      color: Colors.brown[800],
                                      fontSize: 24,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Product description: ${widget.product.description}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: storetext1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              '\$${widget.product.price.toString()}',
                              style: const TextStyle(
                                color: Color(0xff252837),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'OpenSans',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
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
                                if (widget.product.count <= 30) {
                                  widget.product.count = widget.product.count + 1;
                                  y = y + widget.product.price;
                                } else {
                                  const AlertDialog(
                                    actions: [
                                      Center(
                                        child: Text(
                                          ' Max number of this unit reached',
                                          style: TextStyle(
                                            color: Color(0xff252837),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            fontFamily:
                                                'OpenSans',
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
                                    widget.product.count =
                                        widget.product.count - 1;
                                    y = y - widget.product.price;
                                  }
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
