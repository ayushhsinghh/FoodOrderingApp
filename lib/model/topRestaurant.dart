// To parse this JSON data, do
//
//     final topRestaurant = topRestaurantFromJson(jsonString);

import 'dart:convert';

TopRestaurant topRestaurantFromJson(String str) =>
    TopRestaurant.fromJson(json.decode(str));

String topRestaurantToJson(TopRestaurant data) => json.encode(data.toJson());

class TopRestaurant {
  TopRestaurant({
    this.resultsFound,
    this.resultsStart,
    this.resultsShown,
    this.restaurants,
  });

  final int resultsFound;
  final int resultsStart;
  final int resultsShown;
  final List<RestaurantElement> restaurants;

  factory TopRestaurant.fromJson(Map<String, dynamic> json) => TopRestaurant(
        resultsFound: json["results_found"],
        resultsStart: json["results_start"],
        resultsShown: json["results_shown"],
        restaurants: List<RestaurantElement>.from(
            json["restaurants"].map((x) => RestaurantElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results_found": resultsFound,
        "results_start": resultsStart,
        "results_shown": resultsShown,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

class RestaurantElement {
  RestaurantElement({
    this.restaurant,
  });

  final RestaurantRestaurant restaurant;

  factory RestaurantElement.fromJson(Map<String, dynamic> json) =>
      RestaurantElement(
        restaurant: RestaurantRestaurant.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "restaurant": restaurant.toJson(),
      };
}

class RestaurantRestaurant {
  RestaurantRestaurant({
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
    this.isTableReservationSupported,
    this.hasTableBooking,
    this.eventsUrl,
    this.phoneNumbers,
    this.allReviews,
    this.establishment,
    this.zomatoEvents,
    this.bookUrl,
  });

  final R r;
  final String apikey;
  final int id;
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
  final dynamic medioProvider;
  final int hasOnlineDelivery;
  final int isDeliveringNow;
  final String storeType;
  final bool includeBogoOffers;
  final String deeplink;
  final int isTableReservationSupported;
  final int hasTableBooking;
  final String eventsUrl;
  final String phoneNumbers;
  final AllReviews allReviews;
  final List<String> establishment;
  final List<ZomatoEvent> zomatoEvents;
  final String bookUrl;

  factory RestaurantRestaurant.fromJson(Map<String, dynamic> json) =>
      RestaurantRestaurant(
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
        bookAgainUrl:
            json["book_again_url"] == null ? null : json["book_again_url"],
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
        isTableReservationSupported: json["is_table_reservation_supported"],
        hasTableBooking: json["has_table_booking"],
        eventsUrl: json["events_url"],
        phoneNumbers: json["phone_numbers"],
        allReviews: AllReviews.fromJson(json["all_reviews"]),
        establishment: List<String>.from(json["establishment"].map((x) => x)),
        zomatoEvents: json["zomato_events"] == null
            ? null
            : List<ZomatoEvent>.from(
                json["zomato_events"].map((x) => ZomatoEvent.fromJson(x))),
        bookUrl: json["book_url"] == null ? null : json["book_url"],
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
        "book_again_url": bookAgainUrl == null ? null : bookAgainUrl,
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
        "is_table_reservation_supported": isTableReservationSupported,
        "has_table_booking": hasTableBooking,
        "events_url": eventsUrl,
        "phone_numbers": phoneNumbers,
        "all_reviews": allReviews.toJson(),
        "establishment": List<dynamic>.from(establishment.map((x) => x)),
        "zomato_events": zomatoEvents == null
            ? null
            : List<dynamic>.from(zomatoEvents.map((x) => x.toJson())),
        "book_url": bookUrl == null ? null : bookUrl,
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

  final int delivery;
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

class ZomatoEvent {
  ZomatoEvent({
    this.event,
  });

  final Event event;

  factory ZomatoEvent.fromJson(Map<String, dynamic> json) => ZomatoEvent(
        event: Event.fromJson(json["event"]),
      );

  Map<String, dynamic> toJson() => {
        "event": event.toJson(),
      };
}

class Event {
  Event({
    this.eventId,
    this.friendlyStartDate,
    this.friendlyEndDate,
    this.friendlyTimingStr,
    this.startDate,
    this.endDate,
    this.endTime,
    this.startTime,
    this.isActive,
    this.dateAdded,
    this.photos,
    this.restaurants,
    this.isValid,
    this.shareUrl,
    this.showShareUrl,
    this.title,
    this.description,
    this.displayTime,
    this.displayDate,
    this.isEndTimeSet,
    this.disclaimer,
    this.eventCategory,
    this.eventCategoryName,
    this.bookLink,
    this.types,
    this.shareData,
  });

  final int eventId;
  final String friendlyStartDate;
  final String friendlyEndDate;
  final String friendlyTimingStr;
  final DateTime startDate;
  final DateTime endDate;
  final String endTime;
  final String startTime;
  final int isActive;
  final DateTime dateAdded;
  final List<PhotoElement> photos;
  final List<dynamic> restaurants;
  final int isValid;
  final String shareUrl;
  final int showShareUrl;
  final String title;
  final String description;
  final String displayTime;
  final String displayDate;
  final int isEndTimeSet;
  final String disclaimer;
  final int eventCategory;
  final String eventCategoryName;
  final String bookLink;
  final List<dynamic> types;
  final ShareData shareData;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        eventId: json["event_id"],
        friendlyStartDate: json["friendly_start_date"],
        friendlyEndDate: json["friendly_end_date"],
        friendlyTimingStr: json["friendly_timing_str"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        endTime: json["end_time"],
        startTime: json["start_time"],
        isActive: json["is_active"],
        dateAdded: DateTime.parse(json["date_added"]),
        photos: List<PhotoElement>.from(
            json["photos"].map((x) => PhotoElement.fromJson(x))),
        restaurants: List<dynamic>.from(json["restaurants"].map((x) => x)),
        isValid: json["is_valid"],
        shareUrl: json["share_url"],
        showShareUrl: json["show_share_url"],
        title: json["title"],
        description: json["description"],
        displayTime: json["display_time"],
        displayDate: json["display_date"],
        isEndTimeSet: json["is_end_time_set"],
        disclaimer: json["disclaimer"],
        eventCategory: json["event_category"],
        eventCategoryName: json["event_category_name"],
        bookLink: json["book_link"],
        types: List<dynamic>.from(json["types"].map((x) => x)),
        shareData: ShareData.fromJson(json["share_data"]),
      );

  Map<String, dynamic> toJson() => {
        "event_id": eventId,
        "friendly_start_date": friendlyStartDate,
        "friendly_end_date": friendlyEndDate,
        "friendly_timing_str": friendlyTimingStr,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "end_time": endTime,
        "start_time": startTime,
        "is_active": isActive,
        "date_added": dateAdded.toIso8601String(),
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "restaurants": List<dynamic>.from(restaurants.map((x) => x)),
        "is_valid": isValid,
        "share_url": shareUrl,
        "show_share_url": showShareUrl,
        "title": title,
        "description": description,
        "display_time": displayTime,
        "display_date": displayDate,
        "is_end_time_set": isEndTimeSet,
        "disclaimer": disclaimer,
        "event_category": eventCategory,
        "event_category_name": eventCategoryName,
        "book_link": bookLink,
        "types": List<dynamic>.from(types.map((x) => x)),
        "share_data": shareData.toJson(),
      };
}

class PhotoElement {
  PhotoElement({
    this.photo,
  });

  final PhotoPhoto photo;

  factory PhotoElement.fromJson(Map<String, dynamic> json) => PhotoElement(
        photo: PhotoPhoto.fromJson(json["photo"]),
      );

  Map<String, dynamic> toJson() => {
        "photo": photo.toJson(),
      };
}

class PhotoPhoto {
  PhotoPhoto({
    this.url,
    this.thumbUrl,
    this.order,
    this.md5Sum,
    this.id,
    this.photoId,
    this.uuid,
    this.type,
  });

  final String url;
  final String thumbUrl;
  final int order;
  final String md5Sum;
  final int id;
  final int photoId;
  final int uuid;
  final String type;

  factory PhotoPhoto.fromJson(Map<String, dynamic> json) => PhotoPhoto(
        url: json["url"],
        thumbUrl: json["thumb_url"],
        order: json["order"],
        md5Sum: json["md5sum"],
        id: json["id"],
        photoId: json["photo_id"],
        uuid: json["uuid"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "thumb_url": thumbUrl,
        "order": order,
        "md5sum": md5Sum,
        "id": id,
        "photo_id": photoId,
        "uuid": uuid,
        "type": type,
      };
}

class ShareData {
  ShareData({
    this.shouldShow,
  });

  final int shouldShow;

  factory ShareData.fromJson(Map<String, dynamic> json) => ShareData(
        shouldShow: json["should_show"],
      );

  Map<String, dynamic> toJson() => {
        "should_show": shouldShow,
      };
}
