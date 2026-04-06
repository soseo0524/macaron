# MACARON Website

GitHub Pages deployment is configured to serve the site from the `docs/` folder.

## Folder layout

- `동아리 홈페이지 만들기/`: working source folder
- `docs/`: GitHub Pages publish folder

## Publish on GitHub Pages

1. Create a new GitHub repository.
2. Upload the contents of this `web` folder to the repository root.
3. In GitHub, open `Settings > Pages`.
4. Under `Build and deployment`, choose:
   - `Source`: `Deploy from a branch`
   - `Branch`: `main`
   - `Folder`: `/docs`
5. Save. GitHub will publish the site and give you a public URL.

## Update the live site after editing

If you edit files in `동아리 홈페이지 만들기/`, sync them back into `docs/` before pushing:

```bash
./sync-pages.sh
```

Then commit and push again.

## Notes

- `docs/index.html` is the actual deployed entry file.
- `.nojekyll` is included so GitHub Pages serves files as a plain static site.
