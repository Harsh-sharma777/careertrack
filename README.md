# CareerTrack 🚀
### Placement & Job Application Tracker for College Students

**CareerTrack** is a modern, high-performance web application tailored specifically for university students and early-career software engineers navigating internships, campus placements, and full-time hiring pipelines.

Built with clean modular architecture, accessible design tokens, a dedicated Data Access Layer (DAL), and an interview preparation hub, CareerTrack provides a complete command center for managing applications, upcoming technical rounds, and offer evaluations.

---

## 🌟 Key Features

### 1. High-Level Executive Dashboard
- **Pipeline Metrics**: Tracks Total Applications, Active Pipeline (non-wishlist, non-rejected), Scheduled Technical Rounds, Offers Extended, and a calculated **Response Rate %** (`(OA + Interviews + Offers) / Total Submitted * 100`).
- **Visual Funnel Progress Bar**: Real-time color-coded distribution of applications across stages (`Wishlist` → `Applied` → `Online Assessment` → `Interview` → `Offer` → `Rejected`).
- **Upcoming Interview Radar**: Auto-detects upcoming technical rounds, coding tests, and HR discussions with day-by-day countdown pills (*"Today"*, *"Tomorrow"*, *"In 3 days"*).
- **Recent Activity Stream**: Audit history showing stage changes, newly applied jobs, and recruiter notes.

### 2. Comprehensive Application Management
- **Full Application Data Model**: Company name, role/position, location (with Remote tags), official job posting link, application date, compensation/salary range, general notes, and next follow-up dates.
- **Search, Filter & Sort**:
  - Instant full-text search across companies, roles, locations, and keywords.
  - Pipeline stage filter pills.
  - Multi-property sorting (Date Applied desc/asc, Company A-Z, Next Follow-Up date).
- **Dual Views**:
  - **Table View**: Dense, sortable data table with company avatars, inline status dropdown selectors, overdue follow-up alerts, and actions.
  - **Kanban Board**: Drag-and-drop and quick-move 6-column pipeline board.

### 3. Application Detail Drawer & Activity Timeline
- Slide-over panel revealing complete metadata and quick stage transition selector.
- **Audit Timeline Log**: Chronological trail of every status transition and recruiter communication.
- **Add Recruiter Note / Update**: Post timestamped conversation updates directly to an application's timeline.

### 4. Dedicated Interview Preparation Hub
- **Prep Command Center**: Aggregates all active technical rounds, Codility/HackerRank assessments, and hiring manager loops.
- **Interactive Checklist**: Track interview prep tasks (e.g. *"Review LeetCode Top 50"*, *"Practice System Design"*, *"Prepare STAR stories"*). Checklist state updates persist immediately.
- **Quick-Add Prep Tasks**: Add company-specific interview tasks on the fly.
- **Technical & Behavioral Reference**: Embedded STAR method framework, technical round best practices, and high-impact questions to ask interviewers.

### 5. Data Access Layer & Offline Resilience
- Implements the **Repository Pattern** (`ApplicationRepository`), encapsulating `localStorage` behind an asynchronous interface (`async getAll()`, `async create()`, `async update()`, `async delete()`).
- Trivial to swap with a REST API, Firebase, or Supabase backend without altering UI components.
- **Backup & Restore**: One-click **Export to JSON** and **Import from JSON** for data backup across devices.
- **Reset Sample Data**: Easily reload curated college placement datasets (Stripe, Google, Microsoft, Datadog, Figma, etc.).

### 6. Design & Accessibility
- **Refined Productivity Theme**: Calm, high-contrast dark mode with smooth CSS variables, glassmorphism, and seamless light mode toggle.
- **Accessible & Keyboard Friendly**:
  - `n` or `N` — Open New Application modal
  - `/` — Jump to Search
  - `d` — Open Dashboard
  - `t` — Open Table View
  - `k` — Open Kanban View
  - `p` — Open Interview Prep Hub
  - `Esc` — Close modals and drawers
- WCAG AA color contrast and screen-reader accessible forms with inline validation error states.

---

## 🏗️ Architecture & Project Structure

