# 🧘‍♀️ Inner Ease – Mental Health Companion App

Inner Ease is a calming, self-guided mental health companion built with SwiftUI. It empowers users to track moods, journal thoughts, and explore mindfulness tools — all stored privately on-device using local JSON files.

---

## ✨ Features

### 🏠 Home Screen
- **Quote of the Day** for encouragement
- **Mood Stats** including total check-ins, weekly logs, and most common mood
- Quick access to journaling, calendar, and tools

### 😊 Mood Tracker
- Select a mood emoji to log your feelings
- Entries are timestamped and saved locally
- Mood history feeds into calendar and stats

### 📓 Journal
- Write daily reflections and emotional check-ins
- View and re-read previous entries
- Prompts available to inspire writing
- All journal entries are stored privately (not editable once saved)

### 📅 Calendar View
- Displays all mood entries by date
- Great for seeing patterns over time

### 🧰 Tools Page
Each tool is interactive and designed for mental wellness:
- 🫁 **Deep Breathing**: Guided inhale/hold/exhale cycles with a timer
- ✏️ **Quick Journal Prompt**: Random inspiration, jumps to writing view
- 🎶 **Soothing Music**: Curated genres and playlists (Lo-fi, Classical, Ambient, Nature)
- 🚶 **Walking Challenge**: Select difficulty and get a walk goal + motivational message

### ⚙️ Settings
- Edit display name
- Toggle notification preference (visual only)

---

## 💾 Local Storage & Privacy

All data is saved locally using JSON files:
- `moods.json` – mood entries
- `journal.json` – journal entries

No CoreData, no internet connection required, and no data ever leaves the device.

---

## 🛠 Tech Stack

- ✅ SwiftUI
- ✅ MVVM-style observable data
- ✅ Local file-based persistence (`Codable`)
- ✅ Clean navigation using `NavigationLink`
- ✅ Dark Mode Support

---

## 📦 Getting Started

1. Clone or download the repository
2. Download and open Inner Ease. zip in Xcode
3. Run the app on the simulator or device

> No CocoaPods or external libraries required

---

## 🙏 Acknowledgements

Created with care and mindfulness.  
Inspired by the need for accessible, private mental wellness tools.

---

## 🔒 License

This project is open for learning and portfolio purposes. Contact herna184@rangers.uwp.edu for any distribution or collaboration 
