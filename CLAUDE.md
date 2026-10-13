# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`job-harness` is a standalone desktop application for job seekers built with Electron, TypeScript, Vite, React, Vercel AI SDK, Zod, and SQLite (`better-sqlite3` + `sqlite-vec`).

The repository contains:
- `research/`: Multi-part research suite and specification on modern ATS architectures, parsing pipelines, recruiter workflows, and resume engineering standards.
- Electron main process, preload scripts, and React/Vite renderer UI.

## Environment & Tooling

- **Node.js**: v26+
- **Package Manager**: `npm`
- **Typing**: TypeScript strict mode
- **Linting & Formatting**: ESLint / Prettier or Biome

## Key Architecture Principles

1. **Local-First & Standalone**: Zero external database or server requirements. User data and SQLite stay strictly on the local machine.
2. **Resume-as-Code (RaC)**: Uses Typst to compile deterministic single-column ATS-friendly vector PDFs with clean Unicode CMaps.
3. **Type-Safe Agentic Workflows**: Powered by Vercel AI SDK (`ai`) and Zod schemas for structured extraction and tailoring.
