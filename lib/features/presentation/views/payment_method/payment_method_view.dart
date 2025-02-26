import 'dart:async';
import 'dart:io';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ludoapp/features/presentation/common/app_button.dart';
import 'package:ludoapp/features/presentation/common/app_drop_down_button.dart';
import 'package:ludoapp/features/presentation/views/payment_method/widget/bank_details_compo.dart';
import 'package:ludoapp/features/presentation/views/payment_method/widget/custom_easy_step.dart';
import 'package:ludoapp/features/presentation/views/payment_method/widget/image_component.dart';
import 'package:ludoapp/features/presentation/views/payment_method/widget/payment_component.dart';
import 'package:ludoapp/features/presentation/views/payment_method/widget/radio_button_component.dart';
import 'package:ludoapp/features/presentation/views/payment_method/widget/trade_details_component.dart';
import 'package:ludoapp/features/presentation/views/payment_method/widget/upload_button_component.dart';
import 'package:ludoapp/features/presentation/views/payment_method/widget/upload_option_component.dart';
import 'package:ludoapp/utils/app_colors.dart';
import 'package:radio_group_v2/utils/radio_group_decoration.dart';
import 'package:radio_group_v2/widgets/view_models/radio_group_controller.dart';
import 'package:radio_group_v2/widgets/views/radio_group.dart';
import '../../../../core/service/app_permission.dart';
import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/enums.dart';
import '../../../domain/entities/common/drop_down_item.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../common/app_text_field.dart';
import '../../common/appbar.dart';
import '../base_view.dart';

class PaymentMethodView extends BaseView {

  @override
  State<PaymentMethodView> createState() => _ShopViewState();
}

class _ShopViewState extends BaseViewState<PaymentMethodView> {
  var bloc = injection<AuthBloc>();
  int activeStep = 0;
  String selectedPayment = "Bank transfer";

  final List<String> paymentMethods = [
    "Bank transfer",
    "Ez cash",
    "m cash",
    "PayPal",
    "Reload"
  ];
  RadioGroupController myController = RadioGroupController();

  final List<DropDownItem> bankList = [
    DropDownItem(id: '1', fieldText: 'Sampath Bank'),
    DropDownItem(id: '2', fieldText: 'BOC Bank'),
    DropDownItem(id: '3', fieldText: 'HNB Bank'),
  ];

  final List<DropDownItem> branchList = [
    DropDownItem(id: '1', fieldText: 'Ratnapura'),
    DropDownItem(id: '2', fieldText: 'Colombo'),
    DropDownItem(id: '3', fieldText: 'Kandy'),
  ];

  final TextEditingController cardHolderNameController = TextEditingController();
  int remainingSeconds = 15 * 60;
  late Timer timer;
  final int paymentMethod = 2;

