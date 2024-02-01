import 'package:flutter/material.dart';

class CompanyDetailBottomSheet extends StatefulWidget {
  const CompanyDetailBottomSheet({super.key});

  @override
  State<CompanyDetailBottomSheet> createState() => _CompanyDetailBottomSheetState();
}

class _CompanyDetailBottomSheetState extends State<CompanyDetailBottomSheet> {
  Color starColor=Colors.grey.shade600;
  @override
  Widget build(BuildContext context) => Center(
      child: SizedBox(
          child: Stack(clipBehavior: Clip.none,fit: StackFit.expand,alignment: Alignment.bottomCenter, children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16))),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Google LLC',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon:  Icon(Icons.star,color: starColor,size: 32),
                        onPressed: () {
                          setState(() {
                            if(starColor==Colors.grey.shade600){
                              starColor=Color.fromRGBO(255, 196, 0, 1.0);}
                            else{
                              starColor=Colors.grey.shade600;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Silicon Valley, CA',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Text('Tech based company and the producer',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 30),
                  Text('Job Title:',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w700)),
                  const Text('Senior UI/UX Designer',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 30),
                  Text('Qualification:',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  const Text('At least 10 years of design experience',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  const Text('Familiarity with design APIs',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 16),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(100, 94, 254, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              elevation: 4,
                             backgroundColor: Colors.green,
                              content: Text("Applied Successfully !"),
                            ));
                            Navigator.pop(context);
                          },
                          child: const Text('APPLY NOW'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                left: MediaQuery.of(context).size.width / 10,
                top: -40,
                //MediaQuery.of(context).size.height*0.01,
                child: Card(elevation: 0,color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/google_icon.png"),
                      radius: 34,
                      backgroundColor: Colors.green,
                    ),
                  ),
                )),
          ])));
}

