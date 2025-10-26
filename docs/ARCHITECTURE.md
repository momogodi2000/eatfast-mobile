# EatFast Mobile App - Architecture

## Overview

EatFast is a Flutter-based food delivery application designed for the Cameroon market. The app follows Clean Architecture principles with a modular structure.

## Architecture Layers

### 1. Presentation Layer
- **Screens**: UI screens for different user flows
- **Widgets**: Reusable UI components
- **Providers**: State management using Riverpod

### 2. Domain Layer
- **Models**: Business entities and data models
- **Services**: Business logic and use cases
- **Repositories**: Abstract interfaces for data access

### 3. Data Layer
- **Services**: API calls and external data sources
- **Repositories**: Concrete implementations of domain repositories
- **Models**: Data transfer objects (DTOs)

## Module Structure

```
lib/
├── core/                    # Core utilities and services
├── shared/                  # Shared components and services
│   ├── config/             # App configuration
│   ├── services/           # Business services
│   ├── themes/             # UI themes and design tokens
│   └── widgets/            # Reusable widgets
├── modules/                # Feature modules
│   ├── client_module/      # Customer features
│   ├── guest_module/       # Guest user features
│   └── admin_module/       # Admin features
└── main.dart              # App entry point
```

## Key Features

### Authentication
- Email/Password login
- Phone number authentication
- Google OAuth integration
- Biometric authentication

### Guest Experience
- Browse restaurants without registration
- Place orders as guest
- Convert to registered user

### Order Management
- Real-time order tracking
- Payment processing
- Delivery management

## State Management

The app uses **Riverpod** for state management with the following patterns:

- **Providers**: For dependency injection
- **StateNotifiers**: For complex state management
- **ConsumerWidgets**: For UI state consumption

## Data Flow

1. **UI Events** → **Providers** → **Services** → **APIs**
2. **API Responses** → **Models** → **State Updates** → **UI Updates**

## Security

- JWT token-based authentication
- Secure storage for sensitive data
- API request/response validation
- Input sanitization

## Performance

- Lazy loading for large lists
- Image caching and optimization
- Efficient state management
- Memory leak prevention

## Testing

- Unit tests for business logic
- Widget tests for UI components
- Integration tests for user flows
