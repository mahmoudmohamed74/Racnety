import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/loading_widget.dart';
import 'package:parking_app/core/widgets/snack_bar_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/booking/data/models/service_model.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/screens/home.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/car_model_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ConfirmServiceScreen extends StatelessWidget {
  ConfirmServiceScreen({
    required this.serviceModel,
    Key? key,
  }) : super(key: key);

  final ServiceModel serviceModel;

  final TextEditingController carModelController = TextEditingController();

  void onSelectCarModel(String selectedCarModel) {
    carModelController.text = selectedCarModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: "Confirm Service Request",
      ),
      body: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: AppSize.s50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .99,
                  height: AppSize.s80,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Car Model : ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: AppSize.s18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: AppSize.s100,
                          child: TextFormField(
                            controller: carModelController,
                            keyboardType: TextInputType.none,
                            decoration: const InputDecoration(
                              hintText: 'Car Model',
                              contentPadding: EdgeInsets.only(
                                left: 8,
                                bottom: 5,
                                top: 5,
                                right: 5,
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Car Model'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          CarModelWidget(
                                            carModel: 'Marcedes',
                                            onSelect: onSelectCarModel,
                                          ),
                                          CarModelWidget(
                                            carModel: 'Hundai Elantra',
                                            onSelect: onSelectCarModel,
                                          ),
                                          CarModelWidget(
                                            carModel: 'Chavorlet',
                                            onSelect: onSelectCarModel,
                                          ),
                                          CarModelWidget(
                                            carModel: 'KIA',
                                            onSelect: onSelectCarModel,
                                          ),
                                          CarModelWidget(
                                            carModel: 'Hundai',
                                            onSelect: onSelectCarModel,
                                          ),
                                          CarModelWidget(
                                            carModel: 'MG',
                                            onSelect: onSelectCarModel,
                                          ),
                                          CarModelWidget(
                                            carModel: 'Ford',
                                            onSelect: onSelectCarModel,
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          serviceModel.pic,
                          scale: .7,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .99,
                  height: AppSize.s80,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Service Cost : ${serviceModel.serviceCost} LE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: AppSize.s18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .99,
                  height: AppSize.s80,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Service Name: ${serviceModel.name}',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: AppSize.s18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                if (!state.isLoading)
                  TextButtonWidget(
                    icon: Container(
                      width: AppSize.s0,
                    ),
                    borderColor: ColorManager.primary,
                    backGroundColor: ColorManager.primary,
                    textColor: ColorManager.white,
                    width: AppSize.s330,
                    height: AppSize.s52,
                    text: AppStrings.confirmRequest,
                    fontWeight: FontWeight.bold,
                    onTap: () async {
                      if (carModelController.text != '') {
                        context.read<BookingCubit>().addService(
                              service: serviceModel.copyWith(
                                carName: carModelController.text,
                              ),
                            );

                        try {
                          // final serviceData = {
                          //   DatabaseHelper.columnServiceName: serviceModel.name,
                          //   DatabaseHelper.columnServicePrice:
                          //       serviceModel.serviceCost,
                          //   DatabaseHelper.columnCarModel: carModelController.text,
                          // };

                          // final id =
                          //     await DatabaseHelper.instance.insert(serviceData);

                          showBookingConfirmationDialog(
                            context: context,
                            title: "Booking Confirmed",
                            content:
                                'Your Service made Successfully\nWe are Waiting You',
                            alertText: "ALRIGHT",
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            },
                          );
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       content: const Text(
                          //         'Your Service made Successful\nWe are Waiting You',
                          //         style: TextStyle(
                          //           fontSize: AppSize.s16,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //       actions: <Widget>[
                          //         TextButton(
                          //           onPressed: () {
                          //             Navigator.of(context).pop();
                          //           },
                          //           child: const Text('ALRIGHT'),
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // );
                        } catch (error) {
                          print('Error storing service data: $error');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBarWidget(
                              text: Text(
                                'An error please try again',
                                style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s16,
                                ),
                              ),
                              backGroundColor: ColorManager.error,
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarWidget(
                            text: Text(
                              'Please Select Car Model',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s16,
                              ),
                            ),
                            backGroundColor: ColorManager.error,
                          ),
                        );
                      }
                    },
                  ),
                if (state.isLoading) const LoadingWidget(),
                const SizedBox(
                  height: AppSize.s5,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DatabaseHelper {
  static const _databaseName = 'services.db';
  static const _databaseVersion = 1;

  static const table = 'services';
  static const columnId = 'id';
  static const columnServiceName = 'serviceName';
  static const columnServicePrice = 'servicePrice';
  static const columnCarModel = 'carModel';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnServiceName TEXT NOT NULL,
            $columnServicePrice TEXT NOT NULL,
            $columnCarModel TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }
}
