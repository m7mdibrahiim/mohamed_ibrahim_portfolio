import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_links.dart';
import '../models/project_link_model.dart';
import '../models/project_model.dart';
import 'authoritative_media_data.dart';

class ProjectsData {
  const ProjectsData._();

  static final List<ProjectModel> _items = <ProjectModel>[
    ProjectModel(
      id: 'dr-yasmeen-pharmacy',
      displayPriority: 1,
      platformOrder: 1,
      featuredPriority: 1,
      titleEn: 'Dr. Yasmeen Pharmacy',
      titleAr: 'صيدلية د. ياسمين',
      categoryEn: 'Bilingual pharmacy e-commerce',
      categoryAr: 'تطبيق صيدلية إلكتروني ثنائي اللغة',
      shortDescriptionEn:
          'A bilingual pharmacy shopping application with product discovery, themes, favorites, cart, orders, account settings, and multiple payment methods.',
      shortDescriptionAr:
          'تطبيق صيدلية إلكتروني ثنائي اللغة يضم تصفح المنتجات، الثيمات، المفضلة، السلة، الطلبات، إعدادات الحساب، وطرق دفع متعددة.',
      overviewEn:
          'A production-style Flutter pharmacy application documented by fourteen screens across authentication, Arabic/English shopping, light and dark themes, offers, search, favorites, orders, account settings, and payment selection. The CV confirms Flutter, Firebase, Supabase, and Paymob integration.',
      overviewAr:
          'تطبيق صيدلية production-style مبني بـ Flutter وتوثقه أربع عشرة شاشة تشمل تسجيل الدخول، التسوق بالعربي والإنجليزي، الوضعين الفاتح والداكن، العروض، البحث، المفضلة، الطلبات، إعدادات الحساب، واختيار طريقة الدفع. تؤكد السيرة الذاتية استخدام Firebase وSupabase وPaymob.',
      problemEn:
          'A pharmacy storefront must make a broad catalog easy to search while keeping bilingual navigation, account state, cart actions, and payments clear.',
      problemAr:
          'يحتاج متجر الصيدلية إلى جعل الكتالوج سهل البحث مع وضوح التنقل ثنائي اللغة وحالة الحساب وإجراءات السلة والدفع.',
      roleEn:
          'Built the Flutter experience, responsive commerce flows, bilingual and theme behavior, catalog interactions, favorites, cart, and integration-facing payment screens.',
      roleAr:
          'بناء تجربة Flutter، تدفقات التجارة responsive، سلوك اللغة والثيم، تفاعلات الكتالوج، المفضلة، السلة، وشاشات التكامل مع الدفع.',
      challengeEn:
          'Keep a feature-rich catalog readable across themes and languages without making routine shopping actions feel heavy.',
      challengeAr:
          'الحفاظ على وضوح كتالوج غني بالمميزات عبر الثيمات واللغات بدون جعل إجراءات الشراء اليومية معقدة.',
      solutionEn:
          'Reusable product surfaces, predictable state feedback, consistent filters, and a linear cart-to-payment journey keep the experience understandable.',
      solutionAr:
          'تجعل مكونات المنتجات القابلة لإعادة الاستخدام، feedback واضح للحالة، فلاتر متسقة، ومسار خطي من السلة إلى الدفع التجربة سهلة الفهم.',
      statusEn: 'APK available',
      statusAr: 'APK متاح',
      type: ProjectType.mobile,
      techStack: [
        'Flutter',
        'Dart',
        'Firebase',
        'Supabase',
        'Paymob',
        'Responsive UI',
        'Arabic / English',
        'Dark / Light Theme'
      ],
      featuresEn: [
        'Arabic and English experience',
        'Dark and light themes',
        'Catalog, offers, and latest products',
        'Search and favorites',
        'Cart and order history',
        'Payment-method selection'
      ],
      featuresAr: [
        'تجربة عربية وإنجليزية',
        'الوضع الفاتح والداكن',
        'الكتالوج والعروض وأحدث المنتجات',
        'البحث والمفضلة',
        'السلة وسجل الطلبات',
        'اختيار طريقة الدفع'
      ],
      highlightsEn: [
        'Bilingual commerce',
        'Multiple themes',
        'Payment integration'
      ],
      highlightsAr: ['تجارة ثنائية اللغة', 'ثيمات متعددة', 'تكامل الدفع'],
      workflowEn: [
        'Sign in',
        'Browse catalog and offers',
        'Search or save favorites',
        'Review cart',
        'Choose payment method',
        'Track orders and account settings'
      ],
      workflowAr: [
        'تسجيل الدخول',
        'تصفح الكتالوج والعروض',
        'البحث أو حفظ المفضلة',
        'مراجعة السلة',
        'اختيار طريقة الدفع',
        'متابعة الطلبات وإعدادات الحساب'
      ],
      ownerConfirmedFeaturesEn: [
        'Flutter, Firebase, and Supabase',
        'Arabic/English and dark/light themes',
        'Paymob payment integration',
        'Categories, offers, search, favorites, and cart'
      ],
      ownerConfirmedFeaturesAr: [
        'Flutter وFirebase وSupabase',
        'العربي/الإنجليزي والوضع الفاتح/الداكن',
        'تكامل Paymob',
        'التصنيفات والعروض والبحث والمفضلة والسلة'
      ],
      screenshotConfirmedFeaturesEn: [
        'Login and profile flows',
        'Light and dark storefronts',
        'Search, wishlist, orders, and settings',
        'Payment-method screen'
      ],
      screenshotConfirmedFeaturesAr: [
        'تسجيل الدخول والملف الشخصي',
        'واجهات فاتحة وداكنة',
        'البحث والمفضلة والطلبات والإعدادات',
        'شاشة طرق الدفع'
      ],
      screenshots: AppAssets.drYasmeenScreenshots,
      coverImage: AppAssets.drYasmeenCover,
      links: <ProjectLinkModel>[
        ProjectLinkModel(
            labelEn: 'Download APK',
            labelAr: 'تحميل APK',
            url: AppLinks.pharmacyApk,
            type: ProjectLinkType.apk)
      ],
      isSourcePrivate: true,
    ),
    ProjectModel(
      id: 'noga-mobile',
      displayPriority: 2,
      platformOrder: 2,
      featuredPriority: 2,
      titleEn: 'Noga Mobile',
      titleAr: 'Noga Mobile',
      categoryEn: 'Service operations and device workflow',
      categoryAr: 'إدارة عمليات الخدمة والأجهزة',
      shortDescriptionEn:
          'A mobile operations application with work orders, device intake, technician and customer views, daily-session controls, inventory activity, and management dashboards.',
      shortDescriptionAr:
          'تطبيق عمليات للموبايل يضم أوامر العمل، استقبال الأجهزة، شاشات الفنيين والعملاء، إدارة الجلسة اليومية، حركة المخزون، ولوحات الإدارة.',
      overviewEn:
          'Twenty-four approved screenshots document the Arabic operations experience from splash and navigation through work orders, technicians, customers, returned devices, staged single- and multi-device intake, accounting, end-of-day controls, backup management, and user permissions. Exact business ownership and backend scope remain unconfirmed.',
      overviewAr:
          'توثق أربع وعشرون شاشة معتمدة تجربة العمليات العربية من شاشة البداية والتنقل إلى أوامر العمل والفنيين والعملاء والأجهزة المرتجعة واستقبال جهاز واحد أو عدة أجهزة والمحاسبة وإجراءات نهاية اليوم والنسخ الاحتياطي وصلاحيات المستخدمين. ما زال نطاق الملكية والـ backend غير مؤكد.',
      problemEn:
          'A high-volume service workflow needs many operational views without losing clarity when moving between intake, technicians, finance, and management.',
      problemAr:
          'تحتاج عمليات الخدمة كثيفة الاستخدام إلى شاشات تشغيلية متعددة مع الحفاظ على الوضوح بين الاستقبال والفنيين والمالية والإدارة.',
      roleEn:
          'The supplied portfolio evidence confirms the Flutter interface and workflows; Mohamed’s exact module ownership, backend work, and release responsibility remain unconfirmed.',
      roleAr:
          'تؤكد مواد البورتفوليو واجهة Flutter ومسارات العمل؛ وما زال نطاق الوحدات التي نفذها محمد، والـ backend، ومسؤولية الإصدار غير مؤكد.',
      challengeEn:
          'Present operational depth on a phone while keeping repeated actions fast and status-heavy screens scannable.',
      challengeAr:
          'عرض عمق تشغيلي كبير على الهاتف مع إبقاء الإجراءات المتكررة سريعة والشاشات المليئة بالحالات سهلة القراءة.',
      solutionEn:
          'The visible design organizes work into focused modules, summary dashboards, staged intake forms, and dedicated management screens.',
      solutionAr:
          'ينظم التصميم الظاهر العمل في وحدات واضحة، لوحات ملخصة، نماذج استقبال مرحلية، وشاشات إدارة متخصصة.',
      statusEn: 'Private source • Showcase available',
      statusAr: 'الكود خاص • العرض متاح',
      type: ProjectType.mobile,
      techStack: ['Flutter', 'Dart', 'Arabic UI', 'Responsive UI'],
      featuresEn: [
        'Work-order dashboard',
        'Technician and customer management',
        'Device intake workflow',
        'Daily-session controls',
        'Financial and inventory views',
        'Backup and user management'
      ],
      featuresAr: [
        'لوحة أوامر العمل',
        'إدارة الفنيين والعملاء',
        'مسار استقبال الأجهزة',
        'إدارة الجلسة اليومية',
        'شاشات المالية والمخزون',
        'النسخ الاحتياطي وإدارة المستخدمين'
      ],
      highlightsEn: [
        '24 approved mobile screens',
        'Arabic operations UI',
        'Management dashboards'
      ],
      highlightsAr: [
        '24 شاشة موبايل معتمدة',
        'واجهة عمليات عربية',
        'لوحات إدارة'
      ],
      workflowEn: [
        'Open work orders',
        'Select an operations module',
        'Register customer and device',
        'Record faults and pricing',
        'Review technician or finance status',
        'Close the daily session'
      ],
      workflowAr: [
        'فتح أوامر العمل',
        'اختيار وحدة تشغيلية',
        'تسجيل العميل والجهاز',
        'تسجيل الأعطال والتسعير',
        'مراجعة حالة الفني أو المالية',
        'إغلاق الجلسة اليومية'
      ],
      ownerConfirmedFeaturesEn: [],
      ownerConfirmedFeaturesAr: [],
      screenshotConfirmedFeaturesEn: [
        'Technician, returns, backup, and user-management screens',
        'Single- and multi-device intake',
        'End-of-day and accounting summaries',
        'Operational filters and technician settlements'
      ],
      screenshotConfirmedFeaturesAr: [
        'شاشات الفنيين والمرتجعات والنسخ الاحتياطي وإدارة المستخدمين',
        'استقبال جهاز واحد وعدة أجهزة',
        'ملخصات نهاية اليوم والمحاسبة',
        'الفلاتر التشغيلية وتسويات الفنيين'
      ],
      screenshots: const <String>[],
      mediaItems: AuthoritativeMediaData.nogaMobile,
      coverImage: AppAssets.nogaMobileCover,
      links: <ProjectLinkModel>[],
      isSourcePrivate: true,
      hasUnconfirmedDetails: true,
      defaultMediaKind: ProjectMediaKind.phone,
      showApkButton: false,
      showcaseType: ProjectShowcaseType.video,
      showcaseVideoPath: AppAssets.nogaMobileShowcaseVideo,
      showcasePosterPath: AppAssets.nogaMobileShowcasePoster,
    ),
    ProjectModel(
      id: 'sharks-academy',
      displayPriority: 3,
      platformOrder: 3,
      featuredPriority: 3,
      titleEn: 'Sharks Academy',
      titleAr: 'Sharks Academy',
      categoryEn: 'Education, courses, and examinations',
      categoryAr: 'تعليم وكورسات وامتحانات',
      shortDescriptionEn:
          'An educational mobile application that organizes courses, learning content, examinations, question flows, results, and student account screens.',
      shortDescriptionAr:
          'تطبيق تعليمي للموبايل ينظم الكورسات والمحتوى الدراسي والامتحانات والأسئلة والنتائج وشاشات حساب الطالب.',
      overviewEn:
          'Sharks Academy organizes courses, learning content, and examinations through a focused student experience. Twenty-five supplied visuals show onboarding, authentication, course discovery, course details, learning content, exam discovery, question answering, results, profile, settings, and electronic receipt views.',
      overviewAr:
          'ينظم Sharks Academy الكورسات والمحتوى الدراسي والامتحانات من خلال تجربة واضحة للطلاب. تعرض خمس وعشرون صورة الـ onboarding، تسجيل الدخول، استعراض الكورسات، تفاصيل المحتوى، اكتشاف الامتحانات، الإجابة عن الأسئلة، النتائج، الملف الشخصي، الإعدادات، والإيصال الإلكتروني.',
      problemEn:
          'Students need a simple path from discovering learning material to completing an exam and understanding the result.',
      problemAr:
          'يحتاج الطلاب إلى مسار بسيط من اكتشاف المحتوى التعليمي إلى إكمال الامتحان وفهم النتيجة.',
      roleEn:
          'Built the Flutter mobile presentation and the visible course, content, examination, result, profile, and receipt flows. Backend ownership is not documented.',
      roleAr:
          'بناء واجهة Flutter للموبايل ومسارات الكورسات والمحتوى والامتحانات والنتائج والملف الشخصي والإيصال الظاهرة. ملكية الـ backend غير موثقة.',
      challengeEn:
          'Keep a broad education journey coherent while moving between catalog discovery, detailed content, timed questions, and results.',
      challengeAr:
          'الحفاظ على ترابط رحلة تعليمية واسعة بين اكتشاف الكتالوج والمحتوى التفصيلي والأسئلة والنتائج.',
      solutionEn:
          'The interface uses clear stage changes, consistent navigation, focused exam surfaces, and result feedback to keep the student oriented.',
      solutionAr:
          'تستخدم الواجهة مراحل واضحة وتنقلًا متسقًا وشاشات امتحان مركزة وfeedback للنتائج للحفاظ على وضوح رحلة الطالب.',
      statusEn: 'Complete supplied visual journey',
      statusAr: 'رحلة بصرية كاملة متاحة',
      type: ProjectType.mobile,
      techStack: ['Flutter', 'Dart', 'Responsive UI', 'Arabic UI'],
      featuresEn: [
        'Course discovery',
        'Course details and learning content',
        'Exam catalog and search',
        'Question navigation',
        'Exam results',
        'Student profile and settings'
      ],
      featuresAr: [
        'استعراض الكورسات',
        'تفاصيل الكورس والمحتوى التعليمي',
        'قائمة الامتحانات والبحث',
        'التنقل بين الأسئلة',
        'نتائج الامتحان',
        'ملف الطالب والإعدادات'
      ],
      highlightsEn: ['Courses and content', 'Exam journey', 'Student account'],
      highlightsAr: ['كورسات ومحتوى', 'رحلة الامتحان', 'حساب الطالب'],
      workflowEn: [
        'Complete onboarding',
        'Sign in or register',
        'Discover a course',
        'Open learning content',
        'Choose and answer an exam',
        'Review result and profile'
      ],
      workflowAr: [
        'إكمال onboarding',
        'تسجيل الدخول أو إنشاء حساب',
        'اكتشاف كورس',
        'فتح المحتوى التعليمي',
        'اختيار الامتحان والإجابة',
        'مراجعة النتيجة والملف الشخصي'
      ],
      ownerConfirmedFeaturesEn: [
        'Courses',
        'Examinations',
        'Educational content'
      ],
      ownerConfirmedFeaturesAr: ['الكورسات', 'الامتحانات', 'المحتوى التعليمي'],
      screenshotConfirmedFeaturesEn: [
        'Onboarding and authentication',
        'Course catalog and details',
        'Exam catalog, questions, and results',
        'Profile, settings, and electronic receipts'
      ],
      screenshotConfirmedFeaturesAr: [
        'Onboarding وتسجيل الدخول',
        'كتالوج الكورسات وتفاصيلها',
        'قائمة الامتحانات والأسئلة والنتائج',
        'الملف الشخصي والإعدادات والإيصالات الإلكترونية'
      ],
      screenshots: AppAssets.sharksAcademyScreenshots,
      coverImage: AppAssets.sharksAcademyCover,
      links: <ProjectLinkModel>[],
      isSourcePrivate: true,
      hasUnconfirmedDetails: true,
    ),
    ProjectModel(
      id: 'targetx-app',
      displayPriority: 4,
      platformOrder: 4,
      featuredPriority: 4,
      titleEn: 'TargetX',
      titleAr: 'TargetX',
      categoryEn: 'Flutter e-commerce',
      categoryAr: 'تطبيق تجارة إلكترونية بـ Flutter',
      shortDescriptionEn:
          'An API-driven e-commerce application with catalog browsing, categories, offers, favorites, cart, checkout, profile, and settings.',
      shortDescriptionAr:
          'تطبيق تجارة إلكترونية مع APIs يضم الكتالوج والتصنيفات والعروض والمفضلة والسلة وcheckout والملف الشخصي والإعدادات.',
      overviewEn:
          'TargetX is a Flutter e-commerce application documented by thirteen branded screens. The CV confirms API integration, state management, responsive UI, product catalog, search, favorites, cart, checkout, clean architecture, animations, and performance-focused UX.',
      overviewAr:
          'TargetX هو تطبيق تجارة إلكترونية بـ Flutter وتوثقه ثلاث عشرة شاشة branded. تؤكد السيرة الذاتية تكامل APIs، إدارة state، واجهة responsive، كتالوج المنتجات، البحث، المفضلة، السلة، checkout، Clean Architecture، الأنيميشن، وتحسين الأداء.',
      problemEn:
          'The shopping journey needs stable state and clear hierarchy as users move between offers, product details, favorites, cart, and checkout.',
      problemAr:
          'تحتاج رحلة التسوق إلى state ثابتة وhierarchy واضحة أثناء التنقل بين العروض وتفاصيل المنتجات والمفضلة والسلة وcheckout.',
      roleEn:
          'Implemented the Flutter UI, API-driven catalog flows, state handling, favorites, cart, checkout, animations, and clean application structure.',
      roleAr:
          'تنفيذ واجهة Flutter، تدفقات الكتالوج المعتمدة على APIs، إدارة state، المفضلة، السلة، checkout، الأنيميشن، وبنية تطبيق نظيفة.',
      challengeEn:
          'Keep API-backed screens responsive and predictable while product and cart states change frequently.',
      challengeAr:
          'الحفاظ على استجابة وثبات الشاشات المعتمدة على APIs مع تغيّر حالات المنتجات والسلة باستمرار.',
      solutionEn:
          'Reusable commerce surfaces and separated UI, state, and data concerns keep navigation and updates consistent.',
      solutionAr:
          'تحافظ مكونات التجارة القابلة لإعادة الاستخدام وفصل UI وstate وdata على اتساق التنقل والتحديثات.',
      statusEn: 'APK and 13 branded screenshots available',
      statusAr: 'APK و13 صورة branded متاحة',
      type: ProjectType.mobile,
      techStack: [
        'Flutter',
        'Dart',
        'REST APIs',
        'State Management',
        'Clean Architecture',
        'Responsive UI'
      ],
      featuresEn: [
        'Product catalog and categories',
        'Offers and coupons',
        'Favorites',
        'Cart management',
        'Product details and related items',
        'Secure checkout and account settings'
      ],
      featuresAr: [
        'كتالوج المنتجات والتصنيفات',
        'العروض والكوبونات',
        'المفضلة',
        'إدارة السلة',
        'تفاصيل المنتجات والعناصر المرتبطة',
        'Checkout آمن وإعدادات الحساب'
      ],
      highlightsEn: [
        'API integration',
        'Complete catalog flow',
        'Checkout journey'
      ],
      highlightsAr: ['تكامل APIs', 'مسار كتالوج كامل', 'رحلة Checkout'],
      workflowEn: [
        'Browse catalog',
        'Explore offers and categories',
        'Open product details',
        'Save favorites',
        'Review cart',
        'Complete secure checkout'
      ],
      workflowAr: [
        'تصفح الكتالوج',
        'استعراض العروض والتصنيفات',
        'فتح تفاصيل المنتج',
        'حفظ المفضلة',
        'مراجعة السلة',
        'إكمال Checkout الآمن'
      ],
      ownerConfirmedFeaturesEn: [
        'API integration and state management',
        'Product catalog, search, favorites, cart, and checkout',
        'Clean Architecture and performance optimization'
      ],
      ownerConfirmedFeaturesAr: [
        'تكامل APIs وإدارة state',
        'الكتالوج والبحث والمفضلة والسلة وcheckout',
        'Clean Architecture وتحسين الأداء'
      ],
      screenshotConfirmedFeaturesEn: [
        'Catalog, offers, and categories',
        'Favorites and cart',
        'Product details and related items',
        'Checkout, profile, and settings'
      ],
      screenshotConfirmedFeaturesAr: [
        'الكتالوج والعروض والتصنيفات',
        'المفضلة والسلة',
        'تفاصيل المنتجات والعناصر المرتبطة',
        'Checkout والملف الشخصي والإعدادات'
      ],
      screenshots: AppAssets.targetxScreenshots,
      coverImage: AppAssets.targetxCover,
      links: <ProjectLinkModel>[
        ProjectLinkModel(
            labelEn: 'Download APK',
            labelAr: 'تحميل APK',
            url: AppLinks.targetxApk,
            type: ProjectLinkType.apk)
      ],
      isSourcePrivate: true,
    ),
    ProjectModel(
      id: 'farah-services',
      displayPriority: 5,
      platformOrder: 5,
      featuredPriority: 5,
      titleEn: 'Farah Services',
      titleAr: 'Farah للخدمات',
      categoryEn: 'Services marketplace',
      categoryAr: 'تطبيق خدمات',
      shortDescriptionEn:
          'A services application with bilingual light/dark storefronts, categories, service details, favorites, profile, and personal service management.',
      shortDescriptionAr:
          'تطبيق خدمات بواجهات فاتحة وداكنة وتصنيفات وتفاصيل خدمات ومفضلة وملف شخصي وإدارة الخدمات.',
      overviewEn:
          'Farah Services is a Flutter services application. The CV confirms Provider, FirebaseAuth, Firestore, FirebaseStorage, PayPal, responsive UI, clean code, and an admin panel. Thirteen visuals show splash, onboarding, storefront themes, categories, service details, favorites, personal services, and profile flows.',
      overviewAr:
          'Farah للخدمات هو تطبيق Flutter للخدمات. تؤكد السيرة الذاتية استخدام Provider وFirebaseAuth وFirestore وFirebaseStorage وPayPal وواجهة responsive وكود منظم ولوحة إدارة. تعرض ثلاث عشرة صورة splash وonboarding والثيمات والتصنيفات وتفاصيل الخدمة والمفضلة وخدمات المستخدم والملف الشخصي.',
      problemEn:
          'A service marketplace must make discovery and trust simple while supporting account state, saved services, and service management.',
      problemAr:
          'يحتاج سوق الخدمات إلى تبسيط الاكتشاف والثقة مع دعم حالة الحساب والخدمات المحفوظة وإدارة خدمات المستخدم.',
      roleEn:
          'Built the Flutter client experience, responsive service discovery, Firebase-backed authentication and content flows, PayPal-facing flow, and reusable UI components.',
      roleAr:
          'بناء تجربة Flutter، اكتشاف الخدمات responsive، تدفقات المصادقة والمحتوى مع Firebase، مسار PayPal، ومكونات UI قابلة لإعادة الاستخدام.',
      challengeEn:
          'Present many service categories without making the home and detail journeys feel crowded.',
      challengeAr:
          'عرض تصنيفات خدمات متعددة بدون ازدحام رحلة الصفحة الرئيسية والتفاصيل.',
      solutionEn:
          'Clear category surfaces, consistent cards, theme parity, and direct favorites and profile entry points keep the journey focused.',
      solutionAr:
          'تحافظ واجهات التصنيفات الواضحة والكروت المتسقة وتكافؤ الثيمات والوصول المباشر للمفضلة والملف الشخصي على تركيز الرحلة.',
      statusEn: 'APK available',
      statusAr: 'APK متاح',
      type: ProjectType.mobile,
      techStack: [
        'Flutter',
        'Dart',
        'Provider',
        'Firebase Auth',
        'Firestore',
        'Firebase Storage',
        'PayPal',
        'Responsive UI'
      ],
      featuresEn: [
        'Service discovery',
        'Categories and details',
        'Light and dark themes',
        'Favorites',
        'My services',
        'Profile and account flows'
      ],
      featuresAr: [
        'اكتشاف الخدمات',
        'التصنيفات والتفاصيل',
        'الثيم الفاتح والداكن',
        'المفضلة',
        'خدماتي',
        'الملف الشخصي والحساب'
      ],
      highlightsEn: [
        'Firebase services',
        'PayPal flow',
        'Bilingual visual system'
      ],
      highlightsAr: ['خدمات Firebase', 'مسار PayPal', 'نظام بصري ثنائي اللغة'],
      workflowEn: [
        'Open the storefront',
        'Browse categories',
        'Review a service',
        'Save favorites',
        'Manage personal services',
        'Update the profile'
      ],
      workflowAr: [
        'فتح واجهة الخدمات',
        'تصفح التصنيفات',
        'مراجعة خدمة',
        'حفظ المفضلة',
        'إدارة الخدمات الشخصية',
        'تحديث الملف الشخصي'
      ],
      ownerConfirmedFeaturesEn: [
        'Provider, FirebaseAuth, Firestore, and FirebaseStorage',
        'PayPal integration',
        'Responsive UI and admin panel'
      ],
      ownerConfirmedFeaturesAr: [
        'Provider وFirebaseAuth وFirestore وFirebaseStorage',
        'تكامل PayPal',
        'واجهة responsive ولوحة إدارة'
      ],
      screenshotConfirmedFeaturesEn: [
        'Splash and welcome',
        'Light and dark home screens',
        'Categories and service details',
        'Favorites, my services, and profile'
      ],
      screenshotConfirmedFeaturesAr: [
        'Splash والترحيب',
        'شاشات رئيسية فاتحة وداكنة',
        'التصنيفات وتفاصيل الخدمة',
        'المفضلة وخدماتي والملف الشخصي'
      ],
      screenshots: AppAssets.farahServicesScreenshots,
      coverImage: AppAssets.farahServicesCover,
      links: <ProjectLinkModel>[
        ProjectLinkModel(
            labelEn: 'Download APK',
            labelAr: 'تحميل APK',
            url: AppLinks.farahServicesApk,
            type: ProjectLinkType.apk)
      ],
      isSourcePrivate: true,
    ),
    ProjectModel(
      id: 'trelixi-learning-app',
      displayPriority: 6,
      platformOrder: 6,
      featuredPriority: 6,
      titleEn: 'Trelixi Learning App',
      titleAr: 'تطبيق Trelixi التعليمي',
      categoryEn: 'Arabic learning for children',
      categoryAr: 'تعليم اللغة العربية للأطفال',
      shortDescriptionEn:
          'An interactive Arabic learning application for children aged 5–12 with structured levels, activities, audio feedback, stories, and progress.',
      shortDescriptionAr:
          'تطبيق تفاعلي لتعليم العربية للأطفال من 5 إلى 12 سنة من خلال مستويات وأنشطة وصوتيات وقصص وتتبع للتقدم.',
      overviewEn:
          'Trelixi helps children aged 5–12 improve Arabic skills through five structured learning levels. Twenty screens document profile selection, stories, root-family activities, root awareness, matching, morphological learning, word usage, feedback, and progress-oriented activities.',
      overviewAr:
          'يساعد Trelixi الأطفال من 5 إلى 12 سنة على تحسين مهارات العربية عبر خمسة مستويات تعليمية منظمة. توثق عشرون شاشة اختيار الملف والقصص وأنشطة عائلة الجذر والوعي بالجذر والمطابقة والتعلم الصرفي واستخدام الكلمات والfeedback وأنشطة التقدم.',
      problemEn:
          'Arabic morphology can be abstract for children, so learning activities must stay playful, guided, and visually understandable.',
      problemAr:
          'قد يكون الصرف العربي مجردًا للأطفال، لذلك يجب أن تبقى الأنشطة ممتعة وموجهة وواضحة بصريًا.',
      roleEn:
          'Built the Flutter learning experience, interactive activities, responsive screens, animation and audio feedback surfaces, and progress flows.',
      roleAr:
          'بناء تجربة التعلم بـ Flutter، الأنشطة التفاعلية، الشاشات responsive، واجهات الأنيميشن والfeedback الصوتي، ومسارات التقدم.',
      challengeEn:
          'Balance playful interaction with structured language concepts and clear progress feedback.',
      challengeAr:
          'موازنة التفاعل الممتع مع مفاهيم لغوية منظمة وfeedback واضح للتقدم.',
      solutionEn:
          'Each learning concept is broken into a focused activity with repeated visual language, immediate feedback, and a progression path.',
      solutionAr:
          'يتم تقسيم كل مفهوم تعليمي إلى نشاط مركز بلغة بصرية متسقة وfeedback فوري ومسار تقدم واضح.',
      statusEn: 'Under development; APK available',
      statusAr: 'قيد التطوير؛ APK متاح',
      type: ProjectType.mobile,
      techStack: [
        'Flutter',
        'Dart',
        'Animations',
        'Audio Feedback',
        'Responsive UI',
        'Progress Tracking'
      ],
      featuresEn: [
        'Root-family discovery',
        'Root awareness',
        'Derivational patterns',
        'Morphological learning',
        'Word usage',
        'Stories and progress activities'
      ],
      featuresAr: [
        'اكتشاف عائلة الجذر',
        'الوعي بالجذر',
        'الأنماط الاشتقاقية',
        'التعلم الصرفي',
        'استخدام الكلمات',
        'القصص وأنشطة التقدم'
      ],
      highlightsEn: [
        'Five learning levels',
        'Audio and visual feedback',
        'Child-friendly activities'
      ],
      highlightsAr: [
        'خمسة مستويات تعليمية',
        'Feedback صوتي وبصري',
        'أنشطة مناسبة للأطفال'
      ],
      workflowEn: [
        'Choose a learner profile',
        'Open a story or level',
        'Learn the target concept',
        'Complete matching or drag activities',
        'Receive immediate feedback',
        'Continue progress'
      ],
      workflowAr: [
        'اختيار ملف المتعلم',
        'فتح قصة أو مستوى',
        'تعلم المفهوم المستهدف',
        'إكمال أنشطة المطابقة أو السحب',
        'استلام feedback فوري',
        'متابعة التقدم'
      ],
      ownerConfirmedFeaturesEn: [
        'Five interactive Arabic learning levels',
        'Animations and audio feedback',
        'Progress tracking'
      ],
      ownerConfirmedFeaturesAr: [
        'خمسة مستويات تفاعلية لتعليم العربية',
        'الأنيميشن والfeedback الصوتي',
        'تتبع التقدم'
      ],
      screenshotConfirmedFeaturesEn: [
        'Profile and login flows',
        'Story library and level introductions',
        'Root and morphology activities',
        'Success feedback and word-use exercises'
      ],
      screenshotConfirmedFeaturesAr: [
        'الملف وتسجيل الدخول',
        'مكتبة القصص ومقدمات المستويات',
        'أنشطة الجذور والصرف',
        'Feedback النجاح وتمارين استخدام الكلمات'
      ],
      screenshots: AppAssets.trelixiScreenshots,
      coverImage: AppAssets.trelixiCover,
      links: <ProjectLinkModel>[
        ProjectLinkModel(
            labelEn: 'Download APK',
            labelAr: 'تحميل APK',
            url: AppLinks.trelixiApk,
            type: ProjectLinkType.apk)
      ],
      isSourcePrivate: true,
    ),
    ProjectModel(
      id: 'education-app',
      displayPriority: 7,
      platformOrder: 7,
      titleEn: 'Education App',
      titleAr: 'تطبيق Education',
      categoryEn: 'Scalable learning modules',
      categoryAr: 'وحدات تعليمية قابلة للتوسع',
      shortDescriptionEn:
          'A clean education application with registration, course discovery, lesson details, profile feedback, and responsive learning modules.',
      shortDescriptionAr:
          'تطبيق تعليمي منظم يضم التسجيل، اكتشاف الكورسات، تفاصيل الدروس، تقييم الملف الشخصي، ووحدات تعلم responsive.',
      overviewEn:
          'The CV confirms Flutter, Provider, responsive UI, and Clean Architecture. Seven visuals document registration, home, course catalog, course details, lesson details, profile rating, and a presentation board.',
      overviewAr:
          'تؤكد السيرة الذاتية استخدام Flutter وProvider وواجهة responsive وClean Architecture. توثق سبع صور التسجيل والصفحة الرئيسية وكتالوج الكورسات وتفاصيل الكورس والدرس وتقييم الملف الشخصي ولوحة عرض.',
      problemEn:
          'Learning modules need a simple hierarchy that can expand without making course and lesson discovery confusing.',
      problemAr:
          'تحتاج وحدات التعلم إلى hierarchy بسيطة قابلة للتوسع بدون إرباك اكتشاف الكورسات والدروس.',
      roleEn:
          'Built the Flutter UI, Provider-driven state flow, responsive course surfaces, and clean module structure.',
      roleAr:
          'بناء واجهة Flutter، تدفق state باستخدام Provider، شاشات الكورسات responsive، وهيكل وحدات منظم.',
      challengeEn:
          'Keep course and lesson navigation consistent as the content structure grows.',
      challengeAr:
          'الحفاظ على اتساق التنقل بين الكورسات والدروس مع نمو هيكل المحتوى.',
      solutionEn:
          'Reusable course cards and clear detail levels provide a predictable learning path.',
      solutionAr:
          'توفر كروت الكورسات القابلة لإعادة الاستخدام ومستويات التفاصيل الواضحة مسار تعلم متوقعًا.',
      statusEn: 'APK available',
      statusAr: 'APK متاح',
      type: ProjectType.mobile,
      techStack: [
        'Flutter',
        'Dart',
        'Provider',
        'Clean Architecture',
        'Responsive UI'
      ],
      featuresEn: [
        'Registration',
        'Course discovery',
        'Course details',
        'Lesson details',
        'Profile feedback'
      ],
      featuresAr: [
        'التسجيل',
        'اكتشاف الكورسات',
        'تفاصيل الكورس',
        'تفاصيل الدرس',
        'تقييم الملف الشخصي'
      ],
      highlightsEn: [
        'Provider state',
        'Clean modules',
        'Responsive learning UI'
      ],
      highlightsAr: [
        'State بـ Provider',
        'وحدات منظمة',
        'واجهة تعلم responsive'
      ],
      workflowEn: [
        'Register',
        'Browse courses',
        'Open course details',
        'Review a lesson',
        'Rate or review the profile'
      ],
      workflowAr: [
        'إنشاء حساب',
        'تصفح الكورسات',
        'فتح تفاصيل الكورس',
        'مراجعة درس',
        'تقييم الملف الشخصي'
      ],
      ownerConfirmedFeaturesEn: [
        'Provider',
        'Responsive UI',
        'Clean Architecture'
      ],
      ownerConfirmedFeaturesAr: [
        'Provider',
        'واجهة responsive',
        'Clean Architecture'
      ],
      screenshotConfirmedFeaturesEn: [
        'Registration and home',
        'Course catalog and details',
        'Lesson details and profile rating'
      ],
      screenshotConfirmedFeaturesAr: [
        'التسجيل والرئيسية',
        'كتالوج الكورسات والتفاصيل',
        'تفاصيل الدرس وتقييم الملف'
      ],
      screenshots: AppAssets.educationScreenshots,
      coverImage: AppAssets.educationCover,
      links: <ProjectLinkModel>[
        ProjectLinkModel(
            labelEn: 'Download APK',
            labelAr: 'تحميل APK',
            url: AppLinks.educationApk,
            type: ProjectLinkType.apk)
      ],
      isSourcePrivate: true,
    ),
    ProjectModel(
      id: 'cleany-app',
      displayPriority: 8,
      platformOrder: 8,
      titleEn: 'Cleany',
      titleAr: 'Cleany',
      categoryEn: 'Cleaning service booking',
      categoryAr: 'حجز خدمات التنظيف',
      shortDescriptionEn:
          'A service-booking application with a clean home, booking flow, location entry, checkout, and profile experience.',
      shortDescriptionAr:
          'تطبيق لحجز خدمات التنظيف يضم الصفحة الرئيسية ومسار الحجز وإضافة الموقع وcheckout والملف الشخصي.',
      overviewEn:
          'The CV confirms GoRouter, Provider, responsive UI, and API integration. Six visuals show service discovery, booking, location, checkout, profile, and a presentation board.',
      overviewAr:
          'تؤكد السيرة الذاتية استخدام GoRouter وProvider وواجهة responsive وتكامل APIs. تعرض ست صور اكتشاف الخدمة والحجز والموقع وcheckout والملف الشخصي ولوحة عرض.',
      problemEn:
          'A booking journey must make service selection, location, and checkout feel linear and low-friction.',
      problemAr:
          'يجب أن يجعل مسار الحجز اختيار الخدمة والموقع وcheckout خطيًا وسهلًا.',
      roleEn:
          'Built the Flutter navigation, Provider state flow, API-facing content, and responsive booking interfaces.',
      roleAr:
          'بناء تنقل Flutter، تدفق state بـ Provider، المحتوى المعتمد على APIs، وواجهات الحجز responsive.',
      challengeEn:
          'Avoid losing context while the user moves through multiple booking steps.',
      challengeAr:
          'تجنب فقدان السياق أثناء انتقال المستخدم عبر خطوات الحجز المتعددة.',
      solutionEn:
          'A staged booking flow with clear actions and summary surfaces keeps each decision visible.',
      solutionAr:
          'يحافظ مسار الحجز المرحلي مع إجراءات واضحة وملخصات على ظهور كل قرار.',
      statusEn: 'APK available',
      statusAr: 'APK متاح',
      type: ProjectType.mobile,
      techStack: [
        'Flutter',
        'Dart',
        'GoRouter',
        'Provider',
        'REST APIs',
        'Responsive UI'
      ],
      featuresEn: [
        'Service discovery',
        'Booking flow',
        'Location entry',
        'Checkout',
        'Profile and dark theme'
      ],
      featuresAr: [
        'اكتشاف الخدمات',
        'مسار الحجز',
        'إضافة الموقع',
        'Checkout',
        'الملف الشخصي والثيم الداكن'
      ],
      highlightsEn: ['GoRouter navigation', 'API content', 'Linear booking UX'],
      highlightsAr: ['تنقل GoRouter', 'محتوى API', 'تجربة حجز خطية'],
      workflowEn: [
        'Discover a service',
        'Configure a booking',
        'Add the location',
        'Review checkout',
        'Manage the profile'
      ],
      workflowAr: [
        'اكتشاف خدمة',
        'إعداد الحجز',
        'إضافة الموقع',
        'مراجعة Checkout',
        'إدارة الملف الشخصي'
      ],
      ownerConfirmedFeaturesEn: [
        'GoRouter',
        'Provider',
        'Responsive UI and API integration'
      ],
      ownerConfirmedFeaturesAr: [
        'GoRouter',
        'Provider',
        'واجهة responsive وتكامل APIs'
      ],
      screenshotConfirmedFeaturesEn: [
        'Home and service discovery',
        'Booking and location',
        'Checkout and profile'
      ],
      screenshotConfirmedFeaturesAr: [
        'الرئيسية واكتشاف الخدمة',
        'الحجز والموقع',
        'Checkout والملف الشخصي'
      ],
      screenshots: AppAssets.cleanyScreenshots,
      coverImage: AppAssets.cleanyCover,
      links: <ProjectLinkModel>[
        ProjectLinkModel(
            labelEn: 'Download APK',
            labelAr: 'تحميل APK',
            url: AppLinks.cleanyApk,
            type: ProjectLinkType.apk)
      ],
      isSourcePrivate: true,
    ),
    ProjectModel(
      id: 'fitness-app',
      displayPriority: 9,
      platformOrder: 9,
      titleEn: 'Fitness App',
      titleAr: 'تطبيق Fitness',
      categoryEn: 'Fitness and activity tracking',
      categoryAr: 'تتبع اللياقة والنشاط',
      shortDescriptionEn:
          'A fitness application with activity dashboards, discovery, plans, workout routines, recipes, and profile screens.',
      shortDescriptionAr:
          'تطبيق لياقة يضم لوحات النشاط والاستكشاف والخطط وروتين التمارين والوصفات والملف الشخصي.',
      overviewEn:
          'The CV confirms pedometer, fl_chart, shimmer, and responsive UI. Seven visuals show a dashboard, discovery, plans, routines, recipes, profile, and a presentation board.',
      overviewAr:
          'تؤكد السيرة الذاتية استخدام pedometer وfl_chart وshimmer وواجهة responsive. تعرض سبع صور dashboard والاستكشاف والخطط والروتين والوصفات والملف الشخصي ولوحة عرض.',
      problemEn:
          'Fitness data and content must remain motivating and readable instead of feeling like a dense analytics dashboard.',
      problemAr:
          'يجب أن تبقى بيانات ومحتوى اللياقة محفزين وسهلين للقراءة بدلًا من التحول إلى dashboard تحليلي مزدحم.',
      roleEn:
          'Built the responsive Flutter experience, activity visuals, chart surfaces, loading states, and content screens.',
      roleAr:
          'بناء تجربة Flutter responsive وواجهات النشاط والرسوم البيانية وحالات التحميل وشاشات المحتوى.',
      challengeEn:
          'Combine activity indicators, plans, workouts, and recipes within one coherent visual system.',
      challengeAr:
          'دمج مؤشرات النشاط والخطط والتمارين والوصفات داخل نظام بصري واحد.',
      solutionEn:
          'Distinct content sections and visual progress surfaces make the dashboard useful without overwhelming the user.',
      solutionAr:
          'تجعل أقسام المحتوى الواضحة ومؤشرات التقدم البصرية الـ dashboard مفيدة بدون إرهاق المستخدم.',
      statusEn: 'APK available',
      statusAr: 'APK متاح',
      type: ProjectType.mobile,
      techStack: [
        'Flutter',
        'Dart',
        'Pedometer',
        'fl_chart',
        'Shimmer',
        'Responsive UI'
      ],
      featuresEn: [
        'Activity dashboard',
        'Fitness discovery',
        'Plans',
        'Workout routines',
        'Recipes',
        'Profile'
      ],
      featuresAr: [
        'لوحة النشاط',
        'اكتشاف محتوى اللياقة',
        'الخطط',
        'روتين التمارين',
        'الوصفات',
        'الملف الشخصي'
      ],
      highlightsEn: [
        'Activity charts',
        'Fitness content',
        'Responsive dashboard'
      ],
      highlightsAr: ['رسوم النشاط', 'محتوى لياقة', 'Dashboard responsive'],
      workflowEn: [
        'Review activity',
        'Discover content',
        'Choose a plan',
        'Open a workout routine',
        'Browse recipes',
        'Manage the profile'
      ],
      workflowAr: [
        'مراجعة النشاط',
        'اكتشاف المحتوى',
        'اختيار خطة',
        'فتح روتين تمرين',
        'تصفح الوصفات',
        'إدارة الملف الشخصي'
      ],
      ownerConfirmedFeaturesEn: [
        'Pedometer',
        'fl_chart',
        'Shimmer and responsive UI'
      ],
      ownerConfirmedFeaturesAr: [
        'Pedometer',
        'fl_chart',
        'Shimmer وواجهة responsive'
      ],
      screenshotConfirmedFeaturesEn: [
        'Dashboard and discovery',
        'Plans and routines',
        'Recipes and profile'
      ],
      screenshotConfirmedFeaturesAr: [
        'Dashboard والاستكشاف',
        'الخطط والروتين',
        'الوصفات والملف الشخصي'
      ],
      screenshots: AppAssets.fitnessScreenshots,
      coverImage: AppAssets.fitnessCover,
      links: <ProjectLinkModel>[
        ProjectLinkModel(
            labelEn: 'Download APK',
            labelAr: 'تحميل APK',
            url: AppLinks.fitnessApk,
            type: ProjectLinkType.apk)
      ],
      isSourcePrivate: true,
    ),
    ProjectModel(
      id: 'kanzoon-app',
      displayPriority: 10,
      platformOrder: 10,
      titleEn: 'Kanzoon App',
      titleAr: 'تطبيق Kanzoon',
      categoryEn: 'Gamified family finance',
      categoryAr: 'إدارة مالية عائلية بأسلوب gamification',
      shortDescriptionEn:
          'A gamified Arabic family-finance application for allowances, savings goals, family setup, child profiles, challenges, badges, and rewards.',
      shortDescriptionAr:
          'تطبيق مالي عائلي عربي بأسلوب gamification للمصروفات وأهداف الادخار وإعداد الأسرة وملفات الأطفال والتحديات والشارات والمكافآت.',
      overviewEn:
          'The CV confirms child profiles, dashboards, gamified learning, badges, rewards, Arabic UI, progress tracking, and ongoing development. Eight supplied screens document onboarding, role selection, signup, a dashboard, saving goals, family setup, and settings.',
      overviewAr:
          'تؤكد السيرة الذاتية ملفات الأطفال وdashboards والتعلم بأسلوب gamification والشارات والمكافآت والواجهة العربية وتتبع التقدم واستمرار التطوير. توثق ثماني صور onboarding واختيار الدور والتسجيل وdashboard وأهداف الادخار وإعداد الأسرة والإعدادات.',
      problemEn:
          'Family finance can feel abstract to children, so allowances and savings goals need visible, encouraging feedback.',
      problemAr:
          'قد تبدو الإدارة المالية العائلية مجردة للأطفال، لذلك تحتاج المصروفات وأهداف الادخار إلى feedback مرئي ومشجع.',
      roleEn:
          'Built the Flutter structure, Arabic-first experience, profile and dashboard flows, gamification elements, and progress presentation.',
      roleAr:
          'بناء هيكل Flutter وتجربة عربية أولاً وتدفقات الملفات والـ dashboard وعناصر gamification وعرض التقدم.',
      challengeEn:
          'Serve both parent setup and child motivation without making either experience confusing.',
      challengeAr:
          'خدمة إعدادات الوالدين وتحفيز الأطفال بدون إرباك أي من التجربتين.',
      solutionEn:
          'Role selection, clear family setup, visual goals, and reward-oriented dashboards separate responsibilities while keeping progress visible.',
      solutionAr:
          'يفصل اختيار الدور وإعداد الأسرة الواضح والأهداف البصرية ولوحات المكافآت بين المسؤوليات مع إبقاء التقدم ظاهرًا.',
      statusEn: 'Under development; APK available',
      statusAr: 'قيد التطوير؛ APK متاح',
      type: ProjectType.mobile,
      techStack: [
        'Flutter',
        'Dart',
        'Arabic UI',
        'Gamification',
        'Dashboards',
        'Progress Tracking'
      ],
      featuresEn: [
        'Role selection',
        'Family setup',
        'Child profiles',
        'Savings goals',
        'Challenges and rewards',
        'Progress dashboards'
      ],
      featuresAr: [
        'اختيار الدور',
        'إعداد الأسرة',
        'ملفات الأطفال',
        'أهداف الادخار',
        'التحديات والمكافآت',
        'لوحات التقدم'
      ],
      highlightsEn: [
        'Arabic-first UX',
        'Gamified finance',
        'Family dashboards'
      ],
      highlightsAr: [
        'تجربة عربية أولاً',
        'تمويل بأسلوب gamification',
        'لوحات عائلية'
      ],
      workflowEn: [
        'Choose a role',
        'Create an account',
        'Set up the family',
        'Open the dashboard',
        'Create a saving goal',
        'Review settings and progress'
      ],
      workflowAr: [
        'اختيار الدور',
        'إنشاء حساب',
        'إعداد الأسرة',
        'فتح Dashboard',
        'إنشاء هدف ادخار',
        'مراجعة الإعدادات والتقدم'
      ],
      ownerConfirmedFeaturesEn: [
        'Allowances, savings goals, and challenges',
        'Child profiles, dashboards, badges, and rewards',
        'Arabic UI and progress tracking'
      ],
      ownerConfirmedFeaturesAr: [
        'المصروفات وأهداف الادخار والتحديات',
        'ملفات الأطفال والـ dashboards والشارات والمكافآت',
        'واجهة عربية وتتبع التقدم'
      ],
      screenshotConfirmedFeaturesEn: [
        'Onboarding and role selection',
        'Signup and family creation',
        'Dashboard and saving goals',
        'Settings'
      ],
      screenshotConfirmedFeaturesAr: [
        'Onboarding واختيار الدور',
        'التسجيل وإنشاء الأسرة',
        'Dashboard وأهداف الادخار',
        'الإعدادات'
      ],
      screenshots: AppAssets.kanzoonScreenshots,
      coverImage: AppAssets.kanzoonCover,
      links: <ProjectLinkModel>[
        ProjectLinkModel(
            labelEn: 'Download APK',
            labelAr: 'تحميل APK',
            url: AppLinks.kanzoonApk,
            type: ProjectLinkType.apk)
      ],
      isSourcePrivate: true,
    ),
    // ProjectModel(
    //   id: 'recast-food-app',
    //   displayPriority: 11,
    //   platformOrder: 11,
    //   titleEn: 'Recast Food App',
    //   titleAr: 'تطبيق Recast للأطعمة',
    //   categoryEn: 'Food discovery concept',
    //   categoryAr: 'تصور لتصفح الأطعمة',
    //   shortDescriptionEn:
    //       'A compact food-browsing interface showing a home feed, menu navigation, food details, and an exit state.',
    //   shortDescriptionAr:
    //       'واجهة مدمجة لتصفح الأطعمة تعرض الصفحة الرئيسية والتنقل والقائمة وتفاصيل الطعام وحالة الخروج.',
    //   overviewEn:
    //       'Four supplied screenshots document a food application concept with a home surface, navigation menu, detailed food view, and exit dialog. The final project name, release status, and Mohamed’s exact scope remain unconfirmed.',
    //   overviewAr:
    //       'توثق أربع صور تصورًا لتطبيق أطعمة يشمل الصفحة الرئيسية وقائمة التنقل وتفاصيل الطعام وحوار الخروج. ما زال الاسم النهائي وحالة الإصدار ونطاق عمل محمد غير مؤكد.',
    //   problemEn:
    //       'Food content needs strong imagery and direct navigation without hiding primary actions.',
    //   problemAr:
    //       'يحتاج محتوى الطعام إلى صور قوية وتنقل مباشر بدون إخفاء الإجراءات الأساسية.',
    //   roleEn:
    //       'The supplied screenshots confirm the visual Flutter work; exact implementation scope remains TODO.',
    //   roleAr:
    //       'تؤكد الصور المرفوعة العمل البصري بـ Flutter؛ وما زال نطاق التنفيذ الدقيق بحاجة إلى تأكيد.',
    //   challengeEn:
    //       'Keep image-led content readable within a compact mobile composition.',
    //   challengeAr:
    //       'الحفاظ على وضوح المحتوى المعتمد على الصور داخل تكوين موبايل مدمج.',
    //   solutionEn:
    //       'Large visual cards and a simple detail hierarchy keep the content immediately understandable.',
    //   solutionAr:
    //       'تحافظ الكروت البصرية الكبيرة وhierarchy التفاصيل البسيطة على وضوح المحتوى بسرعة.',
    //   statusEn: 'Visual concept supplied',
    //   statusAr: 'تصور بصري متاح',
    //   type: ProjectType.mobile,
    //   techStack: ['Flutter', 'Dart', 'Responsive UI'],
    //   featuresEn: [
    //     'Home feed',
    //     'Navigation menu',
    //     'Food details',
    //     'Exit confirmation'
    //   ],
    //   featuresAr: [
    //     'الصفحة الرئيسية',
    //     'قائمة التنقل',
    //     'تفاصيل الطعام',
    //     'تأكيد الخروج'
    //   ],
    //   highlightsEn: ['Image-led UI', 'Compact navigation', 'Detail view'],
    //   highlightsAr: ['واجهة تعتمد على الصور', 'تنقل مدمج', 'شاشة تفاصيل'],
    //   workflowEn: [
    //     'Browse the home feed',
    //     'Open the menu',
    //     'Review food details',
    //     'Exit safely'
    //   ],
    //   workflowAr: [
    //     'تصفح الصفحة الرئيسية',
    //     'فتح القائمة',
    //     'مراجعة تفاصيل الطعام',
    //     'الخروج بأمان'
    //   ],
    //   ownerConfirmedFeaturesEn: [],
    //   ownerConfirmedFeaturesAr: [],
    //   screenshotConfirmedFeaturesEn: ['Home, menu, details, and exit states'],
    //   screenshotConfirmedFeaturesAr: [
    //     'الرئيسية والقائمة والتفاصيل وحالة الخروج'
    //   ],
    //   screenshots: AppAssets.recastScreenshots,
    //   coverImage: AppAssets.recastCover,
    //   links: <ProjectLinkModel>[],
    //   isSourcePrivate: true,
    //   hasUnconfirmedDetails: true,
    // ),

//

//

    // ProjectModel(
    //   id: 'shop-smart',
    //   displayPriority: 12,
    //   platformOrder: 12,
    //   titleEn: 'Shop Smart',
    //   titleAr: 'Shop Smart',
    //   categoryEn: 'Shopping application presentation',
    //   categoryAr: 'عرض لتطبيق تسوق',
    //   shortDescriptionEn:
    //       'A supplied shopping-application presentation board linked to the additional APK, with the exact implementation scope still awaiting confirmation.',
    //   shortDescriptionAr:
    //       'لوحة عرض مرفوعة لتطبيق تسوق مرتبطة بالـ APK الإضافي، مع بقاء نطاق التنفيذ الدقيق بحاجة إلى تأكيد.',
    //   overviewEn:
    //       'Two unique presentation assets identify the previously unnamed additional APK as Shop Smart. The boards show a mobile shopping interface and a structured project presentation, but detailed workflows and technical ownership are not independently confirmed.',
    //   overviewAr:
    //       'تحدد لوحتا عرض فريدتان الـ APK الإضافي السابق باسم Shop Smart. تعرض اللوحات واجهة تسوق للموبايل وعرضًا منظمًا للمشروع، لكن تفاصيل المسارات والملكية التقنية غير مؤكدة بشكل مستقل.',
    //   problemEn:
    //       'The visible product story needs a clear storefront hierarchy within a concise portfolio presentation.',
    //   problemAr:
    //       'تحتاج قصة المنتج الظاهرة إلى hierarchy واضحة للمتجر داخل عرض بورتفوليو مختصر.',
    //   roleEn:
    //       'Exact implementation scope remains TODO; only the supplied visual presentation and APK link are published.',
    //   roleAr:
    //       'ما زال نطاق التنفيذ الدقيق بحاجة إلى تأكيد؛ المنشور هو العرض البصري المرفوع ورابط الـ APK فقط.',
    //   challengeEn:
    //       'Present a shopping concept without overstating details that are not documented.',
    //   challengeAr: 'عرض تصور تسوق بدون المبالغة في تفاصيل غير موثقة.',
    //   solutionEn:
    //       'The case study clearly separates screenshot-confirmed visuals from unconfirmed implementation details.',
    //   solutionAr:
    //       'تفصل دراسة الحالة بوضوح بين العناصر المؤكدة بصريًا وتفاصيل التنفيذ غير المؤكدة.',
    //   statusEn: 'APK available; scope confirmation needed',
    //   statusAr: 'APK متاح؛ نطاق المشروع يحتاج تأكيد',
    //   type: ProjectType.mobile,
    //   techStack: ['Flutter', 'Dart'],
    //   featuresEn: [
    //     'Mobile storefront presentation',
    //     'Shopping-oriented visual flow'
    //   ],
    //   featuresAr: ['عرض متجر للموبايل', 'مسار بصري موجه للتسوق'],
    //   highlightsEn: ['Identified APK', 'Presentation boards', 'Private source'],
    //   highlightsAr: ['APK محدد', 'لوحات عرض', 'كود خاص'],
    //   workflowEn: [
    //     'Open the storefront presentation',
    //     'Review the showcased shopping flow'
    //   ],
    //   workflowAr: ['فتح عرض المتجر', 'مراجعة مسار التسوق المعروض'],
    //   ownerConfirmedFeaturesEn: [],
    //   ownerConfirmedFeaturesAr: [],
    //   screenshotConfirmedFeaturesEn: ['Two supplied presentation boards'],
    //   screenshotConfirmedFeaturesAr: ['لوحتا عرض مرفوعتان'],
    //   screenshots: AppAssets.shopSmartScreenshots,
    //   coverImage: AppAssets.shopSmartCover,
    //   links: <ProjectLinkModel>[
    //     ProjectLinkModel(
    //         labelEn: 'Download APK',
    //         labelAr: 'تحميل APK',
    //         url: AppLinks.additionalApk,
    //         type: ProjectLinkType.apk)
    //   ],
    //   isSourcePrivate: true,
    //   hasUnconfirmedDetails: true,
    // ),
    ProjectModel(
      id: 'game-zone',
      displayPriority: 13,
      platformOrder: 1,
      titleEn: 'Game Zone — Gaming Console Service Center Management',
      titleAr: 'Game Zone — إدارة مركز صيانة أجهزة الألعاب',
      categoryEn: 'Gaming console repair operations',
      categoryAr: 'إدارة عمليات صيانة أجهزة الألعاب',
      shortDescriptionEn:
          'A Flutter Windows operations system for gaming-console repair centers, combining device intake, repair status management, inventory, customer web tracking, and professional receipt and sticker printing.',
      shortDescriptionAr:
          'نظام Flutter Windows لإدارة مركز صيانة أجهزة الألعاب، يجمع بين استلام الأجهزة ومتابعة مراحل الصيانة والمخزون وصفحة تتبع للعميل وطباعة الإيصالات والاستيكرات.',
      overviewEn:
          'Game Zone is a Flutter Windows application using Provider, GoRouter, SQLite through sqflite_common_ffi, shared_preferences, a local HTTP tracking server, a Vercel status-page publishing workflow, PDF/Printing, QR/barcode workflows, Bluetooth thermal printing, Windows raw printing, and XPrinter TSPL sticker printing.',
      overviewAr:
          'Game Zone هو تطبيق Flutter Windows يستخدم Provider وGoRouter وSQLite عبر sqflite_common_ffi وshared_preferences وخادم HTTP محلي للتتبع ومسار نشر صفحة الحالة على Vercel وPDF/Printing وQR وbarcode والطباعة الحرارية وWindows raw printing وطباعة استيكرات XPrinter TSPL.',
      problemEn:
          'A console service center needs one offline desktop workflow that links device intake, repair stages, inventory, warranty, customer tracking, and reliable printed handoff materials.',
      problemAr:
          'يحتاج مركز صيانة أجهزة الألعاب إلى workflow ديسكتوب محلي يربط استقبال الأجهزة ومراحل الإصلاح والمخزون والضمان وتتبع العميل والمستندات المطبوعة.',
      roleEn:
          'Built the Flutter Windows application and its visible device-intake, repair, inventory, tracking, backup, receipt, barcode, and sticker-printing workflows.',
      roleAr:
          'بناء تطبيق Flutter Windows ومسارات استقبال الأجهزة والإصلاح والمخزون والتتبع والنسخ الاحتياطي وطباعة الإيصال والـ barcode والاستيكر.',
      challengeEn:
          'Connect workshop operations with a clear customer tracking experience and dependable output across thermal, PDF, barcode, and native Windows printers.',
      challengeAr:
          'ربط عمليات الورشة بتجربة تتبع واضحة للعميل ومخرجات موثوقة عبر الطباعة الحرارية وPDF وbarcode وطابعات Windows.',
      solutionEn:
          'A staged local workflow records console-specific details, moves repairs through their lifecycle, manages stock and warranty data, publishes current-status tracking, and routes each print job to the appropriate output service.',
      solutionAr:
          'يسجل workflow محلي مرحلي تفاصيل أجهزة الألعاب وينقل الصيانة بين مراحلها ويدير المخزون والضمان وينشر تتبع الحالة الحالية ويوجه كل مهمة طباعة إلى الخدمة المناسبة.',
      statusEn: 'Private source • Desktop and web-tracking flow',
      statusAr: 'الكود خاص • مسار ديسكتوب وتتبع ويب',
      type: ProjectType.desktop,
      techStack: [
        'Flutter Windows',
        'Dart',
        'Provider',
        'GoRouter',
        'SQLite',
        'sqflite_common_ffi',
        'PDF / Printing',
        'QR / Barcode',
        'Bluetooth Printing',
        'Windows Raw Printing'
      ],
      featuresEn: [
        'Repair intake and lifecycle tracking',
        'PlayStation and Xbox device details',
        'Inventory, parts, warranty, and stock alerts',
        'Revenue dashboards and backup/restore',
        'Public QR customer tracking page',
        'Receipt, barcode, and device-sticker printing'
      ],
      featuresAr: [
        'استقبال الصيانة ومتابعة المراحل',
        'تفاصيل أجهزة PlayStation وXbox',
        'المخزون وقطع الغيار والضمان وتنبيهات المخزون',
        'لوحات الإيرادات والنسخ الاحتياطي',
        'صفحة تتبع عامة للعميل عبر QR',
        'طباعة الإيصال والـ barcode واستيكر الجهاز'
      ],
      highlightsEn: [
        'Offline Windows workflow',
        'Public current-status tracking',
        'Multi-format printing'
      ],
      highlightsAr: [
        'workflow محلي على Windows',
        'تتبع عام للحالة الحالية',
        'طباعة متعددة الصيغ'
      ],
      workflowEn: [
        'Register customer and console',
        'Record console and controller details',
        'Move the repair through its lifecycle',
        'Use parts and review warranty status',
        'Publish customer tracking status',
        'Print receipts and device labels'
      ],
      workflowAr: [
        'تسجيل العميل والجهاز',
        'تسجيل تفاصيل الجهاز واليد',
        'نقل الصيانة بين مراحلها',
        'استخدام قطع الغيار ومراجعة الضمان',
        'نشر حالة التتبع للعميل',
        'طباعة الإيصالات واستيكرات الأجهزة'
      ],
      ownerConfirmedFeaturesEn: [
        'Device registration',
        'Maintenance workflow',
        'Customer web tracking',
        'Receipt and device-label printing'
      ],
      ownerConfirmedFeaturesAr: [
        'تسجيل الأجهزة',
        'مسار الصيانة',
        'تتبع العميل عبر الويب',
        'طباعة الإيصال واستيكر الجهاز'
      ],
      screenshotConfirmedFeaturesEn: ['Inventory-management dashboard'],
      screenshotConfirmedFeaturesAr: ['لوحة إدارة المخزون'],
      screenshots: AppAssets.gameZoneScreenshots,
      coverImage: AppAssets.gameZoneCover,
      links: <ProjectLinkModel>[],
      isSourcePrivate: true,
      hasUnconfirmedDetails: false,
      defaultMediaKind: ProjectMediaKind.desktop,
    ),
    // ProjectModel(
    //   id: 'a2h-inventory-invoicing',
    //   displayPriority: 14,
    //   platformOrder: 11,
    //   titleEn: 'A2H — Inventory & Invoicing App',
    //   titleAr: 'A2H — تطبيق إدارة المخزون والفواتير',
    //   categoryEn: 'Mobile inventory and invoice management',
    //   categoryAr: 'إدارة المخزون والفواتير على الموبايل',
    //   shortDescriptionEn: 'A lightweight Flutter inventory and invoicing app for product management and fast sales and purchase invoices, with local persistence, stock validation, and printable Arabic PDFs.',
    //   shortDescriptionAr: 'تطبيق Flutter خفيف لإدارة الأصناف والمخزون وإنشاء فواتير البيع والشراء بسرعة، مع تخزين محلي والتحقق من الكميات وتوليد وطباعة فواتير PDF بالعربية.',
    //   overviewEn: 'A2H is a mobile Flutter application using Provider and Hive. It supports product CRUD with purchase, wholesale, and selling prices, stock quantities, sales and purchase invoices, customer details, discounts, delivery charges, live totals, Arabic PDF generation, local saving, and printing.',
    //   overviewAr: 'A2H هو تطبيق Flutter للموبايل يستخدم Provider وHive. يدعم إضافة وتعديل وحذف الأصناف وأسعار الشراء والجملة والبيع والكميات وفواتير البيع والشراء وبيانات العميل والخصومات ورسوم التوصيل والإجماليات المباشرة وتوليد وحفظ وطباعة PDF بالعربية.',
    //   problemEn: 'Small inventory workflows need product and invoice entry to remain fast and readable on a phone while preventing invalid sales quantities.',
    //   problemAr: 'تحتاج عمليات المخزون الصغيرة إلى إدخال سريع وواضح للأصناف والفواتير على الهاتف مع منع بيع كميات غير متاحة.',
    //   roleEn: 'Built the Flutter mobile inventory and invoicing workflow using Provider and Hive, including product management, stock validation, invoice totals, Arabic PDF generation, local saving, and printing.',
    //   roleAr: 'بناء workflow Flutter للموبايل لإدارة المخزون والفواتير باستخدام Provider وHive، ويشمل إدارة الأصناف والتحقق من الكمية وإجماليات الفاتورة وتوليد وحفظ وطباعة PDF بالعربية.',
    //   challengeEn: 'Fit product, party, quantity, pricing, discount, delivery, totals, and print actions into a compact mobile flow without sacrificing clarity.',
    //   challengeAr: 'تنظيم بيانات الصنف والطرف والكمية والأسعار والخصم والتوصيل والإجماليات والطباعة داخل مسار موبايل مدمج وواضح.',
    //   solutionEn: 'Focused forms, local Hive persistence, live total calculations, stock deduction with insufficient-stock validation, and dedicated PDF previews keep the workflow direct.',
    //   solutionAr: 'تحافظ النماذج المركزة والتخزين المحلي عبر Hive وحساب الإجماليات مباشرة وخصم المخزون مع التحقق من الكمية ومعاينات PDF المخصصة على بساطة المسار.',
    //   statusEn: 'Private source • Mobile workflow',
    //   statusAr: 'الكود خاص • مسار موبايل',
    //   type: ProjectType.mobile,
    //   techStack: ['Flutter', 'Dart', 'Provider', 'Hive', 'Hive Flutter', 'PDF', 'Printing', 'path_provider', 'flutter_screenutil'],
    //   featuresEn: ['Product CRUD and three price levels', 'Local Hive persistence', 'Sales and purchase invoices', 'Customer details, discounts, delivery, and live totals', 'Automatic sales stock deduction and validation', 'Arabic PDF generation, saving, and printing'],
    //   featuresAr: ['إضافة وتعديل وحذف الأصناف وثلاثة مستويات للأسعار', 'تخزين محلي عبر Hive', 'فواتير البيع والشراء', 'بيانات العميل والخصم والتوصيل والإجماليات المباشرة', 'خصم المخزون تلقائيًا والتحقق من الكمية عند البيع', 'توليد وحفظ وطباعة PDF بالعربية'],
    //   highlightsEn: ['Mobile-first invoice entry', 'Local stock validation', 'Printable Arabic PDFs'],
    //   highlightsAr: ['إدخال فواتير للموبايل', 'تحقق محلي من المخزون', 'PDF عربي قابل للطباعة'],
    //   workflowEn: ['Manage products and stock', 'Choose sales or purchase invoice', 'Add party and line-item details', 'Review live totals', 'Validate stock during sales', 'Save or print the Arabic PDF'],
    //   workflowAr: ['إدارة الأصناف والمخزون', 'اختيار فاتورة بيع أو شراء', 'إضافة بيانات الطرف والبنود', 'مراجعة الإجماليات مباشرة', 'التحقق من المخزون أثناء البيع', 'حفظ أو طباعة PDF بالعربية'],
    //   ownerConfirmedFeaturesEn: ['Inventory items and stock', 'Fast sales invoices', 'Fast purchase invoices'],
    //   ownerConfirmedFeaturesAr: ['الأصناف والمخزون', 'فواتير بيع سريعة', 'فواتير شراء سريعة'],
    //   screenshotConfirmedFeaturesEn: ['Operations and quick-invoice menus', 'Sales invoice and print preview', 'Purchase invoice and print preview'],
    //   screenshotConfirmedFeaturesAr: ['قوائم العمليات والفاتورة السريعة', 'فاتورة البيع ومعاينة الطباعة', 'فاتورة الشراء ومعاينة الطباعة'],
    //   screenshots: AppAssets.a2hScreenshots,
    //   coverImage: AppAssets.a2hCover,
    //   links: <ProjectLinkModel>[],
    //   isSourcePrivate: true,
    //   hasUnconfirmedDetails: false,
    //   defaultMediaKind: ProjectMediaKind.phone,
    // ),
    ProjectModel(
      id: 'rusheta-windows-app',
      displayPriority: 15,
      platformOrder: 3,
      titleEn: 'Rusheta Windows',
      titleAr: 'Rusheta Windows',
      categoryEn: 'Prescription and printing workflow',
      categoryAr: 'إدارة الروشتات والطباعة',
      shortDescriptionEn:
          'A Flutter Windows application for patient and prescription records, local storage, PDF generation, print previews, and reports.',
      shortDescriptionAr:
          'تطبيق Flutter لـ Windows لإدارة بيانات المرضى والروشتات والتخزين المحلي وإنشاء PDF ومعاينة الطباعة والتقارير.',
      overviewEn:
          'The CV confirms Provider, sqflite, shared_preferences, PDF generation, and printing. Ten unique screenshots document patient entry, prescription forms, medicine items, records, dark mode, print preview, PDF output, and report layouts.',
      overviewAr:
          'تؤكد السيرة الذاتية استخدام Provider وsqflite وshared_preferences وإنشاء PDF والطباعة. توثق عشر صور فريدة إدخال المريض ونماذج الروشتة والأدوية والسجلات والوضع الداكن ومعاينة الطباعة ومخرجات PDF والتقارير.',
      problemEn:
          'Prescription work needs fast local entry and dependable printable output without losing patient context.',
      problemAr:
          'يحتاج عمل الروشتات إلى إدخال محلي سريع ومخرجات مطبوعة موثوقة بدون فقدان سياق المريض.',
      roleEn:
          'Built the Flutter Windows interface, Provider state flow, local-data workflow, PDF generation, and printing surfaces.',
      roleAr:
          'بناء واجهة Flutter لـ Windows وتدفق state بـ Provider ومسار البيانات المحلية وإنشاء PDF وواجهات الطباعة.',
      challengeEn:
          'Keep patient, medicine, and print data aligned across entry, records, and generated documents.',
      challengeAr:
          'الحفاظ على تطابق بيانات المريض والأدوية والطباعة بين الإدخال والسجلات والمستندات المولدة.',
      solutionEn:
          'Structured forms feed local records and reusable document layouts for consistent previews and printable reports.',
      solutionAr:
          'تغذي النماذج المنظمة السجلات المحلية وقوالب مستندات قابلة لإعادة الاستخدام للحصول على معاينات وتقارير متسقة.',
      statusEn: 'Downloadable Windows archive available',
      statusAr: 'ملف Windows قابل للتحميل',
      type: ProjectType.desktop,
      techStack: [
        'Flutter',
        'Dart',
        'Provider',
        'sqflite',
        'shared_preferences',
        'PDF Generation',
        'Printing'
      ],
      featuresEn: [
        'Patient records',
        'Prescription forms',
        'Medicine items',
        'Local storage',
        'PDF generation',
        'Printing and reports'
      ],
      featuresAr: [
        'سجلات المرضى',
        'نماذج الروشتات',
        'عناصر الأدوية',
        'التخزين المحلي',
        'إنشاء PDF',
        'الطباعة والتقارير'
      ],
      highlightsEn: [
        'Local-first desktop',
        'PDF output',
        'Prescription records'
      ],
      highlightsAr: ['ديسكتوب محلي', 'مخرجات PDF', 'سجلات الروشتات'],
      workflowEn: [
        'Register a patient',
        'Create a prescription',
        'Add medicine items',
        'Save and review records',
        'Preview print output',
        'Generate the report'
      ],
      workflowAr: [
        'تسجيل مريض',
        'إنشاء روشتة',
        'إضافة الأدوية',
        'حفظ ومراجعة السجلات',
        'معاينة الطباعة',
        'إنشاء التقرير'
      ],
      ownerConfirmedFeaturesEn: [
        'Provider, sqflite, and shared_preferences',
        'PDF generation and printing'
      ],
      ownerConfirmedFeaturesAr: [
        'Provider وsqflite وshared_preferences',
        'إنشاء PDF والطباعة'
      ],
      screenshotConfirmedFeaturesEn: [
        'Patient and prescription forms',
        'Medicine items and records',
        'Dark records view',
        'Print, PDF, and report outputs'
      ],
      screenshotConfirmedFeaturesAr: [
        'نماذج المريض والروشتة',
        'الأدوية والسجلات',
        'السجلات بالوضع الداكن',
        'مخرجات الطباعة وPDF والتقارير'
      ],
      screenshots: AppAssets.rushetaScreenshots,
      coverImage: AppAssets.rushetaCover,
      links: <ProjectLinkModel>[
        ProjectLinkModel(
            labelEn: 'Download Windows File',
            labelAr: 'تحميل ملف Windows',
            url: AppLinks.rushetaRar,
            type: ProjectLinkType.file)
      ],
      isSourcePrivate: true,
    ),
    ProjectModel(
      id: 'ahla-beauty',
      displayPriority: 16,
      platformOrder: 1,
      titleEn: 'Ahla Beauty Storefront',
      titleAr: 'متجر Ahla Beauty',
      categoryEn: 'Responsive beauty storefront',
      categoryAr: 'متجر تجميل responsive',
      shortDescriptionEn:
          'A live beauty storefront with desktop and mobile product discovery, details, cart, checkout, account, payment, success, invoice, and tracking views.',
      shortDescriptionAr:
          'متجر تجميل مباشر بواجهات ديسكتوب وموبايل تشمل اكتشاف المنتجات والتفاصيل والسلة وcheckout والحساب والدفع والنجاح والفاتورة والتتبع.',
      overviewEn:
          'Forty-two unique responsive screenshots document the complete Ahla Beauty storefront across desktop and mobile: discovery, categories, products, cart, checkout, address, payment, success, account, orders, invoice, and tracking.',
      overviewAr:
          'توثق اثنتان وأربعون صورة responsive فريدة متجر Ahla Beauty كاملًا على الديسكتوب والموبايل: الاكتشاف والتصنيفات والمنتجات والسلة وcheckout والعنوان والدفع والنجاح والحساب والطلبات والفاتورة والتتبع.',
      problemEn:
          'A visual beauty storefront must preserve product focus while keeping a long checkout and account journey consistent across desktop and mobile.',
      problemAr:
          'يجب أن يحافظ متجر التجميل البصري على تركيز المنتج مع اتساق رحلة checkout والحساب الطويلة على الديسكتوب والموبايل.',
      roleEn:
          'Built the responsive Flutter web presentation and visible storefront, cart, checkout, account, and order workflows. Exact backend ownership is not documented.',
      roleAr:
          'بناء عرض Flutter Web responsive ومسارات المتجر والسلة وcheckout والحساب والطلبات الظاهرة. ملكية الـ backend غير موثقة.',
      challengeEn:
          'Maintain visual richness without sacrificing checkout clarity or responsive parity.',
      challengeAr:
          'الحفاظ على الثراء البصري بدون التضحية بوضوح checkout أو التكافؤ بين أحجام الشاشات.',
      solutionEn:
          'A consistent product system and responsive layout patterns carry the same hierarchy from desktop grids to mobile checkout and tracking views.',
      solutionAr:
          'ينقل نظام منتجات متسق وأنماط layout responsive نفس الـ hierarchy من شبكات الديسكتوب إلى checkout والتتبع على الموبايل.',
      statusEn: 'Live website',
      statusAr: 'موقع مباشر',
      type: ProjectType.web,
      techStack: ['Flutter Web', 'Dart', 'Responsive UI'],
      featuresEn: [
        'Desktop and mobile storefronts',
        'Product catalog and details',
        'Cart and checkout',
        'Address and payment flows',
        'Account and orders',
        'Invoice and order tracking'
      ],
      featuresAr: [
        'متجر ديسكتوب وموبايل',
        'كتالوج وتفاصيل المنتجات',
        'السلة وCheckout',
        'العنوان والدفع',
        'الحساب والطلبات',
        'الفاتورة وتتبع الطلب'
      ],
      highlightsEn: [
        '42-screen responsive set',
        'Live storefront',
        'Full checkout journey'
      ],
      highlightsAr: ['42 شاشة responsive', 'متجر مباشر', 'رحلة Checkout كاملة'],
      workflowEn: [
        'Discover products',
        'Open product details',
        'Build the cart',
        'Enter checkout and address',
        'Choose payment',
        'Review success, invoice, and tracking'
      ],
      workflowAr: [
        'اكتشاف المنتجات',
        'فتح تفاصيل المنتج',
        'تجهيز السلة',
        'إدخال Checkout والعنوان',
        'اختيار الدفع',
        'مراجعة النجاح والفاتورة والتتبع'
      ],
      ownerConfirmedFeaturesEn: [],
      ownerConfirmedFeaturesAr: [],
      screenshotConfirmedFeaturesEn: [
        'Desktop catalog and checkout',
        'Mobile product and cart flows',
        'Address, payment, and success',
        'Account, invoice, and tracking'
      ],
      screenshotConfirmedFeaturesAr: [
        'كتالوج وCheckout على الديسكتوب',
        'المنتجات والسلة على الموبايل',
        'العنوان والدفع والنجاح',
        'الحساب والفاتورة والتتبع'
      ],
      screenshots: AppAssets.ahlaBeautyScreenshots,
      coverImage: AppAssets.ahlaBeautyCover,
      links: <ProjectLinkModel>[
        ProjectLinkModel(
            labelEn: 'Visit Website',
            labelAr: 'زيارة الموقع',
            url: AppLinks.ahlaBeautyWebsite,
            type: ProjectLinkType.website)
      ],
      isSourcePrivate: true,
      hasUnconfirmedDetails: true,
    ),
    ProjectModel(
      id: 'gypsum-home',
      displayPriority: 17,
      platformOrder: 2,
      titleEn: 'Gypsum Home',
      titleAr: 'Gypsum Home',
      categoryEn: 'Home-decoration services website',
      categoryAr: 'موقع خدمات الجبس والديكور',
      shortDescriptionEn:
          'A live responsive website for gypsum and home-decoration services with projects, team, services, process, benefits, FAQ, contact, and CTA sections.',
      shortDescriptionAr:
          'موقع responsive مباشر لخدمات الجبس والديكور يضم المشاريع والفريق والخدمات وطريقة العمل والمميزات والأسئلة والتواصل وCTA.',
      overviewEn:
          'Twenty-eight desktop and mobile screenshots document the complete Gypsum Home website, including hero, about, projects, team, services, process, benefits, FAQ, contact, call-to-action, and footer views.',
      overviewAr:
          'توثق ثمان وعشرون صورة للديسكتوب والموبايل موقع Gypsum Home كاملًا، بما يشمل الـ hero وعن الشركة والمشاريع والفريق والخدمات وطريقة العمل والمميزات والأسئلة والتواصل وCTA والـ footer.',
      problemEn:
          'A service website must explain capability and process clearly while remaining easy to scan on small screens.',
      problemAr:
          'يجب أن يشرح موقع الخدمات القدرات وطريقة العمل بوضوح مع سهولة القراءة على الشاشات الصغيرة.',
      roleEn:
          'Built the responsive Flutter web presentation and the visible service, project, process, FAQ, and contact sections. Exact deployment and backend scope are not documented.',
      roleAr:
          'بناء عرض Flutter Web responsive وأقسام الخدمات والمشاريع وطريقة العمل والأسئلة والتواصل الظاهرة. نطاق النشر والـ backend غير موثق.',
      challengeEn:
          'Translate a long service narrative into clear sections that remain coherent from desktop to mobile.',
      challengeAr:
          'تحويل قصة خدمة طويلة إلى أقسام واضحة ومتسقة من الديسكتوب إلى الموبايل.',
      solutionEn:
          'Section-based storytelling, repeated calls to action, and responsive content stacking keep the business message easy to follow.',
      solutionAr:
          'تحافظ القصة المقسمة إلى أقسام وCTA المتكرر وتكديس المحتوى responsive على سهولة متابعة رسالة النشاط.',
      statusEn: 'Live website',
      statusAr: 'موقع مباشر',
      type: ProjectType.web,
      techStack: ['Flutter Web', 'Dart', 'Responsive UI'],
      featuresEn: [
        'Service presentation',
        'Project portfolio',
        'Team section',
        'Process and benefits',
        'FAQ',
        'Contact and CTA'
      ],
      featuresAr: [
        'عرض الخدمات',
        'معرض المشاريع',
        'قسم الفريق',
        'العملية والمميزات',
        'الأسئلة الشائعة',
        'التواصل وCTA'
      ],
      highlightsEn: [
        '28 responsive screens',
        'Service storytelling',
        'Live website'
      ],
      highlightsAr: ['28 شاشة responsive', 'قصة خدمات واضحة', 'موقع مباشر'],
      workflowEn: [
        'Understand the service',
        'Review projects and team',
        'Explore services',
        'Follow the process',
        'Read benefits and FAQs',
        'Contact the business'
      ],
      workflowAr: [
        'فهم الخدمة',
        'مراجعة المشاريع والفريق',
        'استكشاف الخدمات',
        'متابعة طريقة العمل',
        'قراءة المميزات والأسئلة',
        'التواصل مع النشاط'
      ],
      ownerConfirmedFeaturesEn: [],
      ownerConfirmedFeaturesAr: [],
      screenshotConfirmedFeaturesEn: [
        'Desktop hero through footer',
        'Mobile navigation and service sections',
        'Process, benefits, FAQ, and CTA'
      ],
      screenshotConfirmedFeaturesAr: [
        'من Hero إلى Footer على الديسكتوب',
        'التنقل وأقسام الخدمات على الموبايل',
        'العملية والمميزات والأسئلة وCTA'
      ],
      screenshots: AppAssets.gypsumHomeScreenshots,
      coverImage: AppAssets.gypsumHomeCover,
      links: <ProjectLinkModel>[
        ProjectLinkModel(
            labelEn: 'Visit Website',
            labelAr: 'زيارة الموقع',
            url: AppLinks.gypsumHomeWebsite,
            type: ProjectLinkType.website)
      ],
      isSourcePrivate: true,
      hasUnconfirmedDetails: true,
    ),
    ProjectModel(
      id: 'al-raqi-mobile',
      displayPriority: 18,
      platformOrder: 3,
      titleEn: 'Al Raqi Mobile — Repair Center Management System',
      titleAr: 'الراقي موبايل — نظام إدارة مركز الصيانة',
      categoryEn: 'Repair center management and business operations',
      categoryAr: 'إدارة مركز الصيانة والعمليات',
      shortDescriptionEn:
          'A cross-platform repair-center operations platform for customers, devices, technicians, inventory, repair stages, financial workflows, public tracking, communication, and printing.',
      shortDescriptionAr:
          'منصة متعددة المنصات لإدارة مركز صيانة الهواتف، تشمل العملاء والأجهزة والفنيين والمخزون ومراحل الصيانة والتسويات المالية والتتبع العام والتواصل والطباعة.',
      overviewEn:
          'Al Raqi Mobile is a Flutter repair-center management solution using Provider, GoRouter, Supabase Auth, Database, and Storage, repository and service layers, secure local storage, QR/barcode workflows, Bluetooth thermal printing, PDF/Printing, HTTP, and Gemini-assisted image analysis.',
      overviewAr:
          'الراقي موبايل هو حل Flutter لإدارة مراكز الصيانة باستخدام Provider وGoRouter وSupabase Auth وDatabase وStorage وطبقات repository والخدمات والتخزين المحلي الآمن ومسارات QR وbarcode والطباعة الحرارية وPDF وHTTP وتحليل الصور بمساعدة Gemini.',
      problemEn:
          'Repair operations require one role-aware workflow connecting customer/device intake, technicians, parts, inventory, finance, communication, public tracking, and printed handoff documents.',
      problemAr:
          'تحتاج عمليات الصيانة إلى مسار واحد بصلاحيات واضحة يربط استقبال العملاء والأجهزة والفنيين وقطع الغيار والمخزون والمالية والتواصل والتتبع العام والمستندات المطبوعة.',
      roleEn:
          'Developed the cross-platform Flutter solution with role-based access, repository/service layers, Supabase integration, operational workflows, QR tracking, customer messaging, image attachments, AI-assisted device identification, and Bluetooth/PDF printing.',
      roleAr:
          'تطوير حل Flutter متعدد المنصات بصلاحيات حسب الدور وطبقات repository والخدمات وتكامل Supabase ومسارات التشغيل وتتبع QR والتواصل مع العملاء ومرفقات الصور والتعرف على الجهاز بمساعدة AI والطباعة الحرارية وPDF.',
      challengeEn:
          'Keep a data-dense repair lifecycle clear across roles, workflows, and screen sizes without overwhelming operators.',
      challengeAr:
          'الحفاظ على وضوح دورة صيانة كثيفة البيانات عبر الصلاحيات ومسارات العمل وأحجام الشاشات دون إرهاق المستخدمين.',
      solutionEn:
          'Role-aware modules, focused intake and case flows, summary dashboards, repository-backed data access, public QR tracking, and dedicated print/report services keep the workflow organized.',
      solutionAr:
          'تحافظ الوحدات حسب الصلاحية ومسارات الاستقبال والحالات ولوحات الملخص والوصول للبيانات عبر repository والتتبع العام بـ QR وخدمات الطباعة والتقارير على تنظيم العمل.',
      statusEn: 'Private source • Showcase available',
      statusAr: 'الكود خاص • العرض متاح',
      type: ProjectType.web,
      techStack: [
        'Flutter',
        'Dart',
        'Provider',
        'GoRouter',
        'Supabase',
        'Repository Pattern',
        'Secure Storage',
        'QR / Barcode',
        'Bluetooth Printing',
        'PDF / Printing'
      ],
      featuresEn: [
        'Role-based access',
        'Customer and device intake',
        'Repair and parts tracking',
        'Technician and inventory management',
        'Financial adjustments and audit logs',
        'Public QR tracking and customer messaging'
      ],
      featuresAr: [
        'صلاحيات حسب الدور',
        'استقبال العملاء والأجهزة',
        'تتبع الإصلاح وقطع الغيار',
        'إدارة الفنيين والمخزون',
        'التسويات المالية وسجلات التدقيق',
        'التتبع العام بـ QR والتواصل مع العملاء'
      ],
      highlightsEn: [
        'End-to-end repair operations',
        'Public tracking and communication',
        'Printing and reporting workflows'
      ],
      highlightsAr: [
        'عمليات صيانة متكاملة',
        'تتبع عام وتواصل',
        'مسارات طباعة وتقارير'
      ],
      workflowEn: [
        'Register customer and device',
        'Track repair lifecycle',
        'Assign technicians and parts',
        'Review inventory and financial actions',
        'Share public QR tracking',
        'Print receipts and reports'
      ],
      workflowAr: [
        'تسجيل العميل والجهاز',
        'متابعة دورة الإصلاح',
        'تعيين الفنيين وقطع الغيار',
        'مراجعة المخزون والإجراءات المالية',
        'مشاركة التتبع العام بـ QR',
        'طباعة الإيصالات والتقارير'
      ],
      ownerConfirmedFeaturesEn: [
        'Role-based access',
        'Customer/device intake and multi-device batches',
        'Repair, parts, technician, inventory, and returned-device workflows',
        'Financial adjustments, audit logs, and end-of-day reports',
        'QR tracking, messaging, attachments, AI-assisted identification, and printing'
      ],
      ownerConfirmedFeaturesAr: [
        'صلاحيات حسب الدور',
        'استقبال العملاء والأجهزة والحزم متعددة الأجهزة',
        'مسارات الإصلاح وقطع الغيار والفنيين والمخزون والأجهزة المرتجعة',
        'التسويات المالية وسجلات التدقيق وتقارير نهاية اليوم',
        'تتبع QR والتواصل والمرفقات والتعرف بمساعدة AI والطباعة'
      ],
      screenshotConfirmedFeaturesEn: [
        'Secure entry and repair-record dashboards',
        'Customer profiles and single- or multi-device intake',
        'Repair cases, QR reports, technicians, and returned devices',
        'Customer messaging, inventory, end-of-day reporting, and backup tools',
        'Public Web tracking and delivery confirmation'
      ],
      screenshotConfirmedFeaturesAr: [
        'دخول آمن ولوحات سجلات الصيانة',
        'ملفات العملاء واستقبال جهاز واحد أو عدة أجهزة',
        'حالات الصيانة وتقارير QR والفنيون والأجهزة المرتجعة',
        'رسائل العملاء والجرد وتقرير نهاية اليوم والنسخ الاحتياطي',
        'التتبع العام عبر الويب وتأكيد التسليم'
      ],
      screenshots: const <String>[],
      mediaItems: AuthoritativeMediaData.alRaqiMobile,
      coverImage: AppAssets.alRaqiMobileCover,
      links: <ProjectLinkModel>[],
      isSourcePrivate: true,
      hasUnconfirmedDetails: false,
      defaultMediaKind: ProjectMediaKind.desktop,
      showApkButton: false,
      showcaseType: ProjectShowcaseType.video,
      showcaseVideoPath: AppAssets.alRaqiMobileShowcaseVideo,
      showcasePosterPath: AppAssets.alRaqiMobileShowcasePoster,
    ),
  ];

