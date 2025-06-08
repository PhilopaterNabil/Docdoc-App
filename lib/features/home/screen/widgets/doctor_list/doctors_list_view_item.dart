import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key, this.doctorModel});

  final Doctors? doctorModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: 'https://images.unsplash.com/photo-1537368910025-700350fe46c7',
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Shimmer.fromColors(
                baseColor: ColorsManager.lightGray,
                highlightColor: Colors.white,
                child: Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) => Container(
              width: 110.w,
              height: 120.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(16.r),
          //   child: Image.network(
          //     'https://images.unsplash.com/photo-1537368910025-700350fe46c7',
          //     width: 110.w,
          //     height: 120.h,
          //     fit: BoxFit.cover,
          //   ),
          // ),

          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel?.name ?? 'Dr. John Doe',
                  style: TextStyles.font16DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(8),
                Text(
                  '${doctorModel?.degree} | ${doctorModel?.phone}',
                  style: TextStyles.font12GrayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(12),
                Text(
                  doctorModel?.email ?? 'Email',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font11DarkGrayRegular,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
