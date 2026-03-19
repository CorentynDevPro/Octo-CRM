import type { FastifyInstance } from 'fastify'

export async function healthRoutes(app: FastifyInstance) {
  app.get('/health', async () => ({
    status: 'ok',
    services: {
      'auth-service':         process.env.AUTH_SERVICE_URL,
      'user-service':         process.env.USER_SERVICE_URL,
      'crm-service':          process.env.CRM_SERVICE_URL,
      'billing-service':      process.env.BILLING_SERVICE_URL,
      'notification-service': process.env.NOTIFICATION_SERVICE_URL,
    },
  }))
}