  File? _uploadedFiles;


  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: LudoAppBar(title: 'P2P Trades',),
      body: BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          listener: (_, state) {},
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                AppImages.appBackGround,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  EasyStepper(
                    activeStepBackgroundColor: AppColors.initColors().appButtonColor,
                    activeStepTextColor: AppColors.initColors().white,
                    activeStepBorderColor: AppColors.initColors().appButtonColor,
                    finishedStepBackgroundColor: AppColors.initColors().appButtonColor,
                    activeStepIconColor: AppColors.initColors().white,
                    unreachedStepBackgroundColor: AppColors.initColors().loginSubTitleColor,
                    unreachedStepIconColor: AppColors.initColors().white,
                    unreachedStepTextColor: AppColors.initColors().white,
                    activeStep: activeStep,
                    unreachedStepBorderType: BorderType.normal,
                    steppingEnabled: true,
                    stepShape: StepShape.rRectangle,
                    borderThickness: 3,
                    stepBorderRadius: 14,
                    stepAnimationCurve: Curves.bounceIn,
                    lineStyle: LineStyle(
                      lineLength: 80, // Distance between steps
                      lineThickness: 0,
                      lineSpace: 0,
                      lineType: LineType.dashed,
                      unreachedLineType: LineType.dashed
                    ),
                    
                    stepRadius: 15,
                     titlesAreLargerThanSteps: false,
                    showTitle: true,
                    showLoadingAnimation: false,

                    steps: [
                      EasyStep(
                        customStep: CustomStepWidget(imagePath: AppImages.appDetails,isActive: true, ),
                        customTitle: Text(
                          'Trader details',
                          style: TextStyle(
                              color: AppColors.initColors().white,
                              fontWeight: FontWeight.w400,
                              fontSize: AppDimensions.kFontSize14),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      EasyStep(
                        customStep: CustomStepWidget(imagePath: AppImages.appDollar,isActive: true, ),
                        customTitle: Text(
                          'Payment',
                          style: TextStyle(color: AppColors.initColors().white,fontWeight: FontWeight.w400,fontSize: AppDimensions.kFontSize14),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      EasyStep(
                        customStep:CustomStepWidget(imagePath: AppImages.appComplete,isActive: true, ),
                        customTitle: Text(
                          'Complete',
                          style: TextStyle(color: AppColors.initColors().white,fontWeight: FontWeight.w400,fontSize: AppDimensions.kFontSize14),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                    onStepReached: (index) {
                      setState(() {
                        activeStep = index;
                      });
                    },
                  ),

                  Expanded(child: getStepContent(activeStep),),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 24),
                    child:activeStep<2 ? AppButton(buttonText: 'Continue', onTapButton:  (){
                      setState(() {
                        activeStep < 2 ? activeStep++:null;
                        if (activeStep == 2) {
                          startTimer();
                        }
                      });

                    }):AppButton(buttonText: 'Done', onTapButton:  (){
                      setState(() {

                      });

                    }),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget getStepContent(int step) {
    switch (step) {
      case 0:
        return step1();
      case 1:
        return step2();
      case 2:
        return step3();
      default:
        return step1();
    }
  }

  Widget step1(){
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentComponent(
              profileImage: AppImages.appMan,
              name: "KoTi Ishan",
              isVerified: true,
              likePercentage: 100.0,
              followers: 340,
              minLimit: 1000,
              maxLimit: 20000,
              pricePerCoin: 0.95,),

          if (paymentMethod == 1) ...[
            AppTextField(label: 'Price',hint: 'lkr: Enter amount',),
            SizedBox(height: 5.h,),
            Row(
              children: [
                Text(
                  "Limit: 100 - 1000",
                  style: TextStyle(
                      color: AppColors.initColors().thumbColor,
                      fontSize: AppDimensions.kFontSize14,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Spacer(),
                Text(
                  "100 Coins",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: AppDimensions.kFontSize16,
                    color: AppColors.initColors().white,
                  ),
                ),


              ],
            ),
            SizedBox(height: 30.h,),
            Row(
              children: [
                Text("Select payment method",style: TextStyle(
                  fontSize: AppDimensions.kFontSize18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.initColors().white,
                ),),
                SizedBox(width: 5.w,),
                Image.asset(AppImages.appDangerCircle,width: 20.w,height: 20.h,)
              ],
            ),
            CustomRadioGroup(
              options: ["Bank transfer", "Ez cash", "m cash", "PayPal", "Reload"],
              onChanged: (selected) {
                print("Selected: $selected");
              },
            ),
            SizedBox(height: 31.h,),
            Row(
              children: [
                Text("Seller’s Description",style: TextStyle(
                  fontSize: AppDimensions.kFontSize18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.initColors().white,
                ),),
                SizedBox(width: 5.w,),
                Image.asset(AppImages.appDangerCircle,width: 20.w,height: 20.h,)
              ],
            ),
            SizedBox(height: 12.h,),
            Text("Before selling coins",style: TextStyle(
              fontSize: AppDimensions.kFontSize14,
              fontWeight: FontWeight.w400,
              color: AppColors.initColors().white,
            ),),
            SizedBox(height: 12.h,),
            Text("Ensure you have the correct coin amount. "
                "Confirm the selling price and payment details before proceeding. Coins will be deducted from your account "
                "and payment will be sent once verified. Trade securely and enjoy your earnings!",style: TextStyle(
              fontSize: AppDimensions.kFontSize14,
              fontWeight: FontWeight.w400,
              color: AppColors.initColors().white,
            ),),
          ]
          else if (paymentMethod == 2) ...[
            AppTextField(label: 'Price',hint: 'lkr: Enter amount',),
            SizedBox(height: 5.h,),
            Row(
              children: [
                Text(
                  "Limit: 100 - 1000",
                  style: TextStyle(
                      color: AppColors.initColors().thumbColor,
                      fontSize: AppDimensions.kFontSize14,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Spacer(),
                Text(
                  "100 Coins",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: AppDimensions.kFontSize16,
                    color: AppColors.initColors().white,
                  ),
                ),


              ],
            ),
            SizedBox(height: 35.h,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),
              color: AppColors.initColors().colorImagePlaceholder.withOpacity(0.8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Direct Coin Purchase',style: TextStyle(
                      color: AppColors.initColors().white,
                      fontWeight: FontWeight.w400,
                      fontSize: AppDimensions.kFontSize22),),
                  Text('our coins will be added to your account within 15 Send USDT to the '
                      'displayed address or scan the QR code to purchase coins instantly. '
                      'Fast, secure, and hassle-free!',style: TextStyle(
                      color: AppColors.initColors().white,
                      fontWeight: FontWeight.w400,
                      fontSize: AppDimensions.kFontSize14),),
                ],
              ),
            )
          ],

          ],
        ),
      ),
    );
  }

