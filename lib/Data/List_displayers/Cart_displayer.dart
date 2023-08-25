import 'package:flutter/material.dart';
import 'package:task3ahmed_faisal/main.dart';

import '../Datamodels/Productmodel.dart';


class Cartdisp extends StatefulWidget {
  final ProductItem product2;

  const Cartdisp({super.key, required this.product2 });

  @override
  State<Cartdisp> createState() => _CartdispState();
}

class _CartdispState extends State<Cartdisp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 0,
        top: 10,
        bottom: 10,
        left: 5,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(widget.product2.thumbnail),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  'x ${widget.product2.count.toString()}\n${widget.product2.title}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    FloatingActionButton(
                      mini: true,
                      child: const Icon(Icons.add),
                      onPressed: () {
                        if (widget.product2.count <= 31) {
                          widget.product2.count = widget.product2.count + 1;
                          y = y + widget.product2.price;
                        }

                        setState(() {});
                      },
                    ),
                    FloatingActionButton(
                      mini: true,
                      child: const Icon(Icons.remove),
                      onPressed: () {
                        if (widget.product2.count > 0) {
                          widget.product2.count = widget.product2.count - 1;
                          y = y - widget.product2.price;
                        }
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Text(
                '\$${(widget.product2.count * widget.product2.price).toString()}',
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
