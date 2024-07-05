import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'crm_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of CrmLocalization
/// returned by `CrmLocalization.of(context)`.
///
/// Applications need to include `CrmLocalization.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'flutter_gen/crm_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CrmLocalization.localizationsDelegates,
///   supportedLocales: CrmLocalization.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the CrmLocalization.supportedLocales
/// property.
abstract class CrmLocalization {
  CrmLocalization(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CrmLocalization of(BuildContext context) {
    return Localizations.of<CrmLocalization>(context, CrmLocalization)!;
  }

  static const LocalizationsDelegate<CrmLocalization> delegate = _CrmLocalizationDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru')
  ];

  /// No description provided for @hi.
  ///
  /// In ru, this message translates to:
  /// **'Привет'**
  String get hi;

  /// No description provided for @select.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать'**
  String get select;

  /// No description provided for @onTheMap.
  ///
  /// In ru, this message translates to:
  /// **'На карте'**
  String get onTheMap;

  /// No description provided for @selectProgramme.
  ///
  /// In ru, this message translates to:
  /// **'Выберите\nпрограмму'**
  String get selectProgramme;

  /// No description provided for @categories.
  ///
  /// In ru, this message translates to:
  /// **'Категории'**
  String get categories;

  /// No description provided for @waitingReserveConfirmation.
  ///
  /// In ru, this message translates to:
  /// **'Ожидайте подтверждения бронирования'**
  String get waitingReserveConfirmation;

  /// No description provided for @checkReserveMessage.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, проверьте, пришло ли вам сообщение с бронированием от номера'**
  String get checkReserveMessage;

  /// No description provided for @onYourPhoneNumber.
  ///
  /// In ru, this message translates to:
  /// **'на ваш номер'**
  String get onYourPhoneNumber;

  /// No description provided for @on.
  ///
  /// In ru, this message translates to:
  /// **'в'**
  String get on;

  /// No description provided for @sendNotificationOn.
  ///
  /// In ru, this message translates to:
  /// **'Отправить уведомление на'**
  String get sendNotificationOn;

  /// No description provided for @iReceivedMessageOn.
  ///
  /// In ru, this message translates to:
  /// **'Я получил(а) сообщение в'**
  String get iReceivedMessageOn;

  /// No description provided for @editNumber.
  ///
  /// In ru, this message translates to:
  /// **'Изменить номер'**
  String get editNumber;

  /// No description provided for @returnOnReservePage.
  ///
  /// In ru, this message translates to:
  /// **'Вернуться на страницу бронирования'**
  String get returnOnReservePage;

  /// No description provided for @whatsapp.
  ///
  /// In ru, this message translates to:
  /// **'WhatsApp'**
  String get whatsapp;

  /// No description provided for @telegram.
  ///
  /// In ru, this message translates to:
  /// **'Telegram'**
  String get telegram;

  /// No description provided for @vk.
  ///
  /// In ru, this message translates to:
  /// **'VK'**
  String get vk;

  /// No description provided for @visit.
  ///
  /// In ru, this message translates to:
  /// **'Посещение'**
  String get visit;

  /// No description provided for @quantity.
  ///
  /// In ru, this message translates to:
  /// **'Кол-во'**
  String get quantity;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @participantInfo.
  ///
  /// In ru, this message translates to:
  /// **'Информация об участниках'**
  String get participantInfo;

  /// No description provided for @enterYourFullName.
  ///
  /// In ru, this message translates to:
  /// **'Впишите ФИО, вес и возраст всех участников в поле ниже'**
  String get enterYourFullName;

  /// No description provided for @participantInfoNo.
  ///
  /// In ru, this message translates to:
  /// **'Информация об участнике №'**
  String get participantInfoNo;

  /// No description provided for @addParticipant.
  ///
  /// In ru, this message translates to:
  /// **'Добавить еще одного участника'**
  String get addParticipant;

  /// No description provided for @price.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость'**
  String get price;

  /// No description provided for @additionalPayment.
  ///
  /// In ru, this message translates to:
  /// **'Доплата на месте'**
  String get additionalPayment;

  /// No description provided for @paymentReceived.
  ///
  /// In ru, this message translates to:
  /// **'Внесена оплата'**
  String get paymentReceived;

  /// No description provided for @checkout.
  ///
  /// In ru, this message translates to:
  /// **'Оформить'**
  String get checkout;

