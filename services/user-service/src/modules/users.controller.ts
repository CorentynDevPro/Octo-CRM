import type { FastifyInstance } from 'fastify'

export async function usersRoutes(app: FastifyInstance) {
  app.get('/users',       async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.get('/users/:id',   async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.post('/users',      async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.patch('/users/:id', async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
  app.delete('/users/:id',async (req, reply) => reply.code(501).send({ error: 'Not implemented' }))
}
