import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oke_car_flutter/models/store_model.dart';
import 'package:oke_car_flutter/pages/acount/accountDetail/controller/account_detail_controller.dart';
import 'package:oke_car_flutter/pages/acount/accountDetail/widget/content_item.dart';
import 'package:oke_car_flutter/utils/app_util.dart';
import 'package:oke_car_flutter/values/setting.dart';
import 'package:oke_car_flutter/values/style.dart';
import 'package:oke_car_flutter/widgets/_cachedImage.dart';
import 'package:oke_car_flutter/widgets/custom_app_bar.dart';
import 'package:oke_car_flutter/helpers/extension/responsive.dart';

import '../../../../utils/date_util.dart';

class AccountDetailPage extends GetView<AccountDetailController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: CustomAppBar(
          titleColor: context.theme.backgroundColor,
          bgColor: Style.toastErrorBgColor,
          title: 'detail'.tr,
          centerTitle: false,
        ),
        body: SizedBox(
          width: double.infinity,
          // margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(context),
                buildContent(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    final userModel = controller.user.value;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30.w),
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 75.w,
              backgroundColor: Colors.grey,
              child: ClipOval(
                  child: CachedImage(
                AppUtil().getImage(key: '${userModel.avatar?.url ?? ''}'),
                defaultUrl: AppSetting.imgProfile,
                width: context.width,
                fit: BoxFit.cover,
              )),
            ),
            Positioned(
                right: -7.0.w,
                bottom: 2.0.w,
                child: CircleAvatar(
                    radius: 20.w,
                    backgroundColor: context.theme.cardColor,
                    child: IconButton(
                      icon: Image.asset(
                        AppSetting.ic_camera_icon,
                        color: context.theme.primaryColorDark,
                        // color: Col,
                      ),
                      onPressed: () {},
                    )))
          ],
        ),
      ],
    );
  }

  Widget buildContent(BuildContext context) {
    final userModel = controller.user.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.w),
        Container(
            width: context.width,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
            color: context.theme.primaryColorLight,
            child: Text(
              'Th??ng tin c?? nh??n'.toUpperCase(),
              style: Style().titleStyle2.copyWith(color: Colors.white),
            )),
        SizedBox(height: 16.w),
        ContentItem(
          title: 'email',
          subtitle: userModel.email,
        ),
        ContentItem(
          title: 'T??n ????ng nh???p',
          subtitle: userModel.userName,
        ),
        ContentItem(
          title: 'H??? v?? t??n',
          subtitle: userModel.fullName,
        ),
        ContentItem(
          title: 'S??? ??i???n tho???i',
          subtitle: userModel.phone,
        ),
        ContentItem(
          title: '?????a ch???',
          subtitle: userModel.address,
          imageIcon: AppSetting.icHomeOutlined,
        ),
        ContentItem(
          title: 'Ng??y sinh',
          subtitle:
              DateUtil.formatDate(DateUtil.getDateTimeByMs(userModel.birthday)),
          imageIcon: AppSetting.icHomeOutlined,
        ),
        SizedBox(height: 20.w),
        // Container(
        //     width: context.width,
        //     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
        //     color: context.theme.primaryColorLight,
        //     child: Text(
        //       'Th??ng tin c???a h??ng'.toUpperCase(),
        //       style: Style().titleStyle2.copyWith(color: Colors.white),
        //     )),
        // buildLogout(),
      ],
    );
  }

  Widget buildContentStore(BuildContext context) {
    final store = controller.user.value.storeInfo ?? StoreModel();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: context.width,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
            color: context.theme.primaryColorLight,
            child: Text(
              'Th??ng tin c???a h??ng'.toUpperCase(),
              style: Style().titleStyle2.copyWith(color: Colors.white),
            )),
        SizedBox(height: 16.w),
        ContentItem(
          title: 'T??n c???a h??ng',
          subtitle: store.nameStore,
        ),
        ContentItem(
          title: 'S??? ??i???n tho???i',
          subtitle: store.phoneStore,
        ),
        ContentItem(
          title: '?????a ch???',
          subtitle: store.addressStore,
          imageIcon: AppSetting.icHomeOutlined,
        ),
        SizedBox(height: 20.w),
        // Container(
        //     width: context.width,
        //     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
        //     color: context.theme.primaryColorLight,
        //     child: Text(
        //       'Th??ng tin c???a h??ng'.toUpperCase(),
        //       style: Style().titleStyle2.copyWith(color: Colors.white),
        //     )),
        // buildLogout(),
      ],
    );
  }
}
