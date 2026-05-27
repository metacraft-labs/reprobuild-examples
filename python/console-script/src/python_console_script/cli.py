"""Console-script entry point for the python_console_script package."""


def main() -> int:
    """Print a friendly greeting and return a POSIX exit status."""
    print("hello from python-console-script")
    return 0


if __name__ == "__main__":  # pragma: no cover - manual invocation only
    raise SystemExit(main())
