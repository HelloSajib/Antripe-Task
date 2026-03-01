class MockData {
  const MockData._();

  /// A long dummy description for use in UI mockups.
  static String dummyDescription = "Experience luxury redefined at Grand Elite Resort. Nestled in the heart of Miami, this oceanfront retreat offers stunning views, world-class amenities, and unparalleled service. From the moment you step into our breathtaking lobby, with its soaring ceilings and contemporary art installations, you are enveloped in an atmosphere of sophisticated tranquility. Our elegantly appointed rooms and suites provide a serene escape, each featuring a private, glass-paneled balcony overlooking the azure waters of the Atlantic. Sink into plush, high-thread-count linens, and enjoy state-of-the-art smart-home technology that customizes your lighting, temperature, and entertainment with a simple voice command. The spa-like bathrooms are a sanctuary in themselves, complete with rainfall showers, deep soaking tubs, and exclusive, custom-scented toiletries.\n\nIndulge your palate at our three award-winning restaurants, each offering a diverse range of culinary delights. 'The Azure' presents a fine-dining seafood experience with ingredients sourced daily from local fishermen, while our rooftop lounge, 'The Celestial', offers panoramic city views, handcrafted cocktails, and an innovative tapas menu. For a more casual affair, 'The Palm Grove Café' serves artisanal coffees and gourmet pastries throughout the day.\n\nUnwind by one of our two infinity pools—one a serene, adults-only oasis, and the other a vibrant, family-friendly space. Rejuvenate your body and soul at our full-service 'Serenity Spa,' which offers a comprehensive menu of treatments from deep-tissue massages to hydrating facials using organic, marine-based products. Our state-of-the-art fitness center is open 24/7, featuring the latest equipment and a schedule of yoga, pilates, and HIIT classes.\n\nStep outside our doors to explore the vibrant city life just moments away. Our dedicated concierge team is on hand to arrange exclusive access to Miami’s hottest nightclubs, book private yacht excursions, or secure reservations at the most sought-after restaurants. Whether your stay is for leisure or business, the Grand Elite Resort offers an unmatched experience that combines the excitement of Miami with the ultimate in luxury and relaxation. Your perfect getaway awaits.";

  /// Dummy Hotel Gallery Images
  static List<String> hotelGalleryImages = [
    "https://images.unsplash.com/photo-1566073771259-6a8506099945",
    "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b",
    "https://images.unsplash.com/photo-1571896349842-33c89424de2d",
    "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb",
    "https://images.unsplash.com/photo-1551776235-dde6d482980b",
    "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4",
    "https://images.unsplash.com/photo-1445019980597-93fa8acb246c",
    "https://images.unsplash.com/photo-1566073771259-6a8506099945",
    "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b",
    "https://images.unsplash.com/photo-1571896349842-33c89424de2d",
    "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb",
    "https://images.unsplash.com/photo-1551776235-dde6d482980b",
    "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4",
    "https://images.unsplash.com/photo-1445019980597-93fa8acb246c",
  ];


  static List<HotelData> dummyHotels = [
    HotelData(
      id: "1",
      name: "Grand Elite Resort",
      location: "245 Oceanview Blvd, Miami",
      rating: 4.5,
      reviewsCount: 534,
      pricePerDay: 40,
      imageUrl:
      "https://images.unsplash.com/photo-1566073771259-6a8506099945",
    ),
    HotelData(
      id: "2",
      name: "Sunset Paradise Hotel",
      location: "Beach Road, Malibu",
      rating: 4.8,
      reviewsCount: 892,
      pricePerDay: 75,
      imageUrl:
      "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b",
    ),
    HotelData(
      id: "3",
      name: "Ocean Breeze Inn",
      location: "Palm Street, California",
      rating: 4.3,
      reviewsCount: 312,
      pricePerDay: 55,
      imageUrl:
      "https://images.unsplash.com/photo-1571896349842-33c89424de2d",
    ),
    HotelData(
      id: "4",
      name: "Luxury Stay Suites",
      location: "Downtown, New York",
      rating: 4.7,
      reviewsCount: 1_120,
      pricePerDay: 120,
      imageUrl:
      "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb",
    ),
    HotelData(
      id: "5",
      name: "Palm View Resort",
      location: "Island Road, Bahamas",
      rating: 4.6,
      reviewsCount: 678,
      pricePerDay: 95,
      imageUrl:
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4",
    ),
  ];




}


class HotelData {
  final String id;
  final String name;
  final String location;
  final double rating;
  final int reviewsCount;
  final double pricePerDay;
  final String imageUrl;
  final bool isFavourite;

  const HotelData({
    required this.id,
    required this.name,
    required this.location,
    required this.rating,
    required this.reviewsCount,
    required this.pricePerDay,
    required this.imageUrl,
    this.isFavourite = false,
  });
}
