# Petty 🐾

**Tagline:** Helping street and shelter animals with full transparency and distant adoption.

Petty is a modern Flutter app concept for Azerbaijan that connects donors, shelters, and animals through:
- Transparent fund tracking (donations + expenses)
- Shelter and animal discovery
- Distant foster care / guardianship
- Gamified supporter profile

## 🇦🇿 Azərbaycan dili

### Xüsusiyyətlər
- **5 əsas səhifə** (Bottom Navigation): Home, Shelters, Fund, Animals, Profile
- **Home Feed**: stories, post kartları, like/comment/share/donate aksiyaları, pull-to-refresh
- **Shelters**: axtarış, sığınacaq kartları, detal səhifəsi (gallery, map placeholder, breakdown, contact, follow)
- **Fund / Kassa**: balans kartı, `fl_chart` pie chart, Incoming Donations və Expenses tabları, statistika kartları, Donate Now FAB
- **Animals / Guardianship**: Shelter Animals və Distant Foster Care tabları, filter chips, grid/list toggle, animal detail, submit form bottom sheet
- **Profile**: donor statistikası, aylıq subscription, XP progress, badge-lər, leaderboard preview, donation history, settings toggle-ları (AZ/EN, dark/light, notifications)
- **Splash Screen**: Petty loqosu (paw icon) və tagline
- **Theme**: Material 3, mavi rəng palitrası (`#1565C0`, `#1E88E5`, `#42A5F5`), dark/light mode

### İstifadə olunan paketlər
- flutter_riverpod
- go_router
- fl_chart
- flutter_animate
- google_fonts
- cached_network_image
- intl
- flutter_staggered_grid_view
- shimmer

### Layihə strukturu
```text
lib/
  main.dart
  app.dart
  theme/
    app_theme.dart
    colors.dart
  router/
    app_router.dart
  models/
    animal.dart
    shelter.dart
    post.dart
    donation.dart
    expense.dart
    user.dart
  providers/
    theme_provider.dart
    animals_provider.dart
    shelters_provider.dart
    feed_provider.dart
    fund_provider.dart
    user_provider.dart
  screens/
    home/
      home_screen.dart
    shelters/
      shelters_screen.dart
      shelter_detail_screen.dart
    fund/
      fund_screen.dart
    animals/
      animals_screen.dart
      animal_detail_screen.dart
    profile/
      profile_screen.dart
    splash/
      splash_screen.dart
  widgets/
    common/
      network_image_card.dart
  data/
    mock_data.dart
```

### Quraşdırma və işə salma
1. Flutter 3.x quraşdırın.
2. Repo-nu klonlayın və qovluğa keçin.
3. Komandalar:
   ```bash
   flutter pub get
   flutter run
   ```

### APK build
```bash
flutter build apk --release
```
Yaradılan fayl:
`build/app/outputs/flutter-apk/app-release.apk`

---

## ��🇧 English

### Features
- **5 main pages** with bottom navigation: Home, Shelters, Fund, Animals, Profile
- **Home Feed**: stories, modern post cards, interactions, pull-to-refresh
- **Shelters**: search/filter, shelter cards, detailed shelter page with gallery/map placeholder/breakdown/contact/follow
- **Fund / Transparency**: animated balance card, `fl_chart` pie chart, incoming donations + expenses tabs, summary cards, Donate Now FAB
- **Animals / Guardianship**: shelter animals + distant foster tabs, filters, grid/list toggle, detail page, submit-animal form
- **Profile**: user stats, donation summary, XP & badges, leaderboard preview, donation history, language/theme/notification settings
- **Splash screen** and modern Material 3 look

### Dependencies
See `pubspec.yaml` for full list. Core packages include Riverpod, GoRouter, fl_chart, flutter_animate, cached_network_image, and intl.

### Run locally
```bash
flutter pub get
flutter run
```

### Build release APK
```bash
flutter build apk --release
```
Output:
`build/app/outputs/flutter-apk/app-release.apk`

## Notes
- All mock content is centralized in `lib/data/mock_data.dart`.
- App branding is **Petty** across screens.
