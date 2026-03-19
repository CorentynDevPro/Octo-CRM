import type { FastifyInstance } from 'fastify'

export async function authRoutes(app: FastifyInstance) {
  app.post('/auth/login',    async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.post('/auth/register', async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.post('/auth/logout',   async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.post('/auth/refresh',  async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.get('/auth/me',        async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
}
