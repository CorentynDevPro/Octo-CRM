export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: [
    '@pinia/nuxt',
    '@nuxtjs/tailwindcss',
  ],
  tailwindcss: {
    configPath: '../../packages/ui/tailwind.config.ts',
  },
  runtimeConfig: {
    apiSecret: '',
    public: {
      apiBase: process.env.API_GATEWAY_URL ?? 'http://localhost:4000',
      appName: 'Octo CRM',
    },
  },
  typescript: {
    strict: true,
  },
  nitro: {
    compressPublicAssets: true,
  },
})
