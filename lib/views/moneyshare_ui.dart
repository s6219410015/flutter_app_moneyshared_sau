import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshared_sau/views/show_moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({Key? key}) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  bool? check_tip = false;
  TextEditingController money_ctrl = TextEditingController();
  TextEditingController person_ctrl = TextEditingController();
  TextEditingController tip_ctrl = TextEditingController();

  //เมธอด -> โค้ดแสดง Dialog เตือน โดยจะรับข้อความมาแสดงที่ Dialog
  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9CDF1),
      appBar: AppBar(
        title: Text(
          'แชร์เงินกันเถอะ',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF7F5FBD),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 120.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 30.0,
                ),
                child: TextField(
                  controller: money_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนเงิน (บาท)',
                    hintStyle: TextStyle(color: Color(0xFF2F2020)),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Color(0xFF7F5FBD),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F5FBD),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F5FBD),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 30.0,
                ),
                child: TextField(
                  controller: person_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนคน (คน)',
                    hintStyle: TextStyle(color: Color(0xFF2F2020)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF7F5FBD),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F5FBD),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F5FBD),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (checked) {
                        setState(() {
                          check_tip = checked;
                        });
                      },
                      value: check_tip,
                      activeColor: Color(0xFF5A026A),
                      side: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                    Text(
                      'ทิปให้พนักงานเสริฟ',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  controller: tip_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                    hintStyle: TextStyle(color: Color(0xFF2F2020)),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Color(0xFF7F5FBD),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F5FBD),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F5FBD),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  // สร้างต้วแปรมาเก็บผลลัพธ์ที่ได้จากการคำนวณ
                  double? moneyshare = 0;

                  // ตรวจสอบ และคำนวณ
                  if (money_ctrl.text.length == 0) {
                    showWarningDialog(context, 'ป้อนเงินด้วยจ้า');
                    return;
                  } else if (person_ctrl.text.length == 0) {
                    showWarningDialog(context, 'ป้อนคนด้วยจ้า');
                    return;
                  } else if (check_tip == false) {
                    //  คำนวณแบบไม่มี tip
                    double? money = double.parse(money_ctrl.text);
                    int? person = int.parse(person_ctrl.text);
                    moneyshare = money / person;
                  } else {
                    //ตรวจสอบว่าได้ป้อน tip หรือยัง
                    if (tip_ctrl.text.isEmpty) {
                      showWarningDialog((context), 'ป้อนทิปด้วย');
                      return;
                    } else {
                      //คำนวณแบบมี tip
                      double? money = double.parse(money_ctrl.text);
                      int? person = int.parse(person_ctrl.text);
                      double? tip = double.parse(tip_ctrl.text);
                      moneyshare = (money + tip) / person;
                    }
                  }
                  // ส่งข้อมูลที่ป้อน และที่คำนวณได้ไปแสดงที่หน้า ShowmoneyshereUI
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowMoneyshareUI(
                        money: double.parse(money_ctrl.text),
                        person: int.parse(person_ctrl.text),
                        tip: double.parse(tip_ctrl.text.isEmpty?'0': tip_ctrl.text),
                        moneyshare: moneyshare,
                      ),
                    ),
                  );
                },
                child: Text(
                  'คำนวณ',
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 80.0,
                      50.0,
                    ),
                    primary: Color(0xFF5C76B0)),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //กำหนดค่าของ Textfild ทั้ง3 ตัวให้ว่าง และ CheckBox ไม่ติ๊ก
                  setState(() {
                    money_ctrl.text = '';
                    person_ctrl.text = '';
                    tip_ctrl.text = '';
                    check_tip = false;
                  });
                },
                label: Text(
                  'ยกเลิก',
                ),
                icon: Icon(
                  FontAwesomeIcons.sync,
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  primary: Color(0xFFDE5454),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'Created by WARIS SAU',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