  static List<ProjectModel> get projects => orderedProjects;

  static List<ProjectModel> get orderedProjects {
    final result = List<ProjectModel>.of(_items)
      ..sort((a, b) => a.displayPriority.compareTo(b.displayPriority));
    return List<ProjectModel>.unmodifiable(result);
  }

  static List<ProjectModel> _byType(ProjectType type) {
    final result = _items.where((project) => project.type == type).toList()
      ..sort((a, b) => a.platformOrder.compareTo(b.platformOrder));
    return List<ProjectModel>.unmodifiable(result);
  }

  static List<ProjectModel> get mobileProjects => _byType(ProjectType.mobile);
  static List<ProjectModel> get windowsProjects => _byType(ProjectType.desktop);
  static List<ProjectModel> get webProjects => _byType(ProjectType.web);

  static List<ProjectModel> get featuredProjects {
    final result = _items.where((project) => project.isFeatured).toList()
      ..sort((a, b) => a.featuredPriority!.compareTo(b.featuredPriority!));
    return List<ProjectModel>.unmodifiable(result);
  }

  static List<ProjectModel> get featured => featuredProjects;

  static List<ProjectModel> get moreMobileProjects =>
      List<ProjectModel>.unmodifiable(mobileProjects.skip(6));

  static List<ProjectModel> get more => List<ProjectModel>.unmodifiable(
        <ProjectModel>[
          ...moreMobileProjects,
          ...windowsProjects,
          ...webProjects,
        ],
      );

