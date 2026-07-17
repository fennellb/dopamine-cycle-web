import SwiftUI

// MARK: - Data Model

struct Phase: Identifiable {
    let id: Int
    let label: String
    let systemIcon: String
    let accentColor: Color
    let accentLight: Color
    let title: String
    let quote: String
    let risk: String
    let goal: String
    let skills: [Skill]
}

struct Skill: Identifiable {
    let id = UUID()
    let name: String
    let note: String
}

let phases: [Phase] = [
    Phase(
        id: 0,
        label: "Boredom",
        systemIcon: "circle.dashed",
        accentColor: Color(red: 0.094, green: 0.373, blue: 0.647),
        accentLight: Color(red: 0.902, green: 0.945, blue: 0.984),
        title: "Boredom / Under-stimulation",
        quote: "Nothing feels engaging; I need something now",
        risk: "Impulsive novelty-seeking, avoidance of responsibilities",
        goal: "Tolerate low stimulation without immediate escape",
        skills: [
            Skill(name: "Mindfulness — observe/describe", note: "\"This is boredom + under-stimulation.\""),
            Skill(name: "Radical acceptance", note: "Boredom is an expected state, not an emergency."),
            Skill(name: "Opposite action (gentle)", note: "Do small engagement — not big dopamine chasing."),
            Skill(name: "PLEASE skill", note: "Sleep, food, hydration first. Low baseline worsens urgency.")
        ]
    ),
    Phase(
        id: 1,
        label: "Urgency",
        systemIcon: "bolt.fill",
        accentColor: Color(red: 0.522, green: 0.310, blue: 0.043),
        accentLight: Color(red: 0.980, green: 0.933, blue: 0.855),
        title: "Dopamine Seeking / Urgency Spike",
        quote: "I need to do something interesting RIGHT NOW",
        risk: "Task switching, rabbit holes, impulsive commitments",
        goal: "Prevent impulsive escalation into hyperfocus traps",
        skills: [
            Skill(name: "STOP skill", note: "Stop → Take a step back → Observe the urge spike → Proceed mindfully."),
            Skill(name: "Urge surfing", note: "Urgency rises and falls like a wave. Ride it, don't act on it."),
            Skill(name: "Delay + distract", note: "\"Wait 10 minutes before acting.\""),
            Skill(name: "Wise mind check", note: "Is this aligned with long-term goals, or just stimulation?")
        ]
    ),
    Phase(
        id: 2,
        label: "Hyperfocus",
        systemIcon: "scope",
        accentColor: Color(red: 0.325, green: 0.290, blue: 0.718),
        accentLight: Color(red: 0.933, green: 0.929, blue: 0.996),
        title: "Hyperfocus / High Engagement",
        quote: "I'm locked in; time disappears",
        risk: "Missed meals, sleep loss, overcommitment",
        goal: "Keep engagement without losing regulation",
        skills: [
            Skill(name: "Mindfulness of current activity", note: "Periodic check-ins: what is my body doing right now?"),
            Skill(name: "Interoceptive awareness", note: "Notice hunger, fatigue, tension signals."),
            Skill(name: "Planned pausing", note: "Set timers, alarms, transition cues before the dive."),
            Skill(name: "Self-validation", note: "\"This focus is real and useful — but not infinite.\"")
        ]
    ),
    Phase(
        id: 3,
        label: "Overload",
        systemIcon: "exclamationmark.triangle.fill",
        accentColor: Color(red: 0.639, green: 0.176, blue: 0.176),
        accentLight: Color(red: 0.988, green: 0.922, blue: 0.922),
        title: "Overload / Sensory + Cognitive Saturation",
        quote: "Too much; everything feels heavy or irritating",
        risk: "Shutdown, irritability, emotional flooding",
        goal: "Downshift physiological arousal",
        skills: [
            Skill(name: "TIPP skills (fast regulation)", note: "Temperature · Intense exercise (brief) · Paced breathing · Paired muscle relaxation."),
            Skill(name: "Reduce input", note: "Dim lights, quiet noise, drop tasks."),
            Skill(name: "One-mindfulness", note: "One thing only — no multitasking."),
            Skill(name: "Radical acceptance", note: "\"I am overloaded right now; this will pass.\"")
        ]
    ),
    Phase(
        id: 4,
        label: "Burnout",
        systemIcon: "battery.0percent",
        accentColor: Color(red: 0.267, green: 0.267, blue: 0.255),
        accentLight: Color(red: 0.945, green: 0.941, blue: 0.910),
        title: "Burnout / Shutdown",
        quote: "I can't do anything; everything feels impossible",
        risk: "Avoidance spiral, guilt, depression-like state",
        goal: "Restart motion without forcing full capacity",
        skills: [
            Skill(name: "Self-validation (critical)", note: "\"My system is depleted, not broken.\""),
            Skill(name: "PLEASE skill (again)", note: "Rebuild basics first — don't skip this."),
            Skill(name: "Smallest effective action", note: "\"1% task version only.\" Behavioral activation at micro-scale."),
            Skill(name: "Radical acceptance of limits", note: "Opposite action at tiny scale: 2–5 minute starter tasks.")
        ]
    ),
    Phase(
        id: 5,
        label: "Recovery",
        systemIcon: "leaf.fill",
        accentColor: Color(red: 0.231, green: 0.427, blue: 0.067),
        accentLight: Color(red: 0.918, green: 0.953, blue: 0.871),
        title: "Recovery / Low-Energy Stabilization",
        quote: "I'm okay again, but everything feels dull",
        risk: "Boredom → restarting the cycle too aggressively",
        goal: "Rebuild baseline without triggering extremes",
        skills: [
            Skill(name: "Build mastery", note: "Small consistent wins. Not big ambitious ones yet."),
            Skill(name: "Pleasant events scheduling", note: "Low-stimulation pleasures — not dopamine spikes."),
            Skill(name: "Mindfulness of positive experience", note: "Notice what feels okay. Let it register."),
            Skill(name: "Wise mind planning", note: "Don't jump straight to high-stimulation commitments.")
        ]
    )
]

