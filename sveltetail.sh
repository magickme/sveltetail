npm init svelte new-app &&
mv new-app/* . &&
rm -r new-app &&
npm install &&
npm install -D tailwindcss postcss autoprefixer svelte-preprocess &&
npx tailwindcss init tailwind.config.cjs -p &&
mv postcss.config.js postcss.config.cjs &&
rm svelte.config.js &&
echo "import preprocess from 'svelte-preprocess';
import adapter from '@sveltejs/adapter-auto';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	preprocess: [
		preprocess({
			postcss: true,
		})
	],
	kit: {
		adapter: adapter()
	}
};

export default config;" > ./svelte.config.js &&
rm tailwind.config.cjs &&
echo "module.exports = {
  content: ['./src/**/*.{html,js,svelte,ts'],
  theme: {
    extend: {},
  },
  plugins: [],
}" > ./tailwind.config.cjs &&
echo "@tailwind base; @tailwind components; @tailwind utilities;" > ./src/app.css &&
echo "<script>import '../app.css';</script><slot />" > ./src/routes/__layout.svelte &&
git add . &&
git commit -m "Initial commit" &&
git push origin main &&
rm sveltetail.sh &&
npm run dev -- --open
