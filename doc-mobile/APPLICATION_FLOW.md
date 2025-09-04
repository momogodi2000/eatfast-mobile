# EatFast Mobile — Complete Application Flow and Improvement Plan

This document maps the application’s end-to-end user journeys, role-based flows, core features, navigation routes, state lifecycles, and targeted improvements.

## Actors (User Types)
- Customer (end user ordering food)
- Restaurant Owner (manages a restaurant)
- Driver (delivery agent)
- Admin (platform operator)

## Global App Flow (First-run to Home)
1) Launch → `Splash` (`/splash`)
2) Legal → `Terms & Conditions` (`/terms`)
3) Onboarding → `Onboarding` (`/onboarding`) → `Welcome` (`/welcome`)
4) Authentication → `Login` (`/login`) or `Register` (`/register`), `Forgot Password` (`/forgot-password`), `OTP Verification` (`/otp-verification?phone=...`)
5) Home → `Home` (`/home`) with navigation to discovery, profile, cart, orders, settings
6) Language → `Language Settings` (`/language-settings`) available from Settings/Profile

Notes
- i18n: English/French with runtime switch and persistence
- Security: device fingerprinting, secure storage, biometric auth
- Navigation: GoRouter central routing with `RouteNames`

## Navigation Map (Routes → Screens)
- `/splash` → SplashScreen
- `/terms` → TermsConditionsScreen
- `/onboarding` → OnboardingScreen
- `/welcome` → WelcomeScreen
- `/login` → LoginScreen
- `/register` → RegisterScreen
- `/forgot-password` → ForgotPasswordScreen
- `/otp-verification` → OtpVerificationScreen (query param: phone)
- `/about-us` → AboutUsScreen
- `/our-team` → Coming soon placeholder
- `/contact-us` → Coming soon placeholder
- `/home` → HomeScreen
- `/restaurants` → RestaurantListScreen (supports filters/search)
- `/restaurants/:restaurantId` → RestaurantDetailScreen
- `/cart` → CartScreen
- `/checkout` → CheckoutScreen
- `/order-tracking/:orderId` → OrderTrackingScreen
- `/order-history` → OrderHistoryScreen
- `/profile` → ProfileScreen
- `/edit-profile` → Coming soon placeholder
- `/settings` → Coming soon placeholder
- `/language-settings` → LanguageSettingsScreen

Note: Role-specific dashboards (admin/owner/driver) are implemented under `lib/features/*` but not yet wired in `main.dart` routes (consider adding guarded routes per role).

## Core Domain Lifecycles

Order Lifecycle (Customer perspective)
- Cart Building → Checkout Initiated → Payment Initiated → Order Placed (Pending)
- Restaurant Accepts → Preparing → Ready for Pickup
- Driver: Assigned/Accepted → Picked Up → Out for Delivery → Delivered
- Post-Delivery → Rating/Review → Support/Refund if needed
- Exceptional → Canceled (by user/restaurant/admin) with refunds/notifications

Authentication Lifecycle
- Register (email/phone, Google Sign-In) → Verify (OTP/email) → Login → Token stored
- Optional biometric enablement
- Session refresh/expiry → Re-auth for sensitive actions (payment, account deletion)

Address/Payment Lifecycle
- Add/Edit/Delete address with maps + geocoding → Set default
- Add payment method (Mobile Money/Stripe/Cash) → Set default → Use at checkout

Notification Lifecycle
- Subscribe (push) → Receive: promotions, order status, security alerts → Preference controls per channel (push/SMS/email/WhatsApp)

## Customer Flows (End-to-end)

Discovery & Ordering
1) Home → Restaurants (`/restaurants`) → Search/filter by cuisine, rating, fees, delivery time
2) Restaurant Detail (`/restaurants/:id`) → Browse menu categories → Item detail/options
3) Add to Cart → Cart (`/cart`) → Edit quantities/notes → Handle cross-restaurant cart rules
4) Checkout (`/checkout`) → Select delivery address/payment → Place Order
5) Order Tracking (`/order-tracking/:orderId`) → Live status updates → Delivery confirmation
6) Order History (`/order-history`) → Reorder → Rate/Review

Profile & Settings
- Profile (`/profile`) → Edit details (coming soon route for edit) → Avatar upload/crop
- Addresses → CRUD + set default
- Payments → CRUD + set default (Mobile Money, Orange Money, EU Mobile, Cash)
- Notifications → Channel toggles
- Security → Change password, 2FA, biometric, account deletion
- Language → `Language Settings`

Support & Company
- About Us (ready), Our Team (placeholder), Contact Us (placeholder), Careers (route name exists)

## Restaurant Owner Flows

Entry & Overview
- Login as owner → Owner Dashboard (see `lib/features/restaurant_owner/*`)
- View KPIs (orders today, revenue, avg prep time, ratings)

Live Orders
- Live Orders board → Filter by status
- See order details → Update status (accept/reject, preparing, ready)

Menu Management
- CRUD Menu Items, categories, prices, availability
- Mark out-of-stock, manage options/modifiers, photos

Analytics
- Popular items, hourly trends, conversion, cancellations
- Performance charts, period filters

Ops
- Hours/closures, delivery fees, promotions/coupons, payout accounts

