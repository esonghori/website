# Repository Guidelines

## Project Structure & Module Organization

This is a static personal website hosted on GitHub Pages at `esonghori.com`.

- `index.html` contains the homepage and inline photo-navigation JavaScript.
- `style.css` supplies shared styles for the homepage and project page.
- `photos/` stores photographs and `photos.json`, whose entries contain `file` and `caption` fields.
- `narrow-corridor-llm/index.html` is the project page; `img/` holds its figures.
- `narrow-corridor-llm/gallery/` contains the synced gallery, inline styles/scripts, and PNG/GIF assets.
- Root icons, `robots.txt`, `sitemap.xml`, `CNAME`, and `.nojekyll` support branding, indexing, and hosting.

## Build, Test, and Development Commands

Run commands from the repository root. No dependency installation or build step is required.

- `python3 -m http.server 8000 --bind 127.0.0.1`: serve the site at `http://127.0.0.1:8000/`.
- `python3 -m json.tool photos/photos.json > /dev/null`: validate the photo manifest's JSON syntax.
- `git diff --check`: check changes for whitespace errors.

Use HTTP for previews because the homepage loads its photo manifest with `fetch()`.

## Coding Style & Naming Conventions

Use two-space indentation in hand-maintained HTML, CSS, JavaScript, and JSON. Match surrounding syntax: double-quoted HTML attributes and JavaScript semicolons. Use descriptive kebab-case CSS classes, such as `photo-gallery`, and camelCase JavaScript identifiers. Reuse the CSS variables in `style.css` for shared colors and dimensions. Keep photo filenames aligned with manifest entries. No formatter or linter is configured.

## Testing Guidelines

There is no automated test suite or coverage threshold. Preview `/`, `/narrow-corridor-llm/`, and `/narrow-corridor-llm/gallery/`. Check desktop and mobile layouts, including the shared stylesheet's 600px breakpoint. Verify photo navigation and captions, gallery model filters, animation toggles, links, and image loading. Inspect the browser console and network panel for errors.

## Commit & Pull Request Guidelines

Follow the history's short, capitalized imperative subjects, such as `Add SEO meta tags to hosted gallery page`. Keep commits focused. PRs should explain the change, identify affected pages, link relevant issues, and record manual checks. Include screenshots for visible changes.

## Publishing & Generated Content

Keep canonical URLs and `sitemap.xml` aligned with public routes; retain the hosting configuration in `CNAME` and `.nojekyll`. Gallery generation and deployment belong to `esonghori/narrow-corridor-llm`. Make generator changes there and review the synced output here.
