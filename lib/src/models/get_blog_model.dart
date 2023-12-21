// To parse this JSON data, do
//
//     final bloglistModel = bloglistModelFromJson(jsonString);

import 'dart:convert';

BloglistModel bloglistModelFromJson(String str) => BloglistModel.fromJson(json.decode(str));

String bloglistModelToJson(BloglistModel data) => json.encode(data.toJson());

class BloglistModel {
    Data? data;
    String? message;
    int? status;

    BloglistModel({
        this.data,
        this.message,
        this.status,
    });

    factory BloglistModel.fromJson(Map<String, dynamic> json) => BloglistModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "status": status,
    };
}

class Data {
    Blogs? blogs;

    Data({
        this.blogs,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        blogs: json["blogs"] == null ? null : Blogs.fromJson(json["blogs"]),
    );

    Map<String, dynamic> toJson() => {
        "blogs": blogs?.toJson(),
    };
}

class Blogs {
    int? currentPage;
    List<Datum>? data;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    List<Link>? links;
    String? nextPageUrl;
    String? path;
    int? perPage;
    dynamic prevPageUrl;
    int? to;
    int? total;

    Blogs({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    factory Blogs.fromJson(Map<String, dynamic> json) => Blogs(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    int? id;
    int? categoryId;
    String? title;
    String? subTitle;
    String? slug;
    String? description;
    dynamic image;
    dynamic video;
    DateTime? date;
    String? status;
    int? createdBy;
    int? updatedBy;
    DateTime? createdAt;
    DateTime? updatedAt;

    Datum({
        this.id,
        this.categoryId,
        this.title,
        this.subTitle,
        this.slug,
        this.description,
        this.image,
        this.video,
        this.date,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryId: json["category_id"],
        title: json["title"],
        subTitle: json["sub_title"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
        video: json["video"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "title": title,
        "sub_title": subTitle,
        "slug": slug,
        "description": description,
        "image": image,
        "video": video,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

enum Description {
    THIS_IS_DESCRIPTION,
    THIS_IS_SMART_HOSPITAL_THIS_SYSTEM_DOCTOR_MR_ARAFAT_SORKAR,
    T_HIS_IS_SMART,
    WOW_THIS_IS_VERY_INTERESTING
}

final descriptionValues = EnumValues({
    "This is description": Description.THIS_IS_DESCRIPTION,
    "This is smart Hospital This system doctor MR Arafat Sorkar": Description.THIS_IS_SMART_HOSPITAL_THIS_SYSTEM_DOCTOR_MR_ARAFAT_SORKAR,
    "tHIS IS SMART": Description.T_HIS_IS_SMART,
    "wow this is very interesting": Description.WOW_THIS_IS_VERY_INTERESTING
});

enum Slug {
    FOYSAL,
    SMART
}

final slugValues = EnumValues({
    "foysal": Slug.FOYSAL,
    "smart": Slug.SMART
});

enum SubTitle {
    THIS_IS_SMART,
    THIS_IS_SMART_FOYSAL,
    THIS_IS_SMART_HOSPITAL
}

final subTitleValues = EnumValues({
    "THIS IS SMART": SubTitle.THIS_IS_SMART,
    "This is Smart foysal": SubTitle.THIS_IS_SMART_FOYSAL,
    "This is Smart Hospital": SubTitle.THIS_IS_SMART_HOSPITAL
});

enum Title {
    THIS_IS_HOSPITAL,
    THIS_IS_SMART,
    TITLE_THIS_IS_SMART
}

final titleValues = EnumValues({
    "This is Hospital": Title.THIS_IS_HOSPITAL,
    "this is smart": Title.THIS_IS_SMART,
    "This is smart": Title.TITLE_THIS_IS_SMART
});

class Link {
    String? url;
    String? label;
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