// MARK: - Phase Button

struct PhaseButton: View {
    let phase: Phase
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: phase.systemIcon)
                    .font(.system(size: 12, weight: .medium))
                Text(phase.label)
                    .font(.system(size: 13, weight: .medium))
            }
            .padding(.horizontal, 13)
            .padding(.vertical, 7)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isSelected ? phase.accentLight : Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(
                                isSelected ? phase.accentColor.opacity(0.5) : Color.secondary.opacity(0.25),
                                lineWidth: isSelected ? 1.5 : 1
                            )
                    )
            )
            .foregroundColor(isSelected ? phase.accentColor : .secondary)
        }
        .buttonStyle(.plain)
        .animation(.easeInOut(duration: 0.15), value: isSelected)
    }
}

// MARK: - Skill Row

struct SkillRow: View {
    let skill: Skill
    let accentColor: Color
    let accentLight: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(skill.name)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.primary)
            Text(skill.note)
                .font(.system(size: 12))
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 9)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(NSColor.controlBackgroundColor))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.secondary.opacity(0.15), lineWidth: 0.5)
                )
        )
    }
}

// MARK: - Phase Detail View

struct PhaseDetailView: View {
    let phase: Phase

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // Header
            HStack(alignment: .top, spacing: 12) {
                ZStack {
                    Circle()
                        .fill(phase.accentLight)
                        .frame(width: 40, height: 40)
                    Image(systemName: phase.systemIcon)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(phase.accentColor)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(phase.title)
                        .font(.system(size: 15, weight: .semibold))
                    Text("\"\(phase.quote)\"")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                        .italic()
                }
            }
            .padding(.bottom, 14)

            // Risk bar
            HStack(spacing: 6) {
                Image(systemName: "exclamationmark.circle")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                Text("Risk: ")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.secondary)
                + Text(phase.risk)
                    .font(.system(size: 12))
                    .foregroundColor(.primary)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(NSColor.windowBackgroundColor))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.secondary.opacity(0.15), lineWidth: 0.5)
                    )
            )
            .padding(.bottom, 14)

            // Skills
            Text("DBT SKILLS FOR THIS PHASE")
                .font(.system(size: 10, weight: .semibold))
                .foregroundColor(.secondary)
                .kerning(0.8)
                .padding(.bottom, 7)

            VStack(spacing: 6) {
                ForEach(phase.skills) { skill in
                    SkillRow(skill: skill, accentColor: phase.accentColor, accentLight: phase.accentLight)
                }
            }
            .padding(.bottom, 14)

            // Goal
            HStack(alignment: .top, spacing: 10) {
                Rectangle()
                    .fill(phase.accentColor)
                    .frame(width: 3)
                    .cornerRadius(2)

                VStack(alignment: .leading, spacing: 2) {
                    Text("GOAL")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(phase.accentColor)
                        .kerning(0.8)
                    Text(phase.goal)
                        .font(.system(size: 13))
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(phase.accentLight.opacity(0.5))
            )

            Spacer()
        }
        .padding(20)
        .animation(.easeInOut(duration: 0.2), value: phase.id)
    }
}

