# Liskov Substitution Principle (LSP)

## What is the Liskov Substitution Principle?
The Liskov Substitution Principle (LSP) is one of the SOLID principles of object-oriented design. It suggests that objects of a superclass should be replaceable with objects of a subclass without altering the correct behavior of the program.

In simpler terms, if you have a function that works with a base class, it should work with any subclass of that base class without any issues.

## Before-LSP.swift
In `Before-LSP.swift`, the `Bird` class is designed to represent any bird, with a `fly()` method that indicates the bird can fly. However, `Penguin`, which is a subclass of `Bird`, cannot fly and overrides the `fly()` method to return a different behavior. This breaks the LSP because `Penguin` cannot be used as a `Bird` in contexts where flying is expected.

## After-LSP.swift
To adhere to the Liskov Substitution Principle, `After-LSP.swift` refactors the design:
- `Bird` is now a protocol, and `FlyingBird` is a protocol that extends `Bird` with a `fly()` method.
- `Sparrow` conforms to `FlyingBird`, as it can fly.
- `Penguin` conforms only to `Bird`, as it does not have the ability to fly.

This design ensures that any bird that can fly will conform to `FlyingBird`, and any function expecting a flying bird can safely assume that the bird can indeed fly.

## Overview of Changes
- Introduced a `Bird` protocol for common bird behaviors and a `FlyingBird` protocol for birds that can fly.
- `Sparrow` conforms to `FlyingBird`, ensuring that it can be treated as a flying bird.
- `Penguin` conforms only to `Bird`, avoiding the incorrect assumption that it can fly.