Note: Add role-guarded routes and navigation entries for owner.

## Driver Flows

Availability & Intake
- Login as driver → Driver Dashboard
- Set status (online/offline) → See available orders nearby
- Accept order → Navigate to restaurant → Pickup confirmation (photo/OTP)

Delivery
- Navigate to customer → Contact options → Delivery confirmation (OTP/signature/photo)
- Update statuses → Earnings summary

Safety & Compliance
- KYC/vehicle docs, periodic checks, selfie liveness (optional future)

Note: Add role-guarded routes and background location permissions.

## Admin Flows

Monitoring & Control
- Admin Dashboard → System health, metrics, alerts, recent activities
- User management (customers, owners, drivers): verify/suspend/reset
- Restaurant approvals, menu moderation
- Financial oversight: settlements, refunds, disputes
- Security center: fraud rules, device anomaly flags

Note: Add role-guarded routes and permission matrix.

## Data and Integration Notes
- Networking via Dio, Result<T,E> error handling, repository pattern
- Real-time: socket.io client planned/used for order updates (wire with backend when ready)
- Push: Firebase Messaging + local notifications
- Payments: Mobile Money (MTN/Orange/EU), Stripe; ensure aggregator for Cameroon (e.g., CinetPay/Flutterwave) if needed

## Gaps and Quick Wins (Screens/Routes)
- Our Team (`/our-team`), Contact Us (`/contact-us`), Edit Profile (`/edit-profile`), Settings (`/settings`) are placeholders → implement
- Role dashboards (admin/owner/driver) exist in code; add guarded routes and entry points
- Add route guards in GoRouter (auth + role) and deep links for order tracking
- Ensure one-restaurant-per-order rule UX in cart (if not already enforced)

## Improvements (Prioritized)

High Impact, Low Effort
- Route Guards: auth + role-based redirects; splash/onboarding login gating
- Promotions: promo codes at checkout; simple referral code tracking
- Ratings & Reviews: item/restaurant reviews with photos and moderation
- Tipping: tip selection in checkout and after delivery
- Reorder & Favorites: quick add and favorite restaurants/items
- Scheduled Orders: order ahead time slot at checkout
- Cancel/Refund UX: clear policies and flows with automated notifications

Medium Effort, High Value
- Real-time Chat: customer–driver–support via socket, with push fallbacks
- Loyalty Program: points, tiers, perks; wallet balance; birthday rewards
- Advanced Search/Filters: dietary tags, open now, min order, free delivery
- Address Enhancements: precise drop-off notes, saved building photos/pins
- Performance: list virtualization, image CDN params, pagination, shimmer states everywhere
- Offline Resilience: retry queue for POSTs, optimistic UI for cart/profile

Operational/Role Enhancements
- Owner: inventory/out-of-stock automation, promo campaigns, holiday hours
- Driver: route optimization, heatmaps/demand forecast, shift scheduling, earnings breakdown with fees
- Admin: dispute workflows, refund/chargeback tooling, content moderation backlog

Security & Compliance
- Re-auth for sensitive actions (payment, delete account)
- Token rotation/refresh hardening; device binding and anomaly detection
- Privacy center: data export, delete request, tracking consent toggles

Payments (Cameroon Focus)
- Integrate aggregator (CinetPay/Flutterwave) for Mobile Money breadth and reliability
- Webhooks-driven order confirmation, idempotency keys, recon tooling
- Partial refunds, split tips, surcharge handling

Analytics & Growth
- Event tracking (orders, add-to-cart, search, retention) with funnels and cohorts
- A/B testing framework (feature flags) for pricing/UX experiments
- Marketing automation hooks (promo campaigns, win-backs)

Accessibility & i18n
- Larger text and contrast modes, TalkBack/VoiceOver audits
- Full currency/locale formatting (XAF), date/time localization; content QA in FR/EN

## Access Control Matrix (Summary)
- Customer: discovery, cart/checkout, tracking, profile, settings
- Owner: his restaurant(s): orders, menu, analytics, promos
- Driver: deliveries assigned/available, navigation, earnings
- Admin: platform metrics, user/restaurant management, finance, security

Implement with a simple `Role` enum and guarded routes using GoRouter redirect and providers.

## Testing Recommendations
- Integration tests for: signup/login, add-to-cart→checkout→tracking, reorder, address/payment CRUD
- Widget tests: restaurant list filters, cart mutations, checkout validations
- Role tests: owner live orders board transitions; driver accept→deliver flow
- Golden tests for critical screens (home, restaurant detail, checkout)

## Next Steps (Actionable To-do)
1) Add role-based route guards and dashboards to router (admin/owner/driver)
2) Replace placeholder screens (our team, contact, edit profile, settings)
3) Implement promo codes, tips, and ratings/reviews
4) Introduce scheduled orders and favorites
5) Wire real-time chat and stricter order socket updates
6) Integrate Mobile Money aggregator and webhook confirmation
7) Add re-auth on sensitive paths, and a privacy center
8) Add analytics events + funnels; basic feature flags for A/B tests
9) Improve offline resilience and pagination in lists
10) Expand tests to cover the full happy paths and 1–2 edge cases each
