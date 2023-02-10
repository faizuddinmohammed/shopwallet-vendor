import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fuodz/constants/app_colors.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/view_models/service.vm.dart';
import 'package:fuodz/widgets/base.page.dart';
import 'package:fuodz/widgets/custom_list_view.dart';
import 'package:fuodz/widgets/list_items/grid_view_service.list_item.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<ServiceViewModel>.reactive(
        viewModelBuilder: () => ServiceViewModel(context),
        onModelReady: (vm) => vm.initialise(),
        builder: (context, vm, child) {
          return BasePage(
            fab: FloatingActionButton.extended(
              backgroundColor: AppColor.primaryColor,
              onPressed: vm.newPackageTypePricing,
              label: "New Service".tr().text.white.make(),
              icon: Icon(
                FlutterIcons.plus_fea,
                color: Colors.white,
              ),
            ),
            body: VStack(
              [
                //
                "Services"
                    .tr()
                    .text
                    .xl2
                    .semiBold
                    .make().px20()
                    .pOnly(bottom: Vx.dp10),
                //
                CustomListView(
                  refreshController: vm.refreshController,
                  canRefresh: true,
                  canPullUp:true,
                  onRefresh: vm.fetchMyServices,
                  onLoading: () => vm.fetchMyServices(initialLoading: false),
                  isLoading: vm.isBusy,
                  dataSet: vm.services ,
                  padding:EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    //service
                    return GridViewServiceListItem(
                      service: vm.services[index],
                      onPressed: vm.openServiceDetails,
                    ).px20();
                  },
                ).expand(),
                UiSpacer.verticalSpace(),
                UiSpacer.verticalSpace(),
              ],
            ),
          );
        },
      ),
    );
  }
}
