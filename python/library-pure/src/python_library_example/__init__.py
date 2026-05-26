"""Minimal pure-Python library exposing a single greet() function."""


def greet(name: str) -> str:
    """Return a greeting for ``name``."""
    return f"hello, {name}"


__all__ = ["greet"]
