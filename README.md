# 📱 Flutter Daraz-Style Product Listing – Scroll Architecture Demo

This project demonstrates a **single-scroll, sliver-based architecture** for building a Daraz-style product listing screen in Flutter.
The focus is not UI polish, but **correct scroll ownership and gesture coordination** across collapsible headers, sticky tabs, and horizontally swipeable tab views.

---

## ✅ Features Implemented

* Collapsible header (carousel/banner)
* Sticky `TabBar` when header collapses
* Multiple tabs with product grids (mocked / API-powered)
* Horizontal tab navigation:

  * Tap on tabs
  * Swipe between tabs
* Pull-to-refresh from any tab
* Exactly **one vertical scrollable**
* Scroll position preserved when switching tabs
* No scroll conflict or jitter
* Sliver-based layout (`ExtendedNestedScrollView`)
* Clear separation of UI, scroll ownership, and state (BLoC)

---

## 🧠 Architecture Overview

### 🔹 Root Layout

```dart
ExtendedNestedScrollView(
  onlyOneScrollInBody: true,
  headerSliverBuilder: ...
  body: TabBarView(...)
)
```

* `ExtendedNestedScrollView` owns the **entire vertical scroll**
* Header is built using slivers:

  * `SliverToBoxAdapter` → collapsible banner
  * `SliverPersistentHeader` → pinned `TabBar`
* `TabBarView` handles horizontal swipes only

---

## 🧭 Mandatory Explanation

### 1️⃣ How Horizontal Swipe Was Implemented

Horizontal swipe is implemented using Flutter’s native:

```dart
TabBarView(
  controller: tabController,
  children: ...
)
```

This gives:

* Natural left/right swipe gestures
* Smooth animation between tabs
* No manual gesture detection needed

**Why this is safe:**

* `TabBarView` only listens to **horizontal drag gestures**
* Vertical gestures are passed up to the parent scroll view
* This prevents horizontal swipes from accidentally triggering vertical scroll

---

### 2️⃣ Who Owns the Vertical Scroll and Why

**Single source of truth for vertical scroll:**

```dart
ExtendedNestedScrollView(
  onlyOneScrollInBody: true,
)
```

* The **outer scroll view owns vertical scrolling**
* Each tab’s content is rendered inside a `CustomScrollView`
* `onlyOneScrollInBody: true` ensures:

  * No nested vertical scroll conflicts
  * The header, tab bar, and body scroll as a single unified scrollable
  * Pull-to-refresh works from any tab

This guarantees:

✅ One vertical scroll
✅ No scroll jitter
✅ No double scrolling
✅ No fighting scroll physics

---

### 3️⃣ Trade-offs / Limitations

| Trade-off                                              | Explanation                                                                                                                                                               |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Using `extended_nested_scroll_view`                    | This is not Flutter core. However, Flutter’s native `NestedScrollView` does not fully support correct single-scroll behavior with `TabBarView` and slivers without hacks. |
| State per tab is kept alive                            | `AutomaticKeepAliveClientMixin` is used to preserve scroll position when switching tabs. This increases memory usage slightly.                                            |
| Pull-to-refresh with nested slivers                    | Requires wrapping the tab content carefully so that the parent scroll still controls the gesture.                                                                         |
| Tab content must avoid its own vertical scroll physics | Inner scroll views rely on parent coordination. Incorrect physics can reintroduce scroll conflict.                                                                        |

---

## 🔄 Scroll Position Preservation

```dart
class _ProductTabViewState extends State<ProductTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
}
```

This ensures:

* Switching tabs does **not reset scroll position**
* User experience matches real e-commerce apps

Additionally:

```dart
key: PageStorageKey<String>(widget.category),
```

Preserves scroll state per tab.

---

## 🔁 Pull-to-Refresh Behavior

```dart
RefreshIndicator(
  onRefresh: () async => getProducts(),
)
```

* Pull-to-refresh works from **any tab**
* Gesture bubbles correctly to the parent scroll view
* No conflict with horizontal swipes

---

## 🧩 Gesture Conflict Avoidance

| Gesture          | Owner                      |
| ---------------- | -------------------------- |
| Vertical scroll  | `ExtendedNestedScrollView` |
| Horizontal swipe | `TabBarView`               |
| Refresh gesture  | Parent vertical scroll     |
| Tab switching    | `TabController`            |

This clean separation ensures:

✔ No accidental vertical scrolling during horizontal swipe
✔ No scroll locking
✔ Predictable user interaction

---

## 📂 Folder Structure (Simplified)

```text
lib/
 ├─ config/
 ├─ core/
 ├─ features/
 │   └─ home/
 │       ├─ data/
 │       │   ├─ datasource/
 │       │        ├─ remote_datasource/
 │       │   ├─ entities/
 │       │   ├─ repositories/
 │       │   └─ usecases/
 │       │   ├─ models/
 │       │   └─ repositories/
 │       ├─ domain/
 │       │   ├─ entities/
 │       │   ├─ repositories/
 │       │   └─ usecases/
 │       ├─ presentation/
 │       │   ├─ bloc/
 │       │   ├─ presentation/
 │       │   └─ widgets/
 └─ widgets/
```

* UI is separate from state (BLoC)
* Scroll logic is localized to `HomePage`
* Tab content is isolated in `ProductTabView`

---

## ▶️ How to Run

```bash
flutter pub get
flutter run
```

---

## 🏁 Summary

This project focuses on:

* Correct single-scroll architecture
* Sliver-based collapsible + pinned layout
* Proper ownership of vertical vs horizontal gestures
* Clean, maintainable structure
* Real-world app behavior (Daraz-style UX)

This intentionally avoids hacks like:
❌ multiple `ListView`s
❌ nested scroll physics tricks
❌ magic pixel offsets
❌ global scroll controllers

---

## 🧪 If Time Ran Out (Fallback Explanation)

If implementation was incomplete, the intended architecture would still be:

* Root `ExtendedNestedScrollView`
* Sliver header + pinned `TabBar`
* `TabBarView` for horizontal navigation
* Inner tab views rendered as slivers only
* No independent vertical scrollables inside tabs
