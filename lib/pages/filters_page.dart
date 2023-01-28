import 'package:flutter/material.dart';
import 'package:grocery_app/style/colors.dart';
import 'package:grocery_app/style/theme.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Filters",
          style: f20w9,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              size: 30,
              color: Colors.black,
            )),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        padding: const EdgeInsets.only(left: 20, right: 15, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: f20w9,
            ),
            const SizedBox(
              height: 20,
            ),
            const Check_Box(
              text: "Eggs",
            ),
            const SizedBox(
              height: 16,
            ),
            const Check_Box(
              text: "Noodles & Pasta",
            ),
            const SizedBox(
              height: 16,
            ),
            const Check_Box(
              text: "Chips & Crips",
            ),
            const SizedBox(
              height: 16,
            ),
            const Check_Box(
              text: "Fast Food",
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Brand",
              style: f25w9,
            ),
            const SizedBox(
              height: 16,
            ),
            const Check_Box(
              text: "Individual Collection",
            ),
            const SizedBox(
              height: 16,
            ),
            const Check_Box(
              text: "Cocacola",
            ),
            const SizedBox(
              height: 16,
            ),
            const Check_Box(
              text: "Ifad",
            ),
            const SizedBox(
              height: 16,
            ),
            const Check_Box(
              text: "Kazi formas",
            ),
            const SizedBox(
              height: 165,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 55,
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Apply Filter",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Check_Box extends StatefulWidget {
  final String text;
  const Check_Box({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<Check_Box> createState() => _Check_BoxState();
}

class _Check_BoxState extends State<Check_Box> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getCheckBox(),
        const SizedBox(
          width: 13,
        ),
        _text(text: widget.text)
      ],
    );
  }

  Text _text({required String text}) {
    return Text(
      text,
      style: TextStyle(
          color: checked == true ? AppColors.primaryColor : Colors.black,
          fontSize: 21,
          fontWeight: FontWeight.w500),
    );
  }

  Widget getCheckBox() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: SizedBox(
        width: 25,
        height: 25,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: checked ? 0 : 1.5, color: const Color(0xffB1B1B1)),
              borderRadius: BorderRadius.circular(8),
              color: checked ? AppColors.primaryColor : Colors.transparent),
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.transparent,
            ),
            child: Checkbox(
              value: checked,
              onChanged: (state) => setState(() => checked = !checked),
              activeColor: Colors.transparent,
              checkColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
          ),
        ),
      ),
    );
  }
}