  /// No description provided for @didReceiveNotification.
  ///
  /// In ru, this message translates to:
  /// **'Уведомление пришло?'**
  String get didReceiveNotification;

  /// No description provided for @checkMessages.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, проверьте сообщения на телефоне'**
  String get checkMessages;

  /// No description provided for @notificationDidntArrived.
  ///
  /// In ru, this message translates to:
  /// **'Уведомление не пришло'**
  String get notificationDidntArrived;

  /// No description provided for @notificationArrived.
  ///
  /// In ru, this message translates to:
  /// **'Уведомление пришло'**
  String get notificationArrived;

  /// No description provided for @contactSupport.
  ///
  /// In ru, this message translates to:
  /// **'Обратитесь в службу поддержки'**
  String get contactSupport;

  /// No description provided for @leavePhoneNumberForSupport.
  ///
  /// In ru, this message translates to:
  /// **'Оставьте номер телефона для связи и опишите вашу техническую проблему'**
  String get leavePhoneNumberForSupport;

  /// No description provided for @phoneNumber.
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get phoneNumber;

  /// No description provided for @leaveComment.
  ///
  /// In ru, this message translates to:
  /// **'Оставьте комментарий'**
  String get leaveComment;

  /// No description provided for @sendReply.
  ///
  /// In ru, this message translates to:
  /// **'Направить ответ'**
  String get sendReply;

  /// No description provided for @repeatedNotification.
  ///
  /// In ru, this message translates to:
  /// **'Повторное уведомление'**
  String get repeatedNotification;

  /// No description provided for @enterPhoneNumberWithMessenger.
  ///
  /// In ru, this message translates to:
  /// **'Введите телефон на который можно отправить уведомление в'**
  String get enterPhoneNumberWithMessenger;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер телефона'**
  String get enterPhoneNumber;

  /// No description provided for @dontHaveMessengerSendMessage.
  ///
  /// In ru, this message translates to:
  /// **'Нет WhatsApp, отправьте в SMS'**
  String get dontHaveMessengerSendMessage;

  /// No description provided for @sendRepeatedNotification.
  ///
  /// In ru, this message translates to:
  /// **'Отправить уведомление повторно'**
  String get sendRepeatedNotification;

  /// No description provided for @yourName.
  ///
  /// In ru, this message translates to:
  /// **'Ваше имя'**
  String get yourName;

  /// No description provided for @leavePhoneNumberWithMessenger.
  ///
  /// In ru, this message translates to:
  /// **'Оставьте, пожалуйста, телефон с Whatsapp.'**
  String get leavePhoneNumberWithMessenger;

  /// No description provided for @confirmationSentThere.
  ///
  /// In ru, this message translates to:
  /// **'Туда придёт подтверждение вашей брони'**
  String get confirmationSentThere;

  /// No description provided for @toPay.
  ///
  /// In ru, this message translates to:
  /// **'К оплате'**
  String get toPay;

  /// No description provided for @book.
  ///
  /// In ru, this message translates to:
  /// **'Забронировать'**
  String get book;

  /// No description provided for @iAgreeWith.
  ///
  /// In ru, this message translates to:
  /// **'Я соглашаюсь с'**
  String get iAgreeWith;

  /// No description provided for @privacyPolicy.
  ///
  /// In ru, this message translates to:
  /// **'Политикой конфиденциальности'**
  String get privacyPolicy;

  /// No description provided for @and.
  ///
  /// In ru, this message translates to:
  /// **'И'**
  String get and;

  /// No description provided for @processingOfPersonalData.
  ///
  /// In ru, this message translates to:
  /// **'Обработки персональных данных'**
  String get processingOfPersonalData;

  /// No description provided for @thanksForAnswer.
  ///
  /// In ru, this message translates to:
  /// **'Спасибо за ответ'**
  String get thanksForAnswer;

  /// No description provided for @close.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get close;

  /// No description provided for @applicationSent.
  ///
  /// In ru, this message translates to:
  /// **'Заявка направлена'**
  String get applicationSent;

  /// No description provided for @weWillAnswerAsSoonAsPossible.
  ///
  /// In ru, this message translates to:
  /// **'Ответим в ближайшее время'**
  String get weWillAnswerAsSoonAsPossible;

  /// No description provided for @moreDetails.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее'**
  String get moreDetails;

  /// No description provided for @selectVehicle.
  ///
  /// In ru, this message translates to:
  /// **'Выберите технику'**
  String get selectVehicle;

