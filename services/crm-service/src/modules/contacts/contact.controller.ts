import type { FastifyInstance } from 'fastify'

export async function contactRoutes(app: FastifyInstance) {
  app.get('/crm/contacts',        async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.get('/crm/contacts/:id',    async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.post('/crm/contacts',       async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.patch('/crm/contacts/:id',  async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.delete('/crm/contacts/:id', async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
}