// MARK: - Cycle Ring View

struct CycleRingView: View {
    let selectedID: Int
    let onSelect: (Int) -> Void

    private let ringRadius: CGFloat = 80
    private let iconRadius: CGFloat = 80

    var body: some View {
        ZStack {
            // Connecting ring
            Circle()
                .strokeBorder(Color.secondary.opacity(0.12), lineWidth: 1.5)
                .frame(width: ringRadius * 2, height: ringRadius * 2)

            ForEach(phases) { phase in
                let angle = Double(phase.id) * (360.0 / Double(phases.count)) - 90
                let radians = angle * .pi / 180
                let x = cos(radians) * iconRadius
                let y = sin(radians) * iconRadius
                let isSelected = phase.id == selectedID

                Button(action: { onSelect(phase.id) }) {
                    ZStack {
                        Circle()
                            .fill(isSelected ? phase.accentColor : Color(NSColor.controlBackgroundColor))
                            .frame(width: 36, height: 36)
                            .shadow(color: isSelected ? phase.accentColor.opacity(0.35) : .clear, radius: 6)
                        Image(systemName: phase.systemIcon)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(isSelected ? .white : .secondary)
                    }
                }
                .buttonStyle(.plain)
                .offset(x: x, y: y)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
            }

            // Center label
            VStack(spacing: 2) {
                Text(phases[selectedID].label)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(phases[selectedID].accentColor)
                Text("phase \(selectedID + 1)/\(phases.count)")
                    .font(.system(size: 10))
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: ringRadius * 2 + 50, height: ringRadius * 2 + 50)
    }
}

// MARK: - Main Content View

struct ContentView: View {
    @State private var selectedPhaseID: Int = 0

    private var selectedPhase: Phase {
        phases[selectedPhaseID]
    }

    var body: some View {
        HSplitView {
            // Left sidebar
            VStack(spacing: 0) {
                // App title
                VStack(spacing: 4) {
                    Text("Dopamine Cycle")
                        .font(.system(size: 16, weight: .semibold))
                    Text("DBT Skills Map")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)
                .padding(.bottom, 18)

                // Cycle ring
                CycleRingView(selectedID: selectedPhaseID) { id in
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedPhaseID = id
                    }
                }
                .padding(.bottom, 16)

                Divider().padding(.horizontal, 16)

                // Phase pill buttons
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 6) {
                        ForEach(phases) { phase in
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    selectedPhaseID = phase.id
                                }
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: phase.systemIcon)
                                        .font(.system(size: 13))
                                        .foregroundColor(selectedPhaseID == phase.id ? phase.accentColor : .secondary)
                                        .frame(width: 18)
                                    Text(phase.label)
                                        .font(.system(size: 13, weight: selectedPhaseID == phase.id ? .semibold : .regular))
                                        .foregroundColor(selectedPhaseID == phase.id ? phase.accentColor : .primary)
                                    Spacer()
                                    if selectedPhaseID == phase.id {
                                        Circle()
                                            .fill(phase.accentColor)
                                            .frame(width: 6, height: 6)
                                    }
                                }
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(selectedPhaseID == phase.id ? phase.accentLight : Color.clear)
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                }

                Divider().padding(.horizontal, 16)

                // Bottom nav arrows
                HStack(spacing: 0) {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedPhaseID = (selectedPhaseID - 1 + phases.count) % phases.count
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 13, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(.secondary)

                    Divider().frame(height: 28)

                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedPhaseID = (selectedPhaseID + 1) % phases.count
                        }
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 13, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(.secondary)
                }
                .padding(.bottom, 8)
            }
            .frame(minWidth: 200, idealWidth: 220, maxWidth: 240)
            .background(Color(NSColor.windowBackgroundColor))

            // Right detail pane
            ScrollView(.vertical, showsIndicators: false) {
                PhaseDetailView(phase: selectedPhase)
                    .id(selectedPhase.id)
            }
            .frame(minWidth: 320)
            .background(Color(NSColor.controlBackgroundColor))
        }
        .frame(minWidth: 560, minHeight: 460)
    }
}

// MARK: - App Entry Point

@main
struct DopamineCycleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.titleBar)
        .windowToolbarStyle(.unified)
        .commands {
            CommandGroup(replacing: .newItem) {}
        }
    }
}
