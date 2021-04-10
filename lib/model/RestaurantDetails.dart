// To parse this JSON data, do
//
//     final restaurantDetails = restaurantDetailsFromJson(jsonString);

import 'dart:convert';

RestaurantDetails restaurantDetailsFromJson(String str) =>
    RestaurantDetails.fromJson(json.decode(str));

String restaurantDetailsToJson(RestaurantDetails data) =>
    json.encode(data.toJson());

class RestaurantDetails {
  RestaurantDetails({
    this.r,
    this.apikey,
    this.id,
    this.name,
    this.url,
    this.location,
    this.switchToOrderMenu,
    this.cuisines,
    this.timings,
    this.averageCostForTwo,
    this.priceRange,
    this.currency,
    this.highlights,
    this.offers,
    this.opentableSupport,
    this.isZomatoBookRes,
    this.mezzoProvider,
    this.isBookFormWebView,
    this.bookFormWebViewUrl,
    this.bookAgainUrl,
    this.thumb,
    this.userRating,
    this.allReviewsCount,
    this.photosUrl,
    this.photoCount,
    this.menuUrl,
    this.featuredImage,
    this.medioProvider,
    this.hasOnlineDelivery,
    this.isDeliveringNow,
    this.storeType,
    this.includeBogoOffers,
    this.deeplink,
    this.orderUrl,
    this.orderDeeplink,
    this.isTableReservationSupported,
    this.hasTableBooking,
    this.eventsUrl,
    this.phoneNumbers,
    this.allReviews,
    this.establishment,
  });

  final R r;
  final String apikey;
  final String id;
  final String name;
  final String url;
  final Location location;
  final int switchToOrderMenu;
  final String cuisines;
  final String timings;
  final int averageCostForTwo;
  final int priceRange;
  final String currency;
  final List<String> highlights;
  final List<dynamic> offers;
  final int opentableSupport;
  final int isZomatoBookRes;
  final String mezzoProvider;
  final int isBookFormWebView;
  final String bookFormWebViewUrl;
  final String bookAgainUrl;
  final String thumb;
  final UserRating userRating;
  final int allReviewsCount;
  final String photosUrl;
  final int photoCount;
  final String menuUrl;
  final String featuredImage;
  final bool medioProvider;
  final int hasOnlineDelivery;
  final int isDeliveringNow;
  final String storeType;
  final bool includeBogoOffers;
  final String deeplink;
  final String orderUrl;
  final String orderDeeplink;
  final int isTableReservationSupported;
  final int hasTableBooking;
  final String eventsUrl;
  final String phoneNumbers;
  final AllReviews allReviews;
  final List<String> establishment;

