# 🌿 RemedyMate Mobile

RemedyMate is an **AI-powered home remedy advisor** designed to improve healthcare accessibility in Africa, starting with Ethiopia.
It provides safe and reliable **natural remedies** and **over-the-counter (OTC) treatments** for minor symptoms like headaches, colds, and stomach issues — especially in regions with limited healthcare access.

---

## 📱 RemedyMate Mobile App (Flutter)

This is the **Flutter implementation** of RemedyMate — an AI-powered home remedy advisor.
The mobile app allows users to access natural remedy and OTC treatment suggestions directly on their smartphones.

---

## 📂 Repository Structure

```
remedymate-mobile/
├── .github/         # GitHub workflows, issue templates, and community health files
└── remedy-mate/     # Flutter mobile application source code
```
* ⚙️ `.github` → GitHub Actions, issue templates, pull request templates, etc.
* 📱 `remedy-mate` → Main Flutter project for the mobile app

---

## 🚀 Features (Planned & In Progress)

* 🏥 AI-powered symptom-based remedy suggestions
* 🌿 Traditional + scientific remedies with local context
* 💊 Over-the-counter treatment recommendations
* 📖 Simplified explanations for users of all literacy levels
* 🌍 Offline-first design for low-connectivity regions

---

## 🛠️ Tech Stack

* 📱 **Mobile**: Flutter (with Clean Architecture)
* 🎯 **Dart**
* 🔧 **State Management**: [Provider / Riverpod / Bloc] (TBD by team)
* 🌐 **API Integration**: planned backend with RAG system
* 🔗 **Backend**: Node.js / Python (with RAG-based AI system, planned)
* 🗄️ **Databases**: MySQL + MongoDB (structured + unstructured data)
* 🤖 **AI/ML**: Retrieval-Augmented Generation (RAG) for remedy recommendations

---

## 📋 Prerequisites

* ✅ Flutter SDK (>=3.x)
* ✅ Dart (>=3.x)
* ✅ Android Studio / VS Code with Flutter extensions
* ✅ Emulator or physical device for testing

---

## 🚀 Getting Started

Clone the repository and install dependencies:

```bash
git clone https://github.com/RemedyMate/remedymate-mobile.git
cd remedymate-mobile/remedy-mate
flutter pub get
flutter run
```

---

## 📂 Project Structure

Following **Clean Architecture** principles:

```
lib/
├── core/            # Common utilities, constants, themes
├── data/            # Data sources, models, repositories
├── domain/          # Entities, use cases, business logic
└── presentation/    # UI (screens, widgets), state management
```

---

## 🧪 Running Tests

Run unit and widget tests with:

```bash
flutter test
```

---

## 📌 Project Goals

1️⃣ Improve healthcare accessibility in underserved regions  
2️⃣ Provide trustworthy remedies based on both scientific and local knowledge  
3️⃣ Build a scalable, mobile-first platform

---

## 🤝 Contributing

We welcome contributions!

1. 🍴 Fork the repository
2. 🌱 Create a feature branch → `git checkout -b feature-name`
3. 💾 Commit your changes → `git commit -m "Add new feature"`
4. 🚀 Push to the branch → `git push origin feature-name`
5. 🔎 Open a Pull Request

* ✨ Follow Flutter/Dart best practices
* 📝 Use meaningful commit messages
* 🔀 Open PRs for feature additions or bug fixes

👉 Check [`remedy-mate/README.md`](./remedy-mate/README.md) for **Flutter-specific development instructions**.

---

## 📜 License

This project will be released under an **open-source license (TBD)**.

---

## 👥 Team

RemedyMate is being developed by a passionate team of developers across **mobile, web, and AI domains**.

---

Do you want me to also add a **"Development Guidelines"** section (like naming conventions, folder naming, branch strategy) since it’s a team project?
