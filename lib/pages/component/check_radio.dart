import 'package:flutter/material.dart';



class CheckCOntainer extends StatefulWidget {
  const CheckCOntainer({super.key});

  @override
  _CheckCOntainerState createState() => _CheckCOntainerState();
}

class _CheckCOntainerState extends State<CheckCOntainer> {
  bool container1Selected = true;
  bool container2Selected = false;

  void selectContainer1() {
    setState(() {
      container1Selected = true;
      container2Selected = false;
    });
  }

  void selectContainer2() {
    setState(() {
      container1Selected = false;
      container2Selected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: selectContainer1,
              child: Container(
                width: 160,
                height: 60,
                decoration: ShapeDecoration(
                  color: container1Selected ? Colors.brown : const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 6),
                    Icon(
                      container1Selected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: container1Selected ? Colors.white : Colors.black,
                    ),
                    Text(
                      '48 Months\nRM 6,365',
                      style: TextStyle(
                        color: container1Selected
                            ? Colors.white
                            : Colors.black,
                        fontSize: 14,
                        fontFamily: 'PoppinsRegular',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    const SizedBox(width: 6),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: selectContainer2,
              child: Container(
                width: 160,
                height: 60,
                decoration: ShapeDecoration(
                  color: container2Selected ? Colors.brown : const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 6),
                    Icon(
                      container2Selected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: container2Selected ? Colors.white : Colors.black,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '60 Months\n',
                            style: TextStyle(
                              color: container2Selected
                                  ? Colors.white
                                  : const Color(0xFF0F172A),
                              fontSize: 14,
                              fontFamily: 'PoppinsRegular',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'RM 6,365',
                            style: TextStyle(
                              color: container2Selected
                                  ? Colors.white
                                  : const Color(0xFF8D8D8D),
                              fontSize: 16,
                              fontFamily: 'PoppinsRegular',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                  ],
                ),
              ),
            ),
          ],
        ),
    
    );
  }
}


class CheckableContainer extends StatefulWidget {
  final String title;
  final String subtitle;
  final String price;

  const CheckableContainer({super.key, 
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  _CheckableContainerState createState() => _CheckableContainerState();
}

class _CheckableContainerState extends State<CheckableContainer> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSelection,
      child: Container(
        width: 160,
        height: 60,
        decoration: ShapeDecoration(
          color: isSelected ? Colors.brown : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 6),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? Colors.white : Colors.black,
            ),
            Text(
              '${widget.title}\n${widget.price}',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16,
                fontFamily: 'PoppinsRegular',
                fontWeight: FontWeight.w300,
                height: 0,
              ),
            ),
            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}

class CheckContainer extends StatelessWidget {
  const CheckContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CheckableContainer(
            title: '48 Months',
            subtitle: 'RM 6,365',
            price: 'RM 6,365',
          ),
          SizedBox(height: 20),
          CheckableContainer(
            title: '60 Months',
            subtitle: 'RM 6,365',
            price: 'RM 6,365',
          ),
        ],
      ),
    );
  }
}

