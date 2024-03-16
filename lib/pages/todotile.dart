import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todotile extends StatelessWidget {
  final String name;
  final bool status;
  Function(bool?)? onChanged;
  Function(BuildContext)? delete;
  todotile(
      {super.key,
      required this.name,
      required this.status,
      required this.onChanged,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: delete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(20),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Checkbox(
                value: status,
                onChanged: onChanged,
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    decoration: status
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
