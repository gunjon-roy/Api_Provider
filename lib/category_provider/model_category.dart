//
// class CategotiesModel {
//   List<Getcategory>? getcategory;
//
//   CategotiesModel({this.getcategory});
//
//   CategotiesModel.fromJson(Map<String, dynamic> json) {
//     if (json['getcategory'] != null) {
//       getcategory = <Getcategory>[];
//       json['getcategory'].forEach((v) {
//         getcategory!.add(new Getcategory.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.getcategory != null) {
//       data['getcategory'] = this.getcategory!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class
// Getcategory {
//   int? id;
//   String? categoryName;
//   String? categorySlugName;
//   String? categoryImage;
//   String? categoryIcon;
//
//   Getcategory(
//       {this.id,
//         this.categoryName,
//         this.categorySlugName,
//         this.categoryImage,
//         this.categoryIcon});
//
//   Getcategory.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryName = json['category_name'];
//     categorySlugName = json['category_slug_name'];
//     categoryImage = json['category_image'];
//     categoryIcon = json['category_icon'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category_name'] = this.categoryName;
//     data['category_slug_name'] = this.categorySlugName;
//     data['category_image'] = this.categoryImage;
//     data['category_icon'] = this.categoryIcon;
//     return data;
//   }
// }
//