```
CareerTrack/
├── index.html               # Semantic HTML5 entry point & accessible layout
├── .env.example             # Environment configuration template
├── README.md                # Documentation & interview guide
│
├── styles/
│   ├── main.css             # Design tokens, color system, resets & typography
│   ├── components.css       # Buttons, badges, forms, modals, drawer, toast
│   └── views.css            # Dashboard metrics, table layout, kanban board
│
├── js/
│   ├── types.js             # JSDoc contracts, status enums & color constants
│   ├── sample-data.js       # Curated college placements & intern roles
│   ├── storage.js           # Data Access Layer (Repository pattern over localStorage)
│   ├── state.js             # Reactive StateManager & event bus
│   ├── metrics.js           # Analytics engine, filtering, sorting & response rate math
│   │
│   ├── components/
│   │   ├── toast.js         # Non-intrusive feedback toast notifications
│   │   ├── modal.js         # Accessible Add/Edit modal with real-time validation
│   │   ├── detail-drawer.js # Application details, timeline & prep checklist
│   │   ├── dashboard.js     # Stat cards, funnel bar, upcoming interviews, feed
│   │   ├── table.js         # Sortable, filterable applications table
│   │   ├── kanban.js        # Drag-and-drop 6-stage Kanban board
│   │   └── prep-hub.js      # Interview preparation workspace & resource widgets
│   │
│   └── app.js               # Application bootstrap, navigation & shortcuts
│
└── tests/
    ├── test-runner.html     # Visual in-browser test dashboard
    └── test-suite.js        # Unit tests for filtering, sorting, metrics & repository
```

---

## ⚡ How to Run the App

CareerTrack is built using modern standard ES Modules and Vanilla CSS, meaning **it requires zero build steps, zero package installations, and runs immediately in any browser.**

### Option 1: Direct Browser Launch
Simply double-click `index.html` or open it in your browser (Chrome, Edge, Firefox, Safari).

### Option 2: Local Static Server (VS Code / Python / Live Server)
If you prefer running through a local web server:
- **VS Code**: Right-click `index.html` and click **"Open with Live Server"**.
- **Python** (if installed):
  ```bash
  python -m http.server 8080
  ```
  Then visit `http://localhost:8080`.
- **Node / npx** (if available on another machine):
  ```bash
  npx serve .
  ```

---

## 🧪 Automated Unit Tests

CareerTrack includes a dedicated, zero-dependency browser test runner.
To run the automated tests:
1. Open [`tests/test-runner.html`](tests/test-runner.html) in your browser (or click **"🧪 Run Unit Tests"** in the sidebar footer).
2. The runner automatically executes unit test assertions for:
   - Search keyword filtering (company name, role, tech stack).
   - Pipeline stage filtering (`Wishlist`, `Interview`, `Offer`, etc.).
   - Multi-property sorting (Date Applied descending/ascending, Company A-Z).
   - Metrics Engine calculations (Response Rate %, active pipeline count, total submissions).
   - Storage Repository CRUD and automatic status transition timeline audit logging.

---

## 🎓 Resume Talking Points for Software Engineering Interviews

When showcasing CareerTrack on your portfolio and resume, highlight these key engineering decisions:

1. **Separation of Concerns & Repository Pattern**:
   > *"I designed CareerTrack with a dedicated Data Access Layer (`ApplicationRepository`) that abstracts data operations behind an asynchronous interface. This allowed me to develop an offline-first client with `localStorage` while ensuring zero refactoring is needed when switching to a REST or GraphQL backend."*

2. **Reactive State Management without Heavy Framework Overheads**:
   > *"Implemented a lightweight publish-subscribe `StateManager` in Vanilla TypeScript/JavaScript that coordinates cross-component re-renders (table, kanban, drawer, and metrics) with predictable single-source-of-truth state flow."*

3. **Domain-Specific Placement Analytics**:
   > *"Engineered custom funnel analytics including a responsive response rate calculator (`(OA + Interviews + Offers) / Total Submitted`) that accounts for active placement pipelines and excludes pre-application wishlists."*

4. **Accessibility & User Experience**:
   > *"Designed a comprehensive design token system supporting WCAG AA high-contrast Dark and Light modes, keyboard navigation shortcuts, real-time input validation, and an interactive Kanban board with HTML5 Drag-and-Drop."*

---

## 🚀 Future Roadmap & Customization
- **Backend Sync**: Connect to Supabase or Firebase using the pre-configured `.env.example` schema.
- **Calendar Export**: Add `.ics` iCal export for scheduled interview dates.
- **Resume Tailoring**: Add a PDF resume matcher that compares application job descriptions with your resume bullet points.
