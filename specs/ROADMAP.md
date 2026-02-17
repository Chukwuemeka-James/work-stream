# Flow Platform Roadmap

## Overview

Flow is a decentralized research synthesis platform connecting knowledge workers with research clients. This roadmap outlines the development journey from current state through production launch.

```
Current State (Jan 2026)
    │
    ▼
┌───────────────────┐    ┌───────────────────┐    ┌───────────────────┐    ┌───────────────────┐
│   01_mvp_v1       │ →  │   02_hardening    │ →  │ 03_pending_status │ →  │   04_launch       │
│   (Complete)      │    │   (In Progress)   │    │   (Up Next)       │    │   (Future)        │
└───────────────────┘    └───────────────────┘    └───────────────────┘    └───────────────────┘
```

---

## Epic 00: Archive

**Location:** `specs/00_archive/`

Historical specifications and documentation from earlier development phases. Contains foundational architecture decisions and initial data models that informed current implementation.

**Contents:**
- `architecture.md` — System architecture overview
- `data-models.md` — Database schema design
- `enhanced-tasks.md` — Rich task content specifications
- `api-endpoints.md` — API design documentation
- `roadmap.md` — Legacy roadmap (superseded by this document)

---

## Epic 01: MVP v1 ✅ Complete

**Location:** `specs/01_mvp_v1/`

The foundation of Flow platform — core functionality for tasks, subtasks, authentication, and the worker/client workflow.

### Delivered Capabilities

| Feature | Status | Description |
|---------|--------|-------------|
| Wallet Authentication | ✅ | MetaMask, WalletConnect, Coinbase Wallet |
| User Profiles | ✅ | Profile creation, skills, country |
| Task CRUD | ✅ | Create, list, view, fund tasks |
| Subtask System | ✅ | Subtasks with claim/submit/review cycle |
| AI Decomposition | ✅ | Claude-powered task breakdown |
| Paper Discovery | ⚠️ | Semantic Scholar integration (partial) |
| IPFS Storage | ✅ | Pinata integration for artifacts |
| Smart Contracts | ⚠️ | FlowEscrow, FlowArtifactRegistry (not deployed) |
| Frontend | ✅ | React + Vite + TailwindCSS + wagmi |
| Docker Setup | ✅ | PostgreSQL via docker-compose |

### Key Metrics

| Metric | Target | Actual |
|--------|--------|--------|
| Phase 1 (Foundation) | 100% | 100% ✅ |
| Phase 2 (Core Backend) | 100% | 60% ⚠️ |
| Phase 3 (Integrations) | 100% | 20% ⚠️ |
| Phase 4 (Frontend) | 100% | 40% ⚠️ |

### Outstanding Items (Carry Forward to Hardening)

- Blockchain integration (contract deployment, event monitoring)
- Complete subtask claim/submit flow
- Worker dashboard functionality
- Admin panel features

---

## Epic 02: Hardening 🔄 In Progress

**Location:** `specs/02_hardening/`

Quality, testing, and bug fixes to bring MVP to production-ready state.

### QA Baseline (from `qa-report.md`)

| Category | Current | Target | Gap |
|----------|---------|--------|-----|
| Backend Tests | 59 passing | 59+ | ✅ |
| Frontend Tests | 44 passing | 144+ | +100 |
| Backend Coverage | 56% | 99% | +43% |
| E2E Tests | 0 | 43+ | +43 |
| Critical Bugs | 2 | 0 | Fix 2 |

### Critical Bugs to Fix

| ID | Issue | Location | Impact |
|----|-------|----------|--------|
| BUG-001 | Collaborator payments not split | `blockchain.py:223-290` | Collaborators receive $0 |
| BUG-002 | No claim expiry implementation | `subtasks.py` | Tasks blocked indefinitely |

### Hardening Phases

#### Phase 2.1: Fix Critical Bugs
1. Implement collaborator payment splits in `blockchain.py`
2. Add claim expiry logic + background processor
3. Wire paper discovery to frontend

#### Phase 2.2: Test Coverage Sprint
1. Backend unit tests for payment/claim flows (~110 new tests)
2. Frontend component tests for modals (~100 new tests)
3. E2E tests for critical paths (~43 new tests)

#### Phase 2.3: Regression Suite
1. Automated Playwright E2E suite
2. CI/CD integration for all tests
3. Coverage gates (reject PR if < 99%)

### Quality Gates for Epic Completion

| Gate | Requirement |
|------|-------------|
| Backend Coverage | ≥ 99% |
| Frontend Coverage | ≥ 99% |
| E2E Tests | All 43+ passing |
| Critical Bugs | 0 open |
| All Tests | 100% passing |

---

## Epic 03: Pending Status 📋 Up Next

**Location:** `specs/03_pending_status/`

Improved task lifecycle visibility with "Pending" status and filtering.

### Problem

- `draft` status is technical jargon, not user-friendly
- No way to filter tasks by status
- Pipeline visibility is poor

### Solution