  /// No description provided for @selectTransportForYourTrip.
  ///
  /// In ru, this message translates to:
  /// **'Выберите транспорт для поездки'**
  String get selectTransportForYourTrip;

  /// No description provided for @selectTime.
  ///
  /// In ru, this message translates to:
  /// **'Выберите время'**
  String get selectTime;

  /// No description provided for @checkoutOrder.
  ///
  /// In ru, this message translates to:
  /// **'Оформить заказ'**
  String get checkoutOrder;

  /// No description provided for @welcome.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать'**
  String get welcome;

  /// No description provided for @personalAccount.
  ///
  /// In ru, this message translates to:
  /// **'Личный кабинет'**
  String get personalAccount;

  /// No description provided for @admin.
  ///
  /// In ru, this message translates to:
  /// **'Администратор'**
  String get admin;

  /// No description provided for @productManager.
  ///
  /// In ru, this message translates to:
  /// **'Менеджер по продажам'**
  String get productManager;

  /// No description provided for @partner.
  ///
  /// In ru, this message translates to:
  /// **'Партнер'**
  String get partner;

  /// No description provided for @enterLogin.
  ///
  /// In ru, this message translates to:
  /// **'Введите логин'**
  String get enterLogin;

  /// No description provided for @enterPassword.
  ///
  /// In ru, this message translates to:
  /// **'Введите пароль'**
  String get enterPassword;

  /// No description provided for @forgotPassword.
  ///
  /// In ru, this message translates to:
  /// **'Забыли пароль?'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get logout;

  /// No description provided for @confirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get confirm;

  /// No description provided for @partnersList.
  ///
  /// In ru, this message translates to:
  /// **'Список партнеров'**
  String get partnersList;

  /// No description provided for @partnersListEmptyHint.
  ///
  /// In ru, this message translates to:
  /// **'Тут пусто! Добавьте партнеров\nдля сотрудничества'**
  String get partnersListEmptyHint;

  /// No description provided for @partnerAdd.
  ///
  /// In ru, this message translates to:
  /// **'Добавить партнера'**
  String get partnerAdd;

  /// No description provided for @partnerSaving.
  ///
  /// In ru, this message translates to:
  /// **'Идет сохранение партнера'**
  String get partnerSaving;

  /// No description provided for @addFirstBrand.
  ///
  /// In ru, this message translates to:
  /// **'Добавьте свой первый бренд\nдля начала работы'**
  String get addFirstBrand;

  /// No description provided for @addBrand.
  ///
  /// In ru, this message translates to:
  /// **'Добавить бренд'**
  String get addBrand;

  /// No description provided for @brandAddress.
  ///
  /// In ru, this message translates to:
  /// **'Адрес бренда'**
  String get brandAddress;

  /// No description provided for @brandAddressHint.
  ///
  /// In ru, this message translates to:
  /// **'Тут пусто! Добавьте новый адрес.'**
  String get brandAddressHint;

  /// No description provided for @addAddress.
  ///
  /// In ru, this message translates to:
  /// **'Добавить адрес'**
  String get addAddress;

  /// No description provided for @createPassword.
  ///
  /// In ru, this message translates to:
  /// **'Придумайте пароль'**
  String get createPassword;

  /// No description provided for @createPasswordHint.
  ///
  /// In ru, this message translates to:
  /// **'Придумайте новый пароль.\nОн должен быть уникальный.'**
  String get createPasswordHint;

  /// No description provided for @newPassword.
  ///
  /// In ru, this message translates to:
  /// **'Новый пароль'**
  String get newPassword;

  /// No description provided for @repeatPassword.
  ///
  /// In ru, this message translates to:
  /// **'Повторите пароль'**
  String get repeatPassword;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get search;

  /// No description provided for @calendar.
  ///
  /// In ru, this message translates to:
  /// **'Календарь'**
  String get calendar;

  /// No description provided for @notification.
  ///
  /// In ru, this message translates to:
  /// **'Уведомление'**
  String get notification;

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Найстроки'**
  String get settings;
}

class _CrmLocalizationDelegate extends LocalizationsDelegate<CrmLocalization> {
  const _CrmLocalizationDelegate();

  @override
  Future<CrmLocalization> load(Locale locale) {
    return SynchronousFuture<CrmLocalization>(lookupCrmLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_CrmLocalizationDelegate old) => false;
}

CrmLocalization lookupCrmLocalization(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru': return CrmLocalizationRu();
  }

  throw FlutterError(
    'CrmLocalization.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
