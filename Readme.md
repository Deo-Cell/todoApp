
# ✅ TodoApp – Flutter + Serverpod

Une application de gestion de tâches (to-do list) développée avec **Flutter** pour le frontend et **Serverpod** pour le backend.  
Elle permet de créer, lire, mettre à jour et supprimer des tâches de manière simple, rapide et évolutive.

---

## 🚀 Fonctionnalités

- Ajouter une nouvelle tâche 📝  
- Afficher la liste des tâches en temps réel 📋  
- Marquer une tâche comme terminée ✅  
- Modifier ou supprimer une tâche 🛠  
- Backend Serverpod avec base de données PostgreSQL 🔌  
- Synchronisation locale/distante via HTTP RPC 🛰

---

## 🧰 Stack technique

| Côté        | Techno utilisée                    |
|-------------|-------------------------------------|
| Frontend    | Flutter (Dart)                      |
| Backend     | [Serverpod](https://serverpod.dev) |
| Database    | PostgreSQL via Serverpod ORM        |
| Auth (optionnel) | À intégrer selon besoins       |

---

## 📦 Structure du projet

```
todoapp/
├── server/           # Code Serverpod (API, modèles, endpoints)
├── client/           # Code Flutter (UI, logique)
└── README.md
```

---

## 🔧 Installation

### Prérequis :
- Flutter SDK
- Dart
- PostgreSQL
- Serverpod CLI (`pub global activate serverpod_cli`)

---

### 1. Clone du repo

```bash
git clone https://github.com/ton-utilisateur/todoapp.git
cd todoapp
```

### 2. Configurer le backend

```bash
cd server
serverpod generate
docker-compose up -d  # Pour lancer PostgreSQL
serverpod run
```

### 3. Lancer le client Flutter

```bash
cd client
flutter pub get
flutter run
```

---

## 🛠 Exemple de modèle (Todo)

```dart
class Todo extends SerializableEntity {
  int id;
  String title;
  bool isDone;

  Todo({required this.id, required this.title, this.isDone = false});
}
```

---

## 🗂 Endpoints Serverpod

- `POST /todo.create` → créer une tâche
- `GET /todo.getAll` → liste des tâches
- `PUT /todo.update` → mettre à jour une tâche
- `DELETE /todo.delete` → supprimer une tâche

---

## 📌 À venir

- Authentification utilisateur
- Notifications push
- Synchronisation hors ligne
- Filtrage par catégories

---

## 🤝 Contribuer

Les PRs sont les bienvenues !  
Merci de formater votre code avec `dart format` avant de soumettre.

---

## 📜 Licence

[MIT](LICENSE)

---

## 🙌 Auteur

Développé par **Deo Gratias PATINVOH**  
> Étudiant passionné de mobile & backend – Flutter & Serverpod Enthusiast  
> [LinkedIn](https://www.linkedin.com/in/deo-gratias-patinvoh-975554238/)
