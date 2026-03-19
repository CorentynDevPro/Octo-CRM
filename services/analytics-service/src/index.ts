import Fastify from 'fastify'
const app = Fastify({ logger: true })
app.get('/health', async () => ({ status: 'ok', service: 'analytics-service' }))
const PORT = Number(process.env.PORT ?? 4006)
app.listen({ port: PORT, host: '0.0.0.0' }, (err) => { if (err) { app.log.error(err); process.exit(1) } })
