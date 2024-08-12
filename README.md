# Proje Adı

Bu proje, Flutter kullanılarak geliştirilmiş bir uygulamadır. Uygulama, modern bir kullanıcı arayüzü ile birlikte çeşitli özellikler ve işlevsellikler sunmaktadır.

## Özellikler

- Kullanıcı arayüzü tasarımı
- Dinamik veri yönetimi
- Ağ istekleri ve hata yönetimi
- QR kod tarama
- Sayfalama ve veri çekme
- Tema ve stil ayarları

## Teknolojiler ve Paketler

### Kullanılan Paketler

- `riverpod`: Durum yönetimi.
- `hooks_riverpod`: Riverpod ile birlikte kullanılan Hook'lar.
- `dio`: HTTP istekleri için bir ağ kütüphanesi.
- `logger`: Konsol loglama.
- `go_router`: Yönlendirme yönetimi.
- `google_fonts`: Google yazı tiplerini kullanma.
- `pretty_dio_logger`: Dio istekleri için görselliği artırılmış loglama.
- `flutter_native_splash`: Uygulama başlatma ekranı.
- `skeletons`: Yüklenme durumları için iskelet ekranları.
- `flutter_form_builder`: Form oluşturma ve yönetme.
- `flutter_hooks`: Flutter için Hook'lar.
- `flutter_barcode_scanner`: Barkod tarayıcı.

### Geliştirme Bağımlılıkları

- `json_serializable`: JSON serileştirme.
- `build_runner`: Kod üretimi için araç.
- `freezed`: Immutable veri sınıfları ve eşitleme.

## Proje Yapısı

├── core
│   ├── common
│   │   ├── global_app_bar.dart
│   │   ├── global_logo.dart
│   │   └── global_modal_bottom_sheet.dart
│   ├── design
│   │   ├── const_decoration.dart
│   │   ├── const_design.dart
│   │   └── const_style.dart
│   ├── enums
│   │   ├── error_status_enum.dart
│   │   └── error_status_icon_extension.dart
│   ├── helper
│   │   ├── dio
│   │   │   ├── dio_config.dart
│   │   │   └── fetch_dio.dart
│   │   ├── general_error_handler.dart
│   │   ├── info_handler_widget.dart
│   │   ├── logger.dart
│   │   └── media_quary_extension.dart
│   ├── interceptor
│   │   ├── dio_main_interceptor.dart
│   │   └── provider_interceptor.dart
│   ├── interface
│   │   └── view_mode_interface.dart
│   ├── model
│   │   └── dummy_json
│   │       ├── dimensions.dart
│   │       ├── dimensions.freezed.dart
│   │       ├── dimensions.g.dart
│   │       ├── dummy_json.dart
│   │       ├── dummy_json.freezed.dart
│   │       ├── dummy_json.g.dart
│   │       ├── meta.dart
│   │       ├── meta.freezed.dart
│   │       ├── meta.g.dart
│   │       ├── product.dart
│   │       ├── product.freezed.dart
│   │       ├── product.g.dart
│   │       ├── review.dart
│   │       ├── review.freezed.dart
│   │       └── review.g.dart
│   ├── repositories
│   │   ├── home_repository.dart
│   │   └── interface
│   │       └── home_repository_interface.dart
│   ├── theme
│   │   └── light_theme.dart
│   ├── utils
│   │   ├── const_tools.dart
│   │   ├── end_point_consts.dart
│   │   ├── route_name_consts.dart
│   │   └── routes.dart
│   └── widgets
│       ├── buttons
│       │   └── global_elevated_button.dart
│       └── fields
│           └── global_form_text_field.dart
├── feature
│   ├── detail
│   │   └── detail_page.dart
│   └── home
│       ├── home_page.dart
│       ├── provider
│       │   ├── filters.dart
│       │   └── futures.dart
│       ├── view_model
│       │   └── home_page_view_model.dart
│       └── widgets
│           ├── home_search_text_field.dart
│           └── home_skeleton_widget.dart
└── main.dart 