import Fastify from 'fastify'
import cors from '@fastify/cors'
import rateLimit from '@fastify/rate-limit'

const app = Fastify({ logger: true })

await app.register(cors, {
  // TODO: restrict to trusted domains in production via ALLOWED_ORIGINS env var
  origin: process.env.ALLOWED_ORIGINS?.split(',') ?? true,
})
await app.register(rateLimit, { max: 100, timeWindow: '1 minute' })

app.get('/health', async () => ({
  status: 'ok',
  service: 'api-gateway',
  timestamp: new Date().toISOString(),
}))

// TODO: Register service proxy routes
// app.register(proxy, { upstream: process.env.AUTH_SERVICE_URL,   prefix: '/auth' })
// app.register(proxy, { upstream: process.env.USER_SERVICE_URL,   prefix: '/users' })
// app.register(proxy, { upstream: process.env.CRM_SERVICE_URL,    prefix: '/crm' })
// app.register(proxy, { upstream: process.env.BILLING_SERVICE_URL, prefix: '/billing' })

const PORT = Number(process.env.PORT ?? 4000)
app.listen({ port: PORT, host: '0.0.0.0' }, (err) => {
  if (err) { app.log.error(err); process.exit(1) }
})