  static const List<String> flutterAppLabIds = <String>[
    'dr-yasmeen-pharmacy',
    'noga-mobile',
    'sharks-academy',
    'targetx-app',
    'farah-services',
    'trelixi-learning-app',
    'game-zone',
    'a2h-inventory-invoicing',
  ];

  static List<ProjectModel> get flutterAppLabProjects =>
      List<ProjectModel>.unmodifiable(
        flutterAppLabIds.map(byId).whereType<ProjectModel>(),
      );

  static ProjectModel? byId(String? id) {
    final normalized = id?.trim().toLowerCase();
    if (normalized == null || normalized.isEmpty) return null;
    for (final project in _items) {
      if (project.id == normalized) return project;
    }
    return null;
  }

  static int indexOf(ProjectModel project) =>
      orderedProjects.indexWhere((item) => item.id == project.id);

  static ProjectModel? nextAfter(ProjectModel project) {
    final items = orderedProjects;
    if (items.isEmpty) return null;
    final currentIndex = items.indexWhere((item) => item.id == project.id);
    if (currentIndex < 0) return null;
    return items[(currentIndex + 1) % items.length];
  }

  static ProjectModel? previousBefore(ProjectModel project) {
    final items = orderedProjects;
    if (items.isEmpty) return null;
    final currentIndex = items.indexWhere((item) => item.id == project.id);
    if (currentIndex < 0) return null;
    return items[(currentIndex - 1 + items.length) % items.length];
  }

  static List<String> get ids =>
      List<String>.unmodifiable(_items.map((project) => project.id));

  static List<String> get duplicateIds {
    final seen = <String>{};
    final duplicates = <String>{};
    for (final project in _items) {
      if (!seen.add(project.id)) duplicates.add(project.id);
    }
    return List<String>.unmodifiable(duplicates);
  }
}
