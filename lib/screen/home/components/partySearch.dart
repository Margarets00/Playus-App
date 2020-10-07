import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:playus_app/constants.dart';
import 'package:playus_app/screen/home/components/send.dart';
import 'package:playus_app/screen/home/components/ListSearchView.dart';

@immutable
class PartySearch extends StatefulWidget {
  @override
  _PartySearch createState() => _PartySearch();
}

class _PartySearch extends State<PartySearch> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  String keywords;
  bool isResult;
  _PartySearch() {
    keywords = '아티스트, 노래 검색';
    isResult = false;
  }

  @override
  void initState() {
    //딱 한번 호출 되는거. 이걸로 요청하면됨
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

//'blackHanSans'
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Stack(children: [
              Background(
                where: 'bottom',
                height: 0.89,
              ),
              Navigation(),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.15),
                        ),
                        Flexible(
                            child: Text(
                          keywords,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline2,
                          // TextStyle(
                          //     fontSize: 30,
                          //     wordSpacing: -8,
                          //     fontFamilyFallback: ['black  kHanSans']),
                        )),
                        if (isResult == false) ...[
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.15),
                          ),
                          Form(
                              key: _formKey,
                              child: Row(children: [
                                Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      onFieldSubmitted: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            isResult = true;
                                          });
                                        } else {
                                          print('내용이 빔');
                                        }
                                      },
                                      textInputAction: TextInputAction.search,
                                      controller: myController,
                                      decoration: InputDecoration(
                                          //hintText: 'SONG / ARTIST',
                                          suffixIcon: IconButton(
                                        onPressed: () {
                                          myController.clear();
                                          setState(() {
                                            keywords = '아티스트, 노래 검색';
                                          });
                                        },
                                        icon: Icon(Icons.clear),
                                      )),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Its empty!';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) => setState(() {
                                        if (value.length > 0) {
                                          keywords = value;
                                        } else {
                                          keywords = '아티스트, 노래 검색';
                                        }
                                      }),
                                      style: TextStyle(
                                        color: kTextColor,
                                        fontSize: 25,
                                        wordSpacing: -5,
                                        decorationColor: Color(
                                            0XFFFFCC00), //Font color change
                                      ),
                                    )),
                              ])),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.05),
                          ),
                          if (myController.text.isNotEmpty) ...[
                            Button(
                              text: 'SEARCH',
                              wordspace: 0.0,
                              //iconCode: 0xe5e1,
                              isClick: () {
                                if (myController.text.isNotEmpty) {
                                  searchAPI(myController.text).then((value) {
                                    print(value);
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return ListSearchView(value);
                                    }));
                                  }).catchError((e) => print('빠꾸'));
                                  /* */
                                } else {
                                  print('글자 다 입력 안함');
                                }
                              },
                            )
                          ],
                        ] else ...[
                          Text('검색 결과')
                        ]
                      ]))
            ])));
  }
}