1. **Display "Pending"** for `draft` status (frontend mapping)
2. **Status dropdown filter** in Tasks UI
3. **Consistent badge styling** across all statuses

### Deliverables

| Feature | Priority | Description |
|---------|----------|-------------|
| Pending display name | P0 | Show "Pending" instead of "draft" |
| Status filter dropdown | P0 | Single-select filter in Tasks page |
| URL persistence | P0 | Filter state in query params |
| Badge color scheme | P1 | Consistent colors per status |

### Status Color Scheme

| Status | Color | Badge Class |
|--------|-------|-------------|
| Pending | Gray | `badge-gray` |
| Funded | Blue | `badge-info` |
| In Progress | Amber | `badge-warning` |
| In Review | Purple | `badge-secondary` |
| Completed | Green | `badge-success` |
| Cancelled | Red | `badge-error` |
| Disputed | Red | `badge-error` |

### Success Metrics

| Metric | Target |
|--------|--------|
| Filter usage rate | 30% of task page visits |
| Task discovery time | 50% reduction |
| Pending badge accuracy | 100% |

---

## Epic 04: Production Launch 🚀 Future

**Location:** `specs/04_launch/` (to be created)

Deployment to mainnet with real payments and public access.

### Prerequisites (from Epics 01-03)

- [ ] All critical bugs fixed
- [ ] Test coverage ≥ 99%
- [ ] E2E tests passing
- [ ] Smart contracts audited
- [ ] Status filtering complete

### Launch Phases

#### Phase 4.1: Internal Testing
- Deploy to Base Sepolia testnet
- Team testing all flows
- Fix remaining issues

#### Phase 4.2: Closed Beta
- Invite 20 workers
- Run 5 test tasks with real outputs
- Gather feedback, iterate

#### Phase 4.3: Open Beta
- Public registration
- Full escrow integration
- Artifact marketplace

#### Phase 4.4: Production
- Mainnet deployment
- Real cNGN integration
- Marketing push

### Launch Checklist

- [ ] User can connect wallet and create profile
- [ ] Admin can create tasks with rich content
- [ ] Tasks can be funded via escrow
- [ ] AI decomposes tasks into subtasks
- [ ] Workers can claim subtasks
- [ ] Workers can submit work with files
- [ ] Clients can approve/reject submissions
- [ ] Payments release automatically
- [ ] Artifacts stored on IPFS
- [ ] Basic reputation tracking
- [ ] Admin can manage disputes
- [ ] All tests pass
- [ ] Deployed to mainnet

### Success Metrics (Post-Launch)

| Metric | MVP Target | 3-Month Target |
|--------|------------|----------------|
| Registered workers | 50 | 500 |
| Verified workers | 20 | 100 |
| Tasks completed | 10 | 100 |
| Subtasks processed | 50 | 1000 |
| Artifacts created | 3 | 20 |
| First-submission approval | 70% | 85% |
| Average subtask completion | 24h | 12h |
| Platform uptime | 95% | 99% |

---

## Technical Debt Backlog

Items to address as capacity allows:

| Item | Priority | Notes |
|------|----------|-------|
| Alembic migrations | High | Replace `create_all()` |
| Error handling | High | Consistent error responses |
| Input validation | Medium | Enhanced Pydantic validation |
| Logging | Medium | Structured logging |
| Rate limiting | Medium | Protect AI endpoints |
| Caching | Low | Redis for session/query caching |
| Monitoring | Low | Health checks, metrics |

---

## Architecture Decisions (ADRs)

| Decision | Status | Location |
|----------|--------|----------|
| File storage strategy | Pending | TBD |
| Real-time updates | Pending | TBD |
| AI cost management | Pending | TBD |
| Payment flow automation | Pending | TBD |

---

## Epic Dependencies

```
┌───────────┐
│ 01_mvp_v1 │ ──────────────────────────────────────────┐
│ (Done)    │                                           │
└─────┬─────┘                                           │
      │ carries forward incomplete work                 │
      ▼                                                 │
┌───────────────┐                                       │
│ 02_hardening  │ ──────────────────────────┐          │
│ (In Progress) │                           │          │
└───────┬───────┘                           │          │
        │ stabilizes platform               │          │
        ▼                                   │          │
┌───────────────────┐                       │          │
│ 03_pending_status │                       │          │
│ (Up Next)         │                       │          │
└─────────┬─────────┘                       │          │
          │ UI improvements                 │          │
          ▼                                 ▼          ▼
    ┌───────────┐  ◄─── requires all three complete ───┘
    │ 04_launch │
    │ (Future)  │
    └───────────┘
```

---

## How to Use This Roadmap

1. **Find your epic** — Each epic has its own folder in `specs/`
2. **Read the spec** — Each epic contains `brainstorm.md`, `product_spec.md`, and `technical_spec.md`
3. **Check the QA report** — `02_hardening/qa-report.md` has current test status
4. **Track progress** — This document is the source of truth for epic sequencing

---

*Document Version: 1.0*
*Last Updated: January 2026*
*Status: Active*
