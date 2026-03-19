import type { FastifyInstance } from 'fastify'

export async function dealRoutes(app: FastifyInstance) {
  app.get('/crm/deals',          async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.get('/crm/deals/:id',      async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.post('/crm/deals',         async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.patch('/crm/deals/:id',    async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.delete('/crm/deals/:id',   async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
}
