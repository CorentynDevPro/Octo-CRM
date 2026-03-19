import type { FastifyInstance } from 'fastify'

export async function leadRoutes(app: FastifyInstance) {
  app.get('/crm/leads',          async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.get('/crm/leads/:id',      async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.post('/crm/leads',         async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.patch('/crm/leads/:id',    async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.delete('/crm/leads/:id',   async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.post('/crm/leads/:id/convert', async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
}