  Widget step2() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            PaymentComponent(
              profileImage: AppImages.appMan,
              name: "KoTi Ishan",
              isVerified: true,
              likePercentage: 100.0,
              followers: 340,
              minLimit: 1000,
              maxLimit: 20000,
              pricePerCoin: 0.95,
            ),
            if (paymentMethod == 1) ...[
              AppDropDownButton(
                hint: 'Select bank',
                label: 'Select Bank',
                itemList: bankList,
                onTap: (p0) {},
                isMultiSelect: false,
              ),
              SizedBox(height: 16.h),
              AppDropDownButton(
                hint: 'Select branch',
                label: 'Select Branch',
                itemList: branchList,
                onTap: (p0) {},
                isMultiSelect: false,
              ),
              SizedBox(height: 16.h),
              AppTextField(
                controller: cardHolderNameController,
                hint: 'Enter name here',
                label: 'Card Holder Name',
              ),
            ] else if (paymentMethod == 2) ...[
              SizedBox(height: 12.h),
              Text(
                'Bank details',
                style: TextStyle(
                  color: AppColors.initColors().white,
                  fontSize: AppDimensions.kFontSize18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12.h),
              BankDetailsCompo(title: 'Card holder name', name: 'P. Kodeeshan'),
              BankDetailsCompo(title: 'Bank name', name: 'Bank of Ceylon'),
              BankDetailsCompo(title: 'Account number', name: '248845125475'),
              BankDetailsCompo(title: 'Branch', name: 'Hali Ala'),
              SizedBox(height: 36.h),
              Row(
                children: [
                  Text(
                    "Upload receipt",
                    style: TextStyle(
                      fontSize: AppDimensions.kFontSize18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.initColors().white,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Image.asset(AppImages.appDangerCircle, width: 20.w, height: 20.h),
                ],
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () {
                  _showUploadOptions(context);
                },
                child: UploadButtonComponent(),
              ),
            ] else if (paymentMethod == 3) ...[
              SizedBox(height: 12.h),
      
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 13,vertical: 13),
                    decoration: BoxDecoration(
                        color: AppColors.initColors().loginTitleColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(7.r)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Payment methord',style: TextStyle(
                          fontSize: AppDimensions.kFontSize18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.initColors().white,
                        ),),
                        SizedBox(height: 12.h,),
                        Text('USDT address',style: TextStyle(
                          fontSize: AppDimensions.kFontSize14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.initColors().white,
                        ),),
                        SizedBox(height: 4.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('T9a4k3Lg5X1p7F8JdQ6w3VbN2mZ0YnRc9Q',style: TextStyle(
                              fontSize: AppDimensions.kFontSize14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.initColors().white,
                            ),),
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(text: 'T9a4k3Lg5X1p7F8JdQ6w3VbN2mZ0YnRc9Q'));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Copied to clipboard')),
                                );
                              },
                              child: Image.asset(AppImages.appCopy, height: 24.h, width: 24.w),
                            ),
                          ],
                        ),
                        Text('QR code',style: TextStyle(
                          fontSize: AppDimensions.kFontSize16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.initColors().white,
                        ),),
                        SizedBox(height: 4.h,),
                        Image.asset(AppImages.appQrCode,width: 195,height: 195,),

                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    "Upload receipt",
                    style: TextStyle(
                      fontSize: AppDimensions.kFontSize14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.initColors().white,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  GestureDetector(
                    onTap: () {
                      _showUploadOptions(context);
                    },
                    child: UploadButtonComponent(),
                  ),
                ],
              ),

            ],
          ],
        ),
      ),
    );
  }


  Widget step3(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          PaymentComponent(
            profileImage: AppImages.appMan,
            name: "KoTi Ishan",
            isVerified: true,
            likePercentage: 100.0,
            followers: 340,
            minLimit: 1000,
            maxLimit: 20000,
            pricePerCoin: 0.95,),
         SizedBox(height: 23.h,),
         Text('Trade details',style: TextStyle(
               color: AppColors.initColors().white,
             fontSize: AppDimensions.kFontSize18,
             fontWeight: FontWeight.w600),),
         SizedBox(height: 12.h,),
          TradeDetailsComponent(name: 'Trade no', count: 123456789,currencyType: ''),
          TradeDetailsComponent(name: 'Coins you sell', count: 5000,currencyType: 'Coins',),
          TradeDetailsComponent(name: 'Amount you get', count: 4800,currencyType: 'Coins'),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Payment method',style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppDimensions.kFontSize16,
              color: AppColors.initColors().white),),

          Text('Bank transfer',style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: AppDimensions.kFontSize16,
              color: AppColors.initColors().white),)
        ],
        ),
        SizedBox(height: 81.h,),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            color: AppColors.initColors().colorImagePlaceholder
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('Get Paid Within 15 Minutes',style: TextStyle(
                   fontWeight: FontWeight.w400,
                   fontSize: AppDimensions.kFontSize22,
                   color: AppColors.initColors().white),),
               SizedBox(height: 5.h,),
               Text('Your payment will be processed and sent within 15 minutes after your coins are verified. Trade with confidence.',
                 style: TextStyle(
                   fontWeight: FontWeight.w500,
                   fontSize: AppDimensions.kFontSize14,
                   color: AppColors.initColors().white),),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("If there’s an issue? ${formatTime(remainingSeconds)}",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: AppDimensions.kFontSize14,
                      color: AppColors.initColors().white)),
                  Text('Contact admin',
                      style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: AppDimensions.kFontSize14,
                      color: AppColors.initColors().wfTextColor5)),

                ],
              )
            ],
          ),
        )

        ],
      ),
    );
  }





  Future getImageFromGallery() async {
    AppPermissionManager.requestGalleryPermission(context, () async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        final imageCropper = ImageCropper();
        final croppedFile = await imageCropper.cropImage(
          sourcePath: image.path,
          compressQuality: 40,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          cropStyle: CropStyle.rectangle,
        );

        if (croppedFile != null) {
          _uploadImage(croppedFile);
        }
      } else {
        print('No image selected.');
      }
    }, (error) {
      showSnackBar(error, AlertType.FAIL);
    });
  }

  Future<File?> _pickDocument() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'jpg', 'jpeg', 'png'],
    );

    return result != null ? File(result.files.single.path!) : null;
  }

  Future<void> _uploadImage(CroppedFile image) async {
    File imageFile = File(image.path);
    final fileSize = await imageFile.length();
    if (fileSize > 10485760) {
      showSnackBar('Maximum upload size is 10MB.', AlertType.FAIL);
    } else {
      setState(() {
       // _uploadedFiles.add(imageFile); // Add file to the list
      });
    }
  }

  Future getImageFromCamera() async {
    AppPermissionManager.requestCameraPermission(context, () async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        final imageCropper = ImageCropper();
        final croppedFile = await imageCropper.cropImage(
          sourcePath: image.path,
          compressQuality: 40,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          cropStyle: CropStyle.rectangle,
        );

        if (croppedFile != null) {
          _uploadImage(croppedFile);
        }
      } else {
        print('No image selected.');
      }
    }, (error) {
      showSnackBar(error, AlertType.FAIL);
    });
  }

  void _showUploadOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose an Upload Method',
                style: TextStyle(
                    color: AppColors.initColors().mainBlackColor,
                    fontSize: AppDimensions.kFontSize14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        getImageFromCamera();
                        Navigator.pop(context);
                      },
                      child: UploadOptionComponent(image: AppImages.appMsg, title: 'Open Camera',)
                  ),
                  GestureDetector(
                      onTap: () {
                        getImageFromGallery();
                        Navigator.pop(context);
                      },
                      child: UploadOptionComponent(image: AppImages.appMsg, title: 'Import Files',)
                  ),
                ],
              ),
              SizedBox(height: 60.h),
            ],
          ),
        );
      },
    );
  }



  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }

}
