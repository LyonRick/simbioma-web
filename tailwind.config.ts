import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        'green-primary': '#2D9D78',
        'blue-primary': '#1E5F8C',
        'yellow-accent': '#F5A623',
        'gray-dark': '#2C3E50',
        'gray-medium': '#6B7280',
        'gray-light': '#F8F9FA',
      },
    },
  },
};

export default config;