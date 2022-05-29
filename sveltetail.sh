npm init svelte new-app &&
mv new-app/* . &&
rm -r new-app &&
npm install &&
npm install -D tailwindcss postcss autoprefixer svelte-preprocess &&
npx tailwindcss init tailwind.config.cjs -p &&
mv postcss.config.js postcss.config.cjs &&
git add . &&
git commit -m "Initial commit" &&
git push origin main &&
rm sveltetail.sh
