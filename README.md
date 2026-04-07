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

## Move videos to Cloudinary

To keep the repository lighter, the homepage can load videos from Cloudinary instead of local `.mp4` files.

1. Upload these videos to Cloudinary as `video` assets.
2. Copy each secure delivery URL.
3. Open `동아리 홈페이지 만들기/index.html`.
4. Fill in the `CLOUDINARY_VIDEO_URLS` object near the bottom of the file:

```js
const CLOUDINARY_VIDEO_URLS = {
  hero: "https://res.cloudinary.com/<cloud_name>/video/upload/<public_id>.mp4",
  vision: "https://res.cloudinary.com/<cloud_name>/video/upload/<public_id>.mp4",
  planning: "https://res.cloudinary.com/<cloud_name>/video/upload/<public_id>.mp4",
  hardware: "https://res.cloudinary.com/<cloud_name>/video/upload/<public_id>.mp4"
};
```

Recommended public IDs:

- `macaron/hero`
- `macaron/vision`
- `macaron/planning`
- `macaron/hardware`

After updating the URLs, run:

```bash
./sync-pages.sh
```

Then commit and push again. Once Cloudinary playback is confirmed, you can stop tracking the large local video files in Git.

To remove those tracked video files while keeping them on your computer:

```bash
./untrack-local-videos.sh
```

## Notes

- `docs/index.html` is the actual deployed entry file.
- `.nojekyll` is included so GitHub Pages serves files as a plain static site.
