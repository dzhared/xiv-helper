import Foundation

extension Task where Success == Never, Failure == Never {
    /// Suspends the current task for at least the given duration in seconds.
    public static func sleep(seconds duration: Double) async throws {
        try await Task.sleep(nanoseconds: UInt64(duration) * NSEC_PER_SEC)
    }
}
