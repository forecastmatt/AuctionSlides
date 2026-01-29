# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

AuctionSlides is a **projection tool for live auctions**. You set it up on a laptop, hit fullscreen, and project it onto a big screen at the venue before the auction begins. It is a single-file browser application (`auction.html`) — no build step, server, or dependencies.

**Before the auction** — You load up photos and videos (of auction items, sponsors, announcements, etc.) and they play in a loop as a slideshow with smooth fades. A header at the top shows a live countdown to when bidding starts, so the audience knows how long they're waiting.

**The setup** — You drag and drop your media, set how long each image shows, choose whether videos play fully or get cut short, pick the auction date/time via dropdowns, and optionally add custom header text. Then you hit fullscreen and walk away.

**The countdown** — Ticks down to the auction start time, visible at all times over the slideshow (and on the control deck as a preview). When it hits zero, it switches to "Bidding is LIVE!"

## Architecture

Everything lives in one self-contained HTML file with inline CSS and JS:

- **Control Deck** — The setup UI: date/time inputs, a drag-and-drop media upload zone, a reorderable queue list with per-item timer controls, and a "Go Fullscreen" button.
- **Presentation** — A fullscreen overlay with:
  - **Header overlay** — Sticky top bar showing "Auction Starting In" + live countdown, switching to "Bidding is LIVE!" at zero.
  - **Stage** — Displays the current image or video with CSS opacity fade transitions.
- **Queue logic** — A JS array of `{ file, objectURL, type, seconds, useFullLength }` objects processed sequentially. Images show for a set duration; videos either play to completion or for a set duration. The queue optionally loops.

## Running

Open `auction.html` in a browser. No build or install step.