  factory RestaurantDetails.fromJson(Map<String, dynamic> json) =>
      RestaurantDetails(
        r: R.fromJson(json["R"]),
        apikey: json["apikey"],
        id: json["id"],
        name: json["name"],
        url: json["url"],
        location: Location.fromJson(json["location"]),
        switchToOrderMenu: json["switch_to_order_menu"],
        cuisines: json["cuisines"],
        timings: json["timings"],
        averageCostForTwo: json["average_cost_for_two"],
        priceRange: json["price_range"],
        currency: json["currency"],
        highlights: List<String>.from(json["highlights"].map((x) => x)),
        offers: List<dynamic>.from(json["offers"].map((x) => x)),
        opentableSupport: json["opentable_support"],
        isZomatoBookRes: json["is_zomato_book_res"],
        mezzoProvider: json["mezzo_provider"],
        isBookFormWebView: json["is_book_form_web_view"],
        bookFormWebViewUrl: json["book_form_web_view_url"],
        bookAgainUrl: json["book_again_url"],
        thumb: json["thumb"],
        userRating: UserRating.fromJson(json["user_rating"]),
        allReviewsCount: json["all_reviews_count"],
        photosUrl: json["photos_url"],
        photoCount: json["photo_count"],
        menuUrl: json["menu_url"],
        featuredImage: json["featured_image"],
        medioProvider: json["medio_provider"],
        hasOnlineDelivery: json["has_online_delivery"],
        isDeliveringNow: json["is_delivering_now"],
        storeType: json["store_type"],
        includeBogoOffers: json["include_bogo_offers"],
        deeplink: json["deeplink"],
        orderUrl: json["order_url"],
        orderDeeplink: json["order_deeplink"],
        isTableReservationSupported: json["is_table_reservation_supported"],
        hasTableBooking: json["has_table_booking"],
        eventsUrl: json["events_url"],
        phoneNumbers: json["phone_numbers"],
        allReviews: AllReviews.fromJson(json["all_reviews"]),
        establishment: List<String>.from(json["establishment"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "R": r.toJson(),
        "apikey": apikey,
        "id": id,
        "name": name,
        "url": url,
        "location": location.toJson(),
        "switch_to_order_menu": switchToOrderMenu,
        "cuisines": cuisines,
        "timings": timings,
        "average_cost_for_two": averageCostForTwo,
        "price_range": priceRange,
        "currency": currency,
        "highlights": List<dynamic>.from(highlights.map((x) => x)),
        "offers": List<dynamic>.from(offers.map((x) => x)),
        "opentable_support": opentableSupport,
        "is_zomato_book_res": isZomatoBookRes,
        "mezzo_provider": mezzoProvider,
        "is_book_form_web_view": isBookFormWebView,
        "book_form_web_view_url": bookFormWebViewUrl,
        "book_again_url": bookAgainUrl,
        "thumb": thumb,
        "user_rating": userRating.toJson(),
        "all_reviews_count": allReviewsCount,
        "photos_url": photosUrl,
        "photo_count": photoCount,
        "menu_url": menuUrl,
        "featured_image": featuredImage,
        "medio_provider": medioProvider,
        "has_online_delivery": hasOnlineDelivery,
        "is_delivering_now": isDeliveringNow,
        "store_type": storeType,
        "include_bogo_offers": includeBogoOffers,
        "deeplink": deeplink,
        "order_url": orderUrl,
        "order_deeplink": orderDeeplink,
        "is_table_reservation_supported": isTableReservationSupported,
        "has_table_booking": hasTableBooking,
        "events_url": eventsUrl,
        "phone_numbers": phoneNumbers,
        "all_reviews": allReviews.toJson(),
        "establishment": List<dynamic>.from(establishment.map((x) => x)),
      };
}

class AllReviews {
  AllReviews({
    this.reviews,
  });

  final List<Review> reviews;

  factory AllReviews.fromJson(Map<String, dynamic> json) => AllReviews(
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class Review {
  Review({
    this.review,
  });

  final List<dynamic> review;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        review: List<dynamic>.from(json["review"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "review": List<dynamic>.from(review.map((x) => x)),
      };
}

class Location {
  Location({
    this.address,
    this.locality,
    this.city,
    this.cityId,
    this.latitude,
    this.longitude,
    this.zipcode,
    this.countryId,
    this.localityVerbose,
  });

  final String address;
  final String locality;
  final String city;
  final int cityId;
  final String latitude;
  final String longitude;
  final String zipcode;
  final int countryId;
  final String localityVerbose;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: json["address"],
        locality: json["locality"],
        city: json["city"],
        cityId: json["city_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        zipcode: json["zipcode"],
        countryId: json["country_id"],
        localityVerbose: json["locality_verbose"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "locality": locality,
        "city": city,
        "city_id": cityId,
        "latitude": latitude,
        "longitude": longitude,
        "zipcode": zipcode,
        "country_id": countryId,
        "locality_verbose": localityVerbose,
      };
}

class R {
  R({
    this.resId,
    this.isGroceryStore,
    this.hasMenuStatus,
  });

  final int resId;
  final bool isGroceryStore;
  final HasMenuStatus hasMenuStatus;

  factory R.fromJson(Map<String, dynamic> json) => R(
        resId: json["res_id"],
        isGroceryStore: json["is_grocery_store"],
        hasMenuStatus: HasMenuStatus.fromJson(json["has_menu_status"]),
      );

  Map<String, dynamic> toJson() => {
        "res_id": resId,
        "is_grocery_store": isGroceryStore,
        "has_menu_status": hasMenuStatus.toJson(),
      };
}

class HasMenuStatus {
  HasMenuStatus({
    this.delivery,
    this.takeaway,
  });

  final bool delivery;
  final int takeaway;

  factory HasMenuStatus.fromJson(Map<String, dynamic> json) => HasMenuStatus(
        delivery: json["delivery"],
        takeaway: json["takeaway"],
      );

  Map<String, dynamic> toJson() => {
        "delivery": delivery,
        "takeaway": takeaway,
      };
}

class UserRating {
  UserRating({
    this.aggregateRating,
    this.ratingText,
    this.ratingColor,
    this.ratingObj,
    this.votes,
  });

  final String aggregateRating;
  final String ratingText;
  final String ratingColor;
  final RatingObj ratingObj;
  final int votes;

  factory UserRating.fromJson(Map<String, dynamic> json) => UserRating(
        aggregateRating: json["aggregate_rating"],
        ratingText: json["rating_text"],
        ratingColor: json["rating_color"],
        ratingObj: RatingObj.fromJson(json["rating_obj"]),
        votes: json["votes"],
      );

  Map<String, dynamic> toJson() => {
        "aggregate_rating": aggregateRating,
        "rating_text": ratingText,
        "rating_color": ratingColor,
        "rating_obj": ratingObj.toJson(),
        "votes": votes,
      };
}

class RatingObj {
  RatingObj({
    this.title,
    this.bgColor,
  });

  final Title title;
  final BgColor bgColor;

  factory RatingObj.fromJson(Map<String, dynamic> json) => RatingObj(
        title: Title.fromJson(json["title"]),
        bgColor: BgColor.fromJson(json["bg_color"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "bg_color": bgColor.toJson(),
      };
}

class BgColor {
  BgColor({
    this.type,
    this.tint,
  });

  final String type;
  final String tint;

  factory BgColor.fromJson(Map<String, dynamic> json) => BgColor(
        type: json["type"],
        tint: json["tint"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "tint": tint,
      };
}

class Title {
  Title({
    this.text,
  });

  final String text;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
